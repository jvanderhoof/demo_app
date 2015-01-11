#
# Cookbook Name:: backcountry-project
# Recipe:: default
#
# Copyright (C) 2015 Jason Vanderhoof
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt::default'

include_recipe 'backcountry-project::mysql'
include_recipe 'backcountry-project::ruby'

include_recipe 'backcountry-project::application'

