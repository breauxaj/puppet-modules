define phpmssql::config (
  $global_tds_version,
  $global_dump_file,
  $global_debug_flags,
  $global_timeout,
  $global_connect_timeout,
  $global_text_size,
  $servers = '',
) {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php-mssql' ],
  }

}
