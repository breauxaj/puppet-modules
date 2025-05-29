class realm::sudo {
  include ::sudo
  
  $realm_sudo = hiera_hash('realm::sudo',{})
  create_resources('sudo::config',$realm_sudo)

}