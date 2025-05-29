class profile::web::apache {
  hiera_include('profile::web::apache', '')

  $apache_config = hiera('apache::config',{})
  
  apache::config { 'default':
    servertokens         => $apache_config['servertokens'],
    pidfile              => $apache_config['pidfile'],
    keepalive            => $apache_config['keepalive'],
    maxkeepaliverequests => $apache_config['maxkeepaliverequests'],
    keepalivetimeout     => $apache_config['keepalivetimeout'],
    startservers         => $apache_config['startservers'],
    minspareservers      => $apache_config['minspareservers'],
    maxspareservers      => $apache_config['maxspareservers'],
    serverlimit          => $apache_config['serverlimit'],
    maxclients           => $apache_config['maxclients'],
    maxrequestsperchild  => $apache_config['maxrequestsperchild'],
    minsparethreads      => $apache_config['minsparethreads'],
    maxsparethreads      => $apache_config['maxsparethreads'],
    threadsperchild      => $apache_config['threadsperchild'],
    listen               => $apache_config['listen'],
    extendedstatus       => $apache_config['extendedstatus'],
    user                 => $apache_config['user'],
    group                => $apache_config['group'],
    serveradmin          => $apache_config['serveradmin'],
    servername           => $apache_config['servername'],
    usecanonicalname     => $apache_config['usecanonicalname'],
    documentroot         => $apache_config['documentroot'],
    options              => $apache_config['options'],
    allowoverride        => $apache_config['allowoverride'],
    order                => $apache_config['order'],
    allow                => $apache_config['allow'],
    deny                 => $apache_config['deny'],
    directoryindex       => $apache_config['directoryindex'],
    hostnamelookups      => $apache_config['hostnamelookups'],
    enablemmap           => $apache_config['enablemmap'],
    enablesendfile       => $apache_config['enablesendfile'],
    logformat            => $apache_config['logformat'],
    serversignature      => $apache_config['serversignature'],
    namevirtualhost      => $apache_config['namevirtualhost'],
  }

  $apache_header = hiera('apache::header',{})

  apache::header { 'default':
    headers        => $apache_header['headers'],
    requestheaders => $apache_header['requestheaders'],
  }

  $apache_legacy = hiera('apache::legacy',{})

  apache::legacy { 'default':
    includes => $apache_legacy['includes'],
  }

  $apache_service = hiera('apache::service',{})

  apache::service { 'default':
    ensure => $apache_service['ensure'],
    enable => $apache_service['enable'],
  }

  $apache_sysconfig = hiera('apache::sysconfig',{})

  apache::sysconfig { 'default':
    model   => $apache_sysconfig['model'],
    options => $apache_sysconfig['options'],
    lang    => $apache_sysconfig['lang'],
    pidfile => $apache_sysconfig['pidfile'],
  }

  $apache_virtual = hiera_hash('apache::virtual',{})
  create_resources('apache::virtual',$apache_virtual)
  
}
