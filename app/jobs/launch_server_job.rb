class LaunchServerJob < ActiveJob::Base
  queue_as :default

  def perform(server_id, next_job)
    server = Server.find(server_id)
    server.update_status "Launching Server in #{server.provider}"
    aws_server = ::AwsServer.new.create

    Rails.logger.info "aws_server: #{aws_server.to_yaml}"

    server.update_attributes(
      provider_identifier: aws_server.id,
      public_ip: aws_server.public_ip_address,
      private_ip: aws_server.private_ip_address,
      summary: aws_server.to_yaml
    )

    server.update_status "Server provisioned, begin configuration"

    next_job.constantize.send(:perform_later, aws_server.public_ip_address, server_id)

  end
end
