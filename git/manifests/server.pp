# Class: git::server
#
# This class configures a git server, for use with gitolite
#
# Parameters:
#
# Actions:
#   - Creates a git user
#   - Adds and manages .ssh, bin and repositories folders
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'git::server': }
#
class git::server {
  group { 'git':
    ensure => present,
    gid    => 333,
  }

  user { 'git':
    ensure     => present,
    gid        => 333,
    home       => '/var/git',
    shell      => '/bin/bash',
    managehome => true,
    uid        => 333,
  }

  file { '/var/git/.ssh':
    ensure  => directory,
    owner   => 'git',
    group   => 'git',
    mode    => '0700',
    require => [ User['git'], Group['git'] ],
  }

  file { '/var/git/.ssh/authorized_keys':
    ensure  => present,
    owner   => 'git',
    group   => 'git',
    mode    => '0600',
    require => File['/var/git/.ssh'],
  }

  file { '/var/git/bin':
    ensure  => directory,
    owner   => 'git',
    group   => 'git',
    mode    => '0755',
    require => [ User['git'], Group['git'] ],
  }

  file { '/var/git/repositories':
    ensure  => directory,
    owner   => 'git',
    group   => 'git',
    mode    => '0750',
    require => [ User['git'], Group['git'] ],
  }

}
