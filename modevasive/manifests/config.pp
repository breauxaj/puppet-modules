define modevasive::config (
  $doshashtablesize = '3097',
  $dospagecount = '2',
  $dossitecount = '50',
  $dospageinterval = '1',
  $dossiteinterval = '1',
  $dosblockingperiod = '10',
  $dosemailnotify = '',
  $dossystemcommand = '',
  $doslogdir = '',
  $doswhitelist = ''
) {
  include ::modevasive

  file { $::modevasive::params::modevasive_conf:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('modevasive/config.erb'),
  }

}