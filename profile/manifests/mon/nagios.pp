class profile::mon::nagios {
  hiera_include('profile::mon::nagios', '')

  $nagios_service = hiera('nagios::service',{})
  create_resources('nagios::service',$nagios_service)

}
