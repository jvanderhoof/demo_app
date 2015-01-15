name             'sample-deployer'
maintainer       'Jason Vanderhoof'
maintainer_email 'jvanderhoof@gmail.com'
license          'All rights reserved'
description      'Installs/Configures sample-deployer'
long_description 'Installs/Configures sample-deployer'
version          '0.1.0'

depends 'apt'
depends 'apache2', '~> 3.0.0'
depends 'mysql', '~> 6.0'
depends 'user'

%w{ubuntu}.each do |os|
  supports os
end


attribute 'sample-deployer/rails_environment',
  :display_name => 'Environment',
  :type => 'string',
  :required => 'optional',
  :default => 'development'

