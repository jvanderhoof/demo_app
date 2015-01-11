
%w{ruby1.9.1-dev libmysqlclient-dev build-essential}.each do |pkg|
  package pkg
end

gem_package 'bundler'
