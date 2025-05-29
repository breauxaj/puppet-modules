# Class: php55w::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class php55w::params {
  case $::osfamily {
    'redhat': {
      case $::lsbmajdistrelease {
        '7': {
          file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-webtatic-el7':
            ensure => present,
            owner  => 'root',
            group  => 'root',
            mode   => '0644',
            source => 'puppet:///modules/php55w/RPM-GPG-KEY-webtatic-el7',
          }

          yumrepo { 'webtatic':
            mirrorlist     => 'https://mirror.webtatic.com/yum/el7/$basearch/mirrorlist',
            failovermethod => 'priority',
            enabled        => '1',
            gpgcheck       => '1',
            gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-webtatic-el7',
            descr          => 'Webtactic',
          }

        }
        default: {          
          file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-webtatic-andy':
            ensure => present,
            owner  => 'root',
            group  => 'root',
            mode   => '0644',
            source => 'puppet:///modules/php55w/RPM-GPG-KEY-webtatic-andy',
          }

          yumrepo { 'webtatic':
            mirrorlist     => 'https://mirror.webtatic.com/yum/el6/$basearch/mirrorlist',
            failovermethod => 'priority',
            enabled        => '1',
            gpgcheck       => '1',
            gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-webtatic-andy',
            descr          => 'Webtactic',
          }

        }
      }
    }
    default: { }
  }

  $php55w_packages = [
    'php55w',
    'php55w-bcmath',
    'php55w-cli',
    'php55w-common',
    'php55w-dba',
    'php55w-devel',
    'php55w-fpm',
    'php55w-gd',
    'php55w-intl',
    'php55w-mbstring',
    'php55w-mcrypt',
    'php55w-mssql',
    'php55w-mysql',
    'php55w-opcache',
    'php55w-pdo',
    'php55w-pear',
    'php55w-process',
    'php55w-xml'
  ]

  file { '/etc/httpd/conf.d/php.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('php55w/php.erb'),
  }

}
