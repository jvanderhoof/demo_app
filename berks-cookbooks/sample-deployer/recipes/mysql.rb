mysql_service 'default' do
  port '3306'
  bind_address '127.0.0.1'
  version '5.6'
  initial_root_password 'password' # this of course would be secured in the real world
  action [:create, :start]
end
