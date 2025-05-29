php
===

PHP, which stands for "PHP: Hypertext Preprocessor" is a widely-used Open
Source general-purpose scripting language that is especially suited for Web
development and can be embedded into HTML.

Samples
-------
```
include php
```
```
php::config { 'default':

}
```
```
class { 'php::mod::apc':
  max_file_size => '2M'
}
```
```
class { 'php::mod::redis':
  save_path         => [
    'tcp://host1:6379?weight=1',
    'tcp://host3:6379?weight=2'
  ],
  serialize_handler => 'igbinary'
}
```
```
class { 'php::mod::suhosin':
  get_max_value_length => '1024',
  post_max_array_index_length = '256',
  post_max_totalname_length = '8192',
  post_max_vars = '2048',
  request_max_array_index_length = '256',
  request_max_vars = '2048'
}
```
```
include php::mod::codesniffer
include php::mod::gd
include php::mod::ldap
include php::mod::mbstring
include php::mod::mcrypt
include php::mod::mysql
include php::mod::xml
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
