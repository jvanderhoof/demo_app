require 'sshkit/dsl'

class ConfigureServerJob < ActiveJob::Base
  include SshConnection
  queue_as :default

  def perform(server_ips, server_id)
    server = Server.find(server_id)
    server.update_status "Begin Configuring server with Hello World"

    public_key_connection(ENV['PRIVATE_KEY_PATH']) do
      on [*server_ips] do
        execute :sudo, "apt-get install -y apache2"
        upload! StringIO.new("<html><body><h2>Hello XXXXXXXXXXXX.com</h2></body></html>"), '/tmp/index.html'
        execute :sudo, "mv /tmp/index.html /var/www/html/index.html"
        execute :sudo, "chown -R www-data:www-data /var/www/html"
        execute :sudo, "/etc/init.d/apache2 restart"
      end
    end

    server.update_status "Configuration Completed"
  end

end



