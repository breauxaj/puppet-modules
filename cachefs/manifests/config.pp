define cachefs::config (
  $dir = $::cachefs::params::cachefs_dir,
  $tag = $::cachefs::params::cachefs_tag,
  $brun = $::cachefs::params::cachefs_brun,
  $bcull = $::cachefs::params::cachefs_bcull,
  $bstop = $::cachefs::params::cachefs_bstop,
  $frun = $::cachefs::params::cachefs_frun,
  $fcull = $::cachefs::params::cachefs_fcull,
  $fstop = $::cachefs::params::cachefs_fstop
) {
  include ::cachefs

  file { $::cachefs::params::cachefs_conf:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('cachefs/cachefilesd.erb'),
    notify  => Service[$::cachefs::params::cachefs_service],
  }

}
