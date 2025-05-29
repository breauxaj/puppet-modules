class profile::ops::nfs {
  hiera_include('profile::ops::nfs', '')

  $nfs_client_config = hiera('nfs::client::config',{})

  nfs::client::config { 'default':
    defaultvers => $nfs_client_config['defaultvers'],
  }

  $nfs_client_mount = hiera('nfs::client::mount',{})

  nfs::client::mount { 'default':
    mount   => $nfs_client_mount['mount'],
    device  => $nfs_client_mount['device'],
    options => $nfs_client_mount['options'],
    atboot  => $nfs_client_mount['atboot'],
  }

  $nfs_client_service = hiera('nfs::client::service',{})

  nfs::client::service { 'default':
    ensure => $nfs_client_service['ensure'],
    enable => $nfs_client_service['enable'],
  }

  $nfs_server_exports = hiera('nfs::server::exports',{})

  nfs::server::exports { 'default':
    exports => $nfs_server_exports['exports'],
  }
  
  $nfs_server_service = hiera('nfs::server::service',{})

  nfs::server::service { 'default':
    ensure => $nfs_server_service['ensure'],
    enable => $nfs_server_service['enable'],
  }

}
