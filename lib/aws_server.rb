class AwsServer
  attr_accessor :region, :image_id, :image_size

  def destroy(instance_id)
    connection.servers.get(instance_id).destroy
  end

  def initialize(image_size='t1.micro', region='us-east-1', image_id='ami-92e697fa')
    self.region = region
    self.image_id = image_id
    self.image_size = image_size
  end

  def connection
    @connection ||= Fog::Compute.new({
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: self.region
    })
  end

  def setup(args={})
    {
      image_id: self.image_id,
      flavor_id: self.image_size,
      username: 'ubuntu',
      private_key_path: ENV['PRIVATE_KEY_PATH'],
      public_key_path: ENV['PUBLIC_KEY_PATH'],
      groups: security_groups
    }.merge(args)
  end

  def security_groups
    unless sg = connection.security_groups.get('base-http')
      sg = connection.security_groups.create(name: 'base-http', description: 'base http security')
      sg.authorize_port_range(80..80, {:cidr_ip => '0.0.0.0/0'})
    end
    ['default', sg.name]
  end

  def create(args={})
    server = connection.servers.bootstrap(self.setup(args))
    server.wait_for { ready? }
    server
  end

end
