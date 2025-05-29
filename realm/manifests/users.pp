class realm::users {
  include ::users
  
  $realm_users = hiera_hash('realm::users',{})
  create_resources('users::add_user',$realm_users)

  $realm_ldap_users = hiera_hash('realm::ldap_users',{})
  create_resources('users::add_ldap_user',$realm_ldap_users)

}
