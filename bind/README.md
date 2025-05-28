bind
====

BIND is an implementation of the Domain Name System (DNS) protocols. The name
BIND stands for 'Berkeley Internet Name Domain', because the software originated
in the early 1980s at the University of California at Berkeley. In recent years,
the word BIND has become, like 'radar' and 'laser', more word than acronym.

Samples
-------
```
include bind
```
```
class { 'bind':
  ensure => 'latest'
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
