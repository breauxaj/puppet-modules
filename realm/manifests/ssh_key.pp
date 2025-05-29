class realm::ssh_key {
  include ::users
  
  $realm_ssh_keys = hiera_hash('realm::ssh_keys',{})
  create_resources('users::add_ssh_key',$realm_ssh_keys)

}
