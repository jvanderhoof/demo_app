module SshConnection
  extend ActiveSupport::Concern

  def public_key_connection(private_key_path)
    SSHKit::Backend::Netssh.configure do |ssh|
      ssh.connection_timeout = 60
      ssh.ssh_options = {
        keys: [private_key_path],
        forward_agent: false,
        user: 'ubuntu',
        auth_methods: %w(publickey)
      }
    end
    yield
  end
end