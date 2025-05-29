class php::mod::apc (
  $enabled = '1',
  $shm_segments = '1',
  $shm_size= '64M',
  $num_files_hint = '1024',
  $user_entries_hint = '4096',
  $ttl = '7200',
  $use_request_time = '1',
  $user_ttl = '7200',
  $gc_ttl = '3600',
  $cache_by_default = '1',
  $mmap_file_mask = '/tmp/apc.XXXXXX',
  $file_update_protection= '2',
  $enable_cli = '0',
  $max_file_size = '1M',
  $stat = '1',
  $stat_ctime = '0',
  $canonicalize = '0',
  $write_lock = '1',
  $report_autofilter = '0',
  $rfc1867 = '0',
  $rfc1867_prefix = 'upload_',
  $rfc1867_name = 'APC_UPLOAD_PROGRESS',
  $rfc1867_freq = '0',
  $rfc1867_ttl = '3600',
  $include_once_override = '0',
  $lazy_classes = '0',
  $lazy_functions = '0',
  $coredump_unmap = '0',
  $file_md5 = '0'
) {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php-pecl-apc' ],
  }

  package { $required:
    ensure  => latest,
  }

  file { '/etc/php.d/apc.ini':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('php/mod/apc.erb'),
  }

}
