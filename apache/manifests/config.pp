define apache::config (
  $servertokens = 'Prod',
  $pidfile = 'run/httpd.pid',
  $keepalive = 'Off',
  $maxkeepaliverequests = '100',
  $keepalivetimeout = '15',
  $startservers = '8',
  $minspareservers = '5',
  $maxspareservers = '20',
  $serverlimit = '256',
  $maxclients = '256',
  $maxrequestsperchild = '4000',
  $minsparethreads = '25',
  $maxsparethreads = '75',
  $threadsperchild = '25',
  $listen = [ '80' ],
  $extendedstatus = '',
  $user = 'apache',
  $group = 'apache',
  $serveradmin = '',
  $servername = '',
  $usecanonicalname = 'Off',
  $documentroot = '/var/www/html',
  $options = [ 'Indexes', 'FollowSymLinks' ],
  $allowoverride = [ 'None' ],
  $order = 'allow,deny',
  $allow = [ 'all' ],
  $deny = '',
  $directoryindex = [ 'index.html', 'index.html.var' ],
  $hostnamelookups = 'Off',
  $enablemmap = 'Off',
  $enablesendfile = 'Off',
  $logformat = '',
  $serversignature = 'On',
  $namevirtualhost = [ '*:80' ]
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'httpd',
  }

  file { '/etc/httpd/conf/httpd.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('apache/httpd.erb'),
    notify  => Service[$service],
  }

}
