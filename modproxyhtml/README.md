modproxyhtml
============

mod_proxy_html is an output filter to rewrite HTML links in a proxy situation,
to ensure that links work for users outside the proxy. It serves the same
purpose as Apache's ProxyPassReverse directive does for HTTP headers, and is an
essential component of a reverse proxy.

Samples
-------
```
include modproxyhtml
```
```
class { 'modproxyhtml':
  version => 'latest'
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com