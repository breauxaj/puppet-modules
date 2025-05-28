define authconfig::sssd::config (
  $domains,
  $ldap_uri,
  $ldap_search_base,
  $ldap_user_search_base,
  $ldap_group_search_base,
  $ldap_default_bind_dn,
  $krb5_realm,
  $krb5_server,
  $krb5_kpasswd,
  $ldap_schema = 'rfc2307bis',
  $ldap_referrals = 'False',
  $ldap_user_object_class = 'user',
  $ldap_group_object_class = 'group',
  $ldap_user_name = 'sAMAccountName',
  $ldap_user_home_directory = 'unixHomeDirectory',
  $ldap_user_member_of = 'memberOf',
  $ldap_access_order = 'expire',
  $ldap_account_expire_policy = 'ad',
  $ldap_force_upper_case_realm = 'True',
  $ldap_id_use_start_tls = 'False',
  $ldap_default_authtok_type = 'password',
  $ldap_default_authtok = '$PASSWORD'
  $ldap_tls_cacertdir = '/etc/openldap/cacerts',
  $krb5_canonicalize = 'False'
) {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      'sssd',
      'oddjob',
      'oddjob-mkhomedir'
    ],
  }

  $removed = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      'nss-pam-ldapd',
      'pam_ldap'
    ],
  }

  $sssd_conf = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/sssd/sssd.conf',
  }

  $krb5_conf = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/krb5.conf',
  }

  package { $removed:
    ensure => absent,
    before => Package[$required],
  }

  package { $required: ensure  => installed }

  file { $sssd_conf:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('authconfig/sssd/sssd.erb'),
  }

  file { $krb5_conf:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('authconfig/sssd/krb5.erb'),
  }

  exec { 'authconfig-sssd':
    path    => '/bin:/usr/bin:/usr/sbin',
    command => 'authconfig --enablesssd --enablesssdauth --disableldap --disableldapauth --disablekrb5 --update',
    require => Package[$required],
  }

}
