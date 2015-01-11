namespace :deploy do

  task :configure => [:environment] do
    ConfigureServerJob.new.perform(['54.89.48.84'])
  end

  task :create => [:environment] do
    LaunchServerJob.new.perform(1, ConfigureServerJob)
    LaunchServerJob.perform_later(server.id, ConfigureServerJob)
  end
end