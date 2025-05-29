# Class: mariadb10
#
# This class installs MariaDB 10.1
#
# Parameters:
#
#  ensure: (default latest)
#    Determine which version to install
#
# Actions:
#   - Install MariaDB 10.1
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'mariadb10': }
#
class mariadb10 (
  $ensure = 'latest'
) inherits ::mariadb10::params {
  package { $::mariadb10::params::mariadb_package:
    ensure  => $ensure,
    require => Yumrepo['mariadb'],
  }

  package { $::mariadb10::params::mariadb_conflicts:
    ensure => absent,
    before => Package[$::mariadb10::params::mariadb_package],
  }

  file { $::mariadb10::params::mariadb_tuner_script:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source => 'puppet:///modules/mariadb10/mysqltuner.pl',
    require => Package[$::mariadb10::params::mariadb_package],
  }

}
