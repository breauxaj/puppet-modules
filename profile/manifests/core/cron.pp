class profile::core::cron {
  $cron_config = hiera('cron::config',{})
  create_resources('cron',$cron_config)

}
