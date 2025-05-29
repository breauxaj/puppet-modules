class realm::hosts {
  $realm_hosts = hiera_hash('realm::hosts',{})
  create_resources('host',$realm_hosts)

}
