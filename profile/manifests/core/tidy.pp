class profile::core::tidy {
  $tidy_config = hiera('tidy::config',{})
  create_resources('tidy',$tidy_config)

}
