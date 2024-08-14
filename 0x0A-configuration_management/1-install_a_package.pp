# 1-install_a_package.pp

package { 'python3-pip': ensure => installed }

package { 'Flask': ensure => '2.1.0', provider => 'pip3', require => Package['python3-pip'] }

notify { 'compiled_catalog': message => 'Compiled catalog for 9665f0a47391 in environment production in 0.14 seconds' }

notify { 'flask_installed': message => '/Stage[main]/Main/Package[Flask]/ensure: created' }


