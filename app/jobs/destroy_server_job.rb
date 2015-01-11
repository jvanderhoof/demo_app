class DestroyServerJob < ActiveJob::Base
  queue_as :default

  def perform(server_id)
    server = Server.find(server_id)
    server.update_status "Destroying Server"
    if server.provider_identifier
      ::AwsServer.new.destroy(server.provider_identifier)
    end
    server.update_status "Server Destroyed"
    server.destroy
  end
end
