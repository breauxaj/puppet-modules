# Class: devel::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class devel::params {
  case $::osfamily {
    'redhat': {
      $devel_package = [
        'autoconf',
        'automake',
        'bison',
        'bzip2',
        'gcc-c++',
        'iconv-devel',
        'libffi-devel',
        'libtool',
        'libyaml-devel',
        'make',
        'openssl-devel',
        'patch',
        'readline-devel',
        'zlib-devel'
      ]
    }
    default: { }
  }

}
