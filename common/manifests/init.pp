# Class: common
#
# This class installs certain common packages
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the list of packages
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'common':
#      ensure => 'latest'
#    }
#
class common (
  $ensure = $::common::params::common_package_ensure
) inherits ::common::params {
  package { $::common::params::common_packages:
    ensure  => $ensure,
  }

  $role = hiera('role','undefined')

  if $role {
    file { '/etc/role':
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => $role,
    }
  }

  $crons = hiera_hash('crons',{})
  create_resources('cron',$crons)

  $execs = hiera_hash('execs',{})
  create_resources('exec',$execs)

  $files = hiera_hash('files',{})
  create_resources('file',$files)

  $groups = hiera_hash('groups',{})
  create_resources('group',$groups)

  $hosts = hiera_hash('hosts',{})
  create_resources('host',$hosts)

  $keys = hiera_hash('ssh_authorized_keys',{})
  create_resources('ssh_authorized_key',$keys)

  $mounts = hiera_hash('mounts',{})
  create_resources('mount',$mounts)

  $users = hiera_hash('users',{})
  create_resources('user',$users)

  common::role { 'default': }

}
