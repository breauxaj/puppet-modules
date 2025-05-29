define nfs::client::mount (
  $mount,
  $device,
  $options,
  $atboot
) {
  file { $mount:
    ensure => directory,
  }

  mount { $mount:
    ensure  => 'mounted',
    device  => $device,
    fstype  => 'nfs',
    options => $options,
    atboot  => $atboot,
    require => File[$mount],
  }

}
