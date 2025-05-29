class profile::core::file {
  $file_config = hiera('file::config',{})
  create_resources('file',$file_config)

}
