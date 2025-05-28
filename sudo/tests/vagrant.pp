node default {
  include ::sudo

  sudo::rule { 'admin':
    ensure   => present,
    priority => '000',
    content  => '%admin ALL=(ALL) NOPASSWD: ALL',
  }

}