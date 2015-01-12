namespace :deploy do

  task :configure => [:environment] do
    ConfigureServerJob.new.perform(['54.89.48.84'])
  end

  task :create => [:environment] do
    server = Server.new(name: 'test 1', provider: 'AWS', resource_type: 'Hello World Server')
    server.save
    LaunchServerJob.new.perform(server.id, 'test')
    #LaunchServerJob.new.perform(1, ConfigureServerJob)
    #LaunchServerJob.perform_later(server.id, ConfigureServerJob)
  end
end