# Define: httpd::sysconfig
#
# This define sets paramters for httpd init script
#
# Parameters:
#
#  options:
#    Specify option parameters (-D)
#
#  lang:
#    Override the default language (C)
#
#  pidfile:
#    Override the default PID location
#
# Actions:
#   - Configure init scripts via sysconfig file
#
# Sample Usage:
#
#  To setup install path and hint for init scripts, use:
#
#    httpd::sysconfig { 'default':
#      options => 'PROD',
#      lang    => 'en_US.UTF-8',
#    }
#
define httpd::sysconfig (
  $options = '',
  $lang = ''
) {
  include ::httpd

  file { $::httpd::params::httpd_sysconfig:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('httpd/sysconfig.erb'),
    notify  => Service[$::httpd::params::httpd_service],
    require => Package[$::httpd::params::httpd_packages],
  }

}
