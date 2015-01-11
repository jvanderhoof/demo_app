json.array!(@servers) do |server|
  json.extract! server, :id, :name, :status, :provider, :resource_type, :provider_identifier, :public_ip, :private_ip, :summary
  json.url server_url(server, format: :json)
end
