class modevasive (
  $ensure = 'latest'
) inherits ::modevasive::params {
  package { $::modevasive::params::modevasive_package:
    ensure  => $ensure,
  }

  notify { 'evasive_on_httpd_version':
    message => ">>> evasive_on_httpd_version is '${::evasive_on_httpd_version}'"
  }

}
