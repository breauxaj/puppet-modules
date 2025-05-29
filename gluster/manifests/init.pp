# Class: gluster
#
# This class installs the gluster package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the gluster package
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'gluster':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'gluster':
#      ensure => 'absent'
#    }
#
class gluster (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'glusterfs-server',
  }

  yumrepo { 'glusterfs-epel':
    baseurl             => 'http://download.gluster.org/pub/gluster/glusterfs/LATEST/EPEL.repo/epel-$releasever/$basearch/',
    failovermethod      => 'priority',
    enabled             => '1',
#    skip_if_unavailable => '1',
    gpgcheck            => '1',
    gpgkey              => 'http://download.gluster.org/pub/gluster/glusterfs/LATEST/EPEL.repo/pub.key',
    descr               => 'GlusterFS is a clustered file-system capable of scaling to several petabytes.',
  }

  yumrepo { 'glusterfs-noarch-epel':
    baseurl             => 'http://download.gluster.org/pub/gluster/glusterfs/LATEST/EPEL.repo/epel-$releasever/noarch',
    failovermethod      => 'priority',
    enabled             => '1',
#    skip_if_unavailable => '1',
    gpgcheck            => '1',
    gpgkey              => 'http://download.gluster.org/pub/gluster/glusterfs/LATEST/EPEL.repo/pub.key',
    descr               => 'GlusterFS is a clustered file-system capable of scaling to several petabytes.',
  }

  package { $required:
    ensure  => installed,
    require => Yumrepo['glusterfs-epel'],
  }

}
