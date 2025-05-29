# Class: php56w::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class php56w::params {
  case $::osfamily {
    'redhat': {
      case $::lsbmajdistrelease {
        '7': {
          file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-webtatic-el7':
            ensure => present,
            owner  => 'root',
            group  => 'root',
            mode   => '0644',
            source => 'puppet:///modules/php56w/RPM-GPG-KEY-webtatic-el7',
          }

          yumrepo { 'webtatic':
            mirrorlist     => 'https://mirror.webtatic.com/yum/el7/$basearch/mirrorlist',
            failovermethod => 'priority',
            enabled        => '1',
            gpgcheck       => '1',
            gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-webtatic-el7',
            descr          => 'Webtactic',
            require        => File[ '/etc/pki/rpm-gpg/RPM-GPG-KEY-webtatic-el7' ]
          }

        }
        default: {          
          file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-webtatic-andy':
            ensure => present,
            owner  => 'root',
            group  => 'root',
            mode   => '0644',
            source => 'puppet:///modules/php56w/RPM-GPG-KEY-webtatic-andy',
          }

          yumrepo { 'webtatic':
            mirrorlist     => 'https://mirror.webtatic.com/yum/el6/$basearch/mirrorlist',
            failovermethod => 'priority',
            enabled        => '1',
            gpgcheck       => '1',
            gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-webtatic-andy',
            descr          => 'Webtactic',
            require        => File[ '/etc/pki/rpm-gpg/RPM-GPG-KEY-webtatic-andy' ]
          }

        }
      }
    }
    default: { }
  }

  $php56w_packages = [
    'php56w',
    'php56w-bcmath',
    'php56w-cli',
    'php56w-common',
    'php56w-dba',
    'php56w-devel',
    'php56w-fpm',
    'php56w-gd',
    'php56w-intl',
    'php56w-ldap',
    'php56w-mbstring',
    'php56w-mcrypt',
    'php56w-mssql',
    'php56w-mysql',
    'php56w-opcache',
    'php56w-pdo',
    'php56w-pear',
    'php56w-process',
    'php56w-xml'
  ]

  file { '/etc/httpd/conf.d/php.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('php56w/php.erb'),
  }

}
