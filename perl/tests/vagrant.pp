node default {
  include ::perl

  case $::operatingsystem {
    'Amazon': {
        Package { allow_virtual => false }
    }
    default: {}
  }

  case $::osfamily {
    'Debian': {
      perl::modules { 'libxs-object-magic-perl': }
    }
    'RedHat': {
      perl::modules { 'perl-libwww-perl': }  
    }
    default: { }
  }
}
