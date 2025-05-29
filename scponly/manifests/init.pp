class scponly (
  $version = '4.8-1'
){
  $source = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'http://dl.marmotte.net/rpms/redhat',
  }

  package { 'scponly':
    ensure   => installed,
    provider => rpm,
    source   => "${source}/el6/${::hardwaremodel}/scponly-${version}.el6/scponly-${version}.el6.${::hardwaremodel}.rpm",
  }

}
