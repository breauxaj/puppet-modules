class realm::groups {
  include ::users
  
  $realm_groups = hiera_hash('realm::groups',{})
  create_resources('users::add_group',$realm_groups)

}
