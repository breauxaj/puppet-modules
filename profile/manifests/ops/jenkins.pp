class profile::ops::jenkins {
  hiera_include('profile::ops::jenkins', '')

  $jenkins_service = hiera('jenkins::service',{})

  jenkins::service { 'default':
    ensure => $jenkins_service['ensure'],
    enable => $jenkins_service['enable'],
  }

}
