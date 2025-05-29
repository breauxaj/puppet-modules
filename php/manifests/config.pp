define php::config (
  $user_ini_filename = '',
  $user_ini_cache_ttl = '',

  $engine = '',
  $short_open_tag = '',
  $asp_tags = '',
  $precision = '',
  $y2k_compliance = '',
  $output_buffering = '',
  $output_handler = '',

  $zlib_output_compression = '',
  $zlib_output_compression_level = '',
  $zlib_output_handler = '',

  $implicit_flush = '',

  $unserialize_callback_func = '',

  $serialize_precision = '',

  $allow_call_time_pass_reference = '',

  $safe_mode = '',
  $safe_mode_gid = '',
  $safe_mode_include_dir = '',
  $safe_mode_exec_dir = '',
  $safe_mode_allowed_env_vars = '',
  $safe_mode_protected_env_vars = '',

  $open_basedir = '',

  $disable_functions = '',
  $disable_classes = '',

  $highlight_string = '',
  $highlight_comment = '',
  $highlight_keyword = '',
  $highlight_bg = '',
  $highlight_default = '',
  $highlight_html = '',

  $ignore_user_abort = '',

  $realpath_cache_size = '',
  $realpath_cache_ttl = '',

  $expose_php = '',

  $max_execution_time = '',
  $max_input_time = '',
  $max_input_nesting_level = '',

  $memory_limit = '',

  $error_reporting = '',
  $display_errors = '',
  $display_startup_errors = '',
  $log_errors = '',
  $log_errors_max_len = '',
  $ignore_repeated_errors = '',
  $ignore_repeated_source = '',
  $report_memleaks = '',
  $report_zend_debug = '',
  $track_errors = '',
  $xmlrpc_errors = '',
  $xmlrpc_error_number = '',
  $html_errors = '',
  $docref_root = '',
  $docref_ext = '',
  $error_prepend_string = '',
  $error_append_string = '',
  $error_log = '',

  $arg_separator_output = '',
  $arg_separator_input = '',

  $variables_order = '',

  $request_order = '',

  $register_globals = '',
  $register_long_arrays = '',
  $register_argc_argv = '',

  $auto_globals_jit = '',

  $post_max_size = '',

  $magic_quotes_gpc = '',
  $magic_quotes_runtime = '',
  $magic_quotes_sybase = '',

  $auto_prepend_file = '',
  $auto_append_file = '',

  $default_mimetype = '',
  $default_charset = '',

  $always_populate_raw_post_data = '',

  $include_path = '',
  $doc_root = '',
  $user_dir = '',
  $extension_dir = '',

  $enable_dl = '',

  $cgi_force_redirect = '',
  $cgi_nph = '',
  $cgi_redirect_status_env = '',
  $cgi_fix_pathinfo = '',

  $fastcgi_impersonate = '',
  $fastcgi_logging = '',

  $cgi_rfc2616_headers = '',

  $file_uploads = '',
  $upload_tmp_dir = '',
  $upload_max_filesize = '',

  $allow_url_fopen = '',
  $allow_url_include = '',
  $from = '',
  $user_agent = '',
  $default_socket_timeout = '',
  $auto_detect_line_endings = '',

) {
  file { '/etc/php.ini':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('php/php.erb'),
  }

}
