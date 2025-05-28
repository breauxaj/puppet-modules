define common::role {
  $profiles = hiera_array("${::role}",[])
  common::profile{ $profiles: }

}