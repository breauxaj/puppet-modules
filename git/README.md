git
===

Git is a free and open source distributed version control system designed to
handle everything from small to very large projects with speed and efficiency.

Samples
-------
```
include git
```
```
git::server { 'default': }
```

Custom Type
-----------
```
clone { '/var/vhost/drupal':
  source => 'git://git.drupal.org/project/drupal.git',
  branch => '7.x',
  pull   => 'yes',
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
