# Class: composer
#
# This class downloads composer
#
# Parameters:
#
#  source: (default https://getcomposer.org/composer.phar )
#    Location of the download
#
# Actions:
#   - Install Composer
#   - Make composer.phar executable
#   - Symlink composer.phar to composer
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'composer': }
#
#  To specify an alternate download link, use:
#
#    class { 'composer':
#      source => 'http://alternate.domain.tld/composer.phar'
#    }
#
class composer (
  $source = 'https://getcomposer.org/composer.phar'
){
  exec { 'get-composer':
    path    => '/bin:/usr/bin',
    command => "wget ${source}",
    cwd     => '/usr/local/bin',
    creates => '/usr/local/bin/composer.phar',
    timeout => 10000,
    onlyif  => "test ! -f /usr/local/bin/composer.phar",
  }

  file { '/usr/local/bin/composer.phar':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Exec['get-composer'],
  }

  file { '/usr/local/bin/composer':
    ensure  => 'link',
    owner   => 'root',
    group   => 'root',
    target  => "/usr/local/bin/composer.phar",
    require => Exec['get-composer'],
  }

  file { '/etc/profile.d/composer.sh':
    ensure => 'absent'
  }

  file { '/usr/local/composer':
    ensure => 'absent',
    force  => true
  }

}
