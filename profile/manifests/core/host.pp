class profile::core::host {
  $host_config = hiera('host::config',{})
  create_resources('host',$host_config)

}
