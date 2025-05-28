# Class: nagios
#
# This class installs Nagios
#
# Parameters:
#
# Actions:
#   - Installs the nagios package
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'nagios': }
#
class nagios (
  $ensure = $::nagios::params::nagios_package_ensure
) inherits ::nagios::params {
  package { $::nagios::params::nagios_package:
    ensure => $ensure,
  }

  $cgi = hiera_hash('nagios_cgi',{})
  create_resources('nagios::cgi',$cgi)

  $commands = hiera_hash('nagios_command',{})
  create_resources('nagios_command',$commands)

  $config = hiera_hash('nagios_config',{})
  create_resources('nagios::config',$config)

  $contacts = hiera_hash('nagios_contact',{})
  create_resources('nagios_contact',$contacts)

  $contactgroups = hiera_hash('nagios_contactgroup',{})
  create_resources('nagios_contactgroup',$contactgroups)

  $hosts = hiera_hash('nagios_host',{})
  create_resources('nagios_host',$hosts)

  $hostdependencies = hiera_hash('nagios_hostdependency',{})
  create_resources('nagios_hostdependency',$hostdependencies)

  $hostescalations = hiera_hash('nagios_hostescalation',{})
  create_resources('nagios_hostescalation',$hostescalations)

  $hostextinfos = hiera_hash('nagios_hostextinfo',{})
  create_resources('nagios_hostextinfo',$hostextinfos)

  $hostgroups = hiera_hash('nagios_hostgroup',{})
  create_resources('nagios_hostgroup',$hostgroups)

  $passwd = hiera_hash('nagios_passwd',{})
  create_resources('nagios::passwd',$passwd)

  $services = hiera_hash('nagios_service',{})
  create_resources('nagios_service',$services)

  $servicedependencies = hiera_hash('nagios_servicedependency',{})
  create_resources('nagios_servicedependency',$servicedependencies)

  $serviceescalations = hiera_hash('nagios_serviceescalation',{})
  create_resources('nagios_serviceescalation',$serviceescalations)

  $serviceextinfos = hiera_hash('nagios_serviceextinfo',{})
  create_resources('nagios_serviceextinfo',$serviceextinfos)

  $servicegroups = hiera_hash('nagios_servicegroup',{})
  create_resources('nagios_servicegroup',$servicegroups)

  $timeperiods = hiera_hash('nagios_timeperiod',{})
  create_resources('nagios_timeperiod',$timeperiods)

  service { $::nagios::params::nagios_service:
    ensure  => running,
    enable  => true,
    require => Package[$::nagios::params::nagios_package],
  }

}
