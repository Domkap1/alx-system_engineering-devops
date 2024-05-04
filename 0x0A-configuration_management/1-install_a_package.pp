# Install Flask version 2.1.0 using pip3
package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  require  => Package['python3-pip'],
}

exec { 'display_output':
  command     => 'echo "Flask 2.1.0"',
  path        => ['/usr/bin'],
  refreshonly => true,
}