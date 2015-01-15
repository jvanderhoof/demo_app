#
# Cookbook Name:: sample-deployer
# Recipe:: default
#
# Copyright (C) 2015 Jason Vanderhoof
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt::default'

include_recipe 'sample-deployer::mysql'
include_recipe 'sample-deployer::ruby'

include_recipe 'sample-deployer::application'

