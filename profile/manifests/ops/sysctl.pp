class profile::ops::sysctl {
  include ::sysctl

  $sysctl_config = hiera('sysctl::config',{})
  create_resources('sysctl::config',$sysctl_config)

}
