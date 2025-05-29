pagespeed
=========

PageSpeed speeds up your site and reduces page load time. This open-source
webserver module automatically applies web performance best practices to pages
and associated assets (CSS, JavaScript, images) without requiring that you
modify your existing content or workflow.

https://developers.google.com/speed/pagespeed/module

Samples
-------
```
include pagespeed
```
```
pagespeed::config { 'default':
  modpagespeed        => 'on',
  inheritvhostconfig  => 'on',
  outputfilter_html   => 'on',
  filecachepath       => '/var/cache/mod_pagespeed/',
  logdir              => '/var/log/pagespeed',
  filecacheinodelimit => '500000',
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
