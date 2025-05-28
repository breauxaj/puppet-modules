# Class: drush
#
# This class downloads drush from github release
#
# Parameters:
#
#  ensure: (default latest aka 8)
#    version to utilize
#
# Actions:
#   - Download Drush from github archives
#   - Add location to path
#
# Requires:
#
#  Composer
#  PHP (php-process, php-xml)
#
#  Version 8 requires PHP 5.4.5+
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'drush': }
#
#  To specify an alternate download link, use:
#
#    class { 'drush':
#      ensure => 'latest'
#    }
#
class drush (
  $ensure = 'latest'
) inherits ::drush::params {
  case $ensure {
    '6': {
      exec { 'get-drush6':
        path    => '/bin:/usr/bin',
        command => "curl -o drush.tar.gz ${drush_6}",
        cwd     => '/tmp',
        creates => '/tmp/drush.tar.gz',
        timeout => 10000,
        onlyif  => 'test ! -f /usr/local/drush/drush',
      }

      exec { 'untar-drush6':
        path    => '/bin:/usr/bin',
        command => 'tar -zxf /tmp/drush.tar.gz -C /usr/local/drush --strip-components=1',
        cwd     => '/usr/local',
        creates => '/usr/local/drush/drush',
        timeout => 10000,
        require => [
          Exec['get-drush6'],
          File['/usr/local/drush'],
        ],
      }

      exec { 'composer-drush6':
        path    => '/bin:/usr/bin',
        command => '/usr/local/bin/composer install',
        cwd     => '/usr/local/drush',
        creates => '/usr/local/drush/vendor',
        timeout => 10000,
        require => Exec['untar-drush6'],
      }

    }
    '8', 'latest': {
      exec { 'get-drush8':
        path    => '/bin:/usr/bin',
        command => "curl -o drush.tar.gz ${drush_8}",
        cwd     => '/tmp',
        creates => '/tmp/drush.tar.gz',
        timeout => 10000,
        onlyif  => 'test ! -f /usr/local/drush/drush',
      }

      exec { 'untar-drush8':
        path    => '/bin:/usr/bin',
        command => 'tar -zxf /tmp/drush.tar.gz -C /usr/local/drush --strip-components=1',
        cwd     => '/usr/local',
        creates => '/usr/local/drush/drush',
        timeout => 10000,
        require => [
          Exec['get-drush8'],
          File['/usr/local/drush'],
        ],
      }

      exec { 'composer-drush8':
        path    => '/bin:/usr/bin',
        command => '/usr/local/bin/composer install',
        cwd     => '/usr/local/drush',
        creates => '/usr/local/drush/vendor',
        timeout => 10000,
        require => Exec['untar-drush8'],
      }

    }
    default: {
      exec { 'get-drush7':
        path    => '/bin:/usr/bin',
        command => "curl -o drush.tar.gz ${drush_7}",
        cwd     => '/tmp',
        creates => '/tmp/drush.tar.gz',
        timeout => 10000,
        onlyif  => 'test ! -f /usr/local/drush/drush',
      }

      exec { 'untar-drush7':
        path    => '/bin:/usr/bin',
        command => 'tar -zxf /tmp/drush.tar.gz -C /usr/local/drush --strip-components=1',
        cwd     => '/usr/local',
        creates => '/usr/local/drush/drush',
        timeout => 10000,
        require => [
          Exec['get-drush7'],
          File['/usr/local/drush'],
        ],
      }

      exec { 'composer-drush7':
        path    => '/bin:/usr/bin',
        command => '/usr/local/bin/composer install',
        cwd     => '/usr/local/drush',
        creates => '/usr/local/drush/vendor',
        timeout => 10000,
        require => Exec['untar-drush7'],
      }

    }
  }

  file { '/usr/local/drush':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/etc/profile.d/drush.sh':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/drush/profile.txt',
  }

}
