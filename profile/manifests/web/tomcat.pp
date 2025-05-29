class profile::web::tomcat {
  hiera_include('profile::web::tomcat', '')

  $tomcat_config = hiera('tomcat::config',{})

  tomcat::config { 'default':
    runas         = $tomcat_config['runas'],
    catalina_home = $tomcat_config['catalina_home'],
    catalina_base = $tomcat_config['catalina_base'],
    java_opts     = $tomcat_config['java_opts'],
  }

  $tomcat_instance = hiera('tomcat::instance',{})

  tomcat::instance { 'default':
    owner         => $tomcat_instance['owner'],
    group         => $tomcat_instance['group'],
    catalina_home => $tomcat_instance['catalina_home'],
    catalina_base => $tomcat_instance['catalina_base'],
  }

  $tomcat_service = hiera('tomcat::service',{})

  tomcat::service { 'default':
    ensure => $tomcat_service['ensure'],
    enable => $tomcat_service['enable'],
  }

}
