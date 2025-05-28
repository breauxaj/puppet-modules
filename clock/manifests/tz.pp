# Define: clock::tz
#
# This define sets the Timezone
#
# Parameters:
#
#  timezone: 
#    Set the host timezone
#
# Actions:
#   - Set the timezone
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    clock::tz { 'default':
#      timezone => 'America/New_York'
#    }
#
define clock::tz (
  $timezone
) {
  $prefix = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/usr/share/zoneinfo',
  }
  
  if $::osfamily == 'RedHat' {
    file { '/etc/sysconfig/clock':
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => "ZONE=\"${timezone}\"\n",
    }
    
    file { '/etc/localtime': 
      ensure => present, 
      owner  => 'root', 
      group  => 'root', 
      mode   => '0644', 
      source => "${prefix}/${timezone}",
    }
  }

}
