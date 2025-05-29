class profile::cache::varnish {
  include ::varnish

  $varnish_service = hiera('varnish::service',{})
  create_resources('varnish::service',$varnish_service)

  $varnish_sysconfig = hiera('varnish::sysconfig',{})
  create_resources('varnish::sysconfig',$varnish_sysconfig)

}
