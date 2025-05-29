class realm::timezone {
  include ::clock
  
  $realm_clock = hiera('realm::clock',{})
  
  clock::tz { 'default':
    timezone => $realm_clock['timezone']
  }

}

