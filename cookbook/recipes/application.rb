execute "bundle install" do
  cwd '/opt/app_code'
  user 'vagrant'
end

['db:create', 'db:migrate'].each do |cmd|
  execute "bundle exec rake #{cmd}" do
    environment 'RAILS_ENV' => node['sample-deployer']['rails_environment']
    cwd '/opt/app_code'
    user 'vagrant'
  end
end

[
  'thin -p 8080 -P tmp/pids/thin.pid -l log/thin.log -d start',
  'bin/delayed_job start'
].each do |cmd|
  execute cmd do
    environment 'RAILS_ENV' => node['sample-deployer']['rails_environment']
    cwd '/opt/app_code'
    user 'vagrant'
  end
end