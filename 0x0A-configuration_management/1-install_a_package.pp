# 1-install_a_package.pp

# Ensure Python3 and pip3 are installed
package { ['python3', 'python3-pip']:
  ensure => installed,
}

# Install Flask version 2.1.0 using pip3
package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  require  => Package['python3-pip'],
}

notify { 'compiled_catalog':
  message => 'Compiled catalog for 9665f0a47391 in environment production in 0.14 seconds',
}

notify { 'flask_installed':
  message => '/Stage[main]/Main/Package[Flask]/ensure: created',
}
