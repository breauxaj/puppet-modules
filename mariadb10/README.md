mariadb10
=========

MariaDB is a community-developed fork of the MySQL relational database
management system.

Samples
-------
```
include mariadb10
include mariadb10::server
```
```
mariadb10::config {
  'mysqld/ft_min_word_len':                 value => '4';
  'mysqld/innodb_additional_mem_pool_size': value => '20M';
  'mysqld/innodb_autoinc_lock_mode':        value => '2';
  'mysqld/innodb_buffer_pool_instances':    value => '1';
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
