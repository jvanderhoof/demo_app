name             'backcountry-project'
maintainer       'Jason Vanderhoof'
maintainer_email 'jvanderhoof@gmail.com'
license          'All rights reserved'
description      'Installs/Configures backcountry-project'
long_description 'Installs/Configures backcountry-project'
version          '0.1.0'

depends 'apt'
depends 'apache2', '~> 3.0.0'
depends 'mysql', '~> 6.0'
depends 'user'

%w{ubuntu}.each do |os|
  supports os
end


attribute 'backcountry-project/required_app_memory',
  :display_name => 'Required Application Memory',
  :type => 'string',
  :required => 'optional',
  :default => '150'

attribute 'backcountry-project/rails_environment',
  :display_name => 'Environment',
  :type => 'string',
  :required => 'optional',
  :default => 'development'

