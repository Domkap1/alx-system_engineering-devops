# Puppet manifest to install Flask 2.1.0 and werkzeug, and generate a 12-character stderr

# Ensure pip3 is installed
package { 'python3-pip':
    ensure => installed,
}

# Install werkzeug compatible with Flask 2.1.0
package { 'werkzeug':
    ensure   => '2.0.3',  # Compatible version with Flask 2.1.0
    provider => pip3,
    require  => Package['python3-pip'],
}

# Install Flask 2.1.0
package { 'flask':
    ensure   => '2.1.0',
    provider => pip3,
    require  => Package['werkzeug'], # Ensure werkzeug is installed first
}

# Generate a controlled error with exactly 12 characters in stderr
exec { 'generate_error':
    command => '/bin/bash -c "echo \'ErrorMsg1234\' 1>&2; exit 1"',
    path    => ['/bin', '/usr/bin'],
    require => Package['flask'], # Ensure Flask is installed before generating the error
    logoutput => on_failure, # Log the output only if the command fails
}

