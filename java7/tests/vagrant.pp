node default {
  include ::java7
  include ::java7::devel

  case $::operatingsystem {
    'Amazon': {
        Package { allow_virtual => false }
    }
    default: {}
  }

}