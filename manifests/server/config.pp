class redis::server::config (
  $conf                              = $redis::server::conf,
  $conf_logrotate                    = $redis::server::conf_logrotate,
  $logfile                           = $redis::server::logfile,
  $daemonize                         = $redis::server::daemonize,
  $port                              = $redis::server::port,
  $tcp_backlog                       = $redis::server::tcp_backlog,
  $bind                              = $redis::server::bind,
  $unixsocket                        = $redis::server::unixsocket,
  $timeout                           = $redis::server::timeout,
  $tcp_keepalive                     = $redis::server::tcp_keepalive,
  $loglevel                          = $redis::server::loglevel,
  $syslog_enabled                    = $redis::server::syslog_enabled,
  $syslog_ident                      = $redis::server::syslog_ident,
  $syslog_facility                   = $redis::server::syslog_facility,
  $databases                         = $redis::server::databases,
  $nosave                            = $redis::server::nosave,
  $save                              = $redis::server::save,
  $stop_writes_on_bgsave_error       = $redis::server::stop_writes_on_bgsave_error,
  $rdbcompression                    = $redis::server::rdbcompression,
  $rdbchecksum                       = $redis::server::rdbchecksum,
  $dbfilename                        = $redis::server::dbfilename,
  $dir                               = $redis::server::dir,
  $slaveof                           = $redis::server::slaveof,
  $masterauth                        = $redis::server::masterauth,
  $slave_serve_stale_data            = $redis::server::slave_serve_stale_data,
  $slave_read_only                   = $redis::server::slave_read_only,
  $repl_ping_slave_period            = $redis::server::repl_ping_slave_period,
  $repl_timeout                      = $redis::server::repl_timeout,
  $repl_disable_tcp_nodelay          = $redis::server::repl_disable_tcp_nodelay,
  $repl_backlog_size                 = $redis::server::repl_backlog_size,
  $repl_backlog_ttl                  = $redis::server::repl_backlog_ttl,
  $slave_priority                    = $redis::server::slave_priority,
  $min_slaves_to_write               = $redis::server::min_slaves_to_write,
  $min_slaves_max_lag                = $redis::server::min_slaves_max_lag,
  $requirepass                       = $redis::server::requirepass,
  $maxclients                        = $redis::server::maxclients,
  $maxmemory                         = $redis::server::maxmemory,
  $maxmemory_policy                  = $redis::server::maxmemory_policy,
  $maxmemory_samples                 = $redis::server::maxmemory_samples,
  $appendonly                        = $redis::server::appendonly,
  $appendfilename                    = $redis::server::appendfilename,
  $appendfsync                       = $redis::server::appendfsync,
  $no_appendfsync_on_rewrite         = $redis::server::no_appendfsync_on_rewrite,
  $auto_aof_rewrite_percentage       = $redis::server::auto_aof_rewrite_percentage,
  $auto_aof_rewrite_min_size         = $redis::server::auto_aof_rewrite_min_size,
  $aof_load_truncated                = $redis::server::aof_load_truncated,
  $lua_time_limit                    = $redis::server::lua_time_limit,
  $slowlog_log_slower_than           = $redis::server::slowlog_log_slower_than,
  $slowlog_max_len                   = $redis::server::slowlog_max_len,
  $latency_monitor_threshold         = $redis::server::latency_monitor_threshold,
  $notify_keyspace_events            = $redis::server::notify_keyspace_events,
  $hash_max_zipmap_entries           = $redis::server::hash_max_zipmap_entries,
  $hash_max_zipmap_value             = $redis::server::hash_max_zipmap_value,
  $list_max_ziplist_entries          = $redis::server::list_max_ziplist_entries,
  $list_max_ziplist_value            = $redis::server::list_max_ziplist_value,
  $set_max_intset_entries            = $redis::server::set_max_intset_entries,
  $zset_max_ziplist_entries          = $redis::server::zset_max_ziplist_entries,
  $zset_max_ziplist_value            = $redis::server::zset_max_ziplist_value,
  $hll_sparse_max_bytes              = $redis::server::hll_sparse_max_bytes,
  $activerehashing                   = $redis::server::activerehashing,
  $client_output_buffer_limit_normal = $redis::server::client_output_buffer_limit_normal,
  $client_output_buffer_limit_slave  = $redis::server::client_output_buffer_limit_slave,
  $client_output_buffer_limit_pubsub = $redis::server::client_output_buffer_limit_pubsub,
  $hz                                = $redis::server::hz,
  $aof_rewrite_incremental_fsync     = $redis::server::aof_rewrite_incremental_fsync,

) {

  validate_absolute_path($conf)
  validate_absolute_path($conf_logrotate)
  validate_absolute_path($logfile)
  validate_re($daemonize, [ 'yes', 'no' ] )
  if (!is_integer($port))          { fail('$port must be an integer') }
  if (!is_integer($tcp_backlog))   { fail('$tcp_backlog must be an integer') }
  if (!is_ip_address($bind))       { fail('$bind must be an ip address') }
  if $unixsocket != undef { validate_absolute_path($unixsocket) }
  if (!is_integer($timeout))       { fail('$timeout must be an integer') }
  if (!is_integer($tcp_keepalive)) { fail('$tcp_keepalive must be an integer') }
  validate_re($loglevel, ['emergency','alert','critical','error','warning','notice','informational','debug','emerg','crit','err','info'])
  validate_re($syslog_enabled, [ 'yes', 'no' ] )
  validate_string($syslog_ident)
  validate_string($syslog_facility)
  if (!is_integer($databases))       { fail('$databases must be an integer') }
  if (!is_bool($nosave)) { fail('$nosave must be a boolean') }
  validate_hash($save)
  validate_re($stop_writes_on_bgsave_error, [ 'yes', 'no' ] )
  validate_re($rdbcompression, [ 'yes', 'no' ] )
  validate_re($rdbchecksum, [ 'yes', 'no' ] )
  validate_string($dbfilename)
  validate_absolute_path($dir)
  validate_string($slaveof)
  validate_string($masterauth)
  validate_re($slave_serve_stale_data, [ 'yes', 'no' ] )
  validate_re($slave_read_only, [ 'yes', 'no' ] )
  if (!is_integer($repl_ping_slave_period)) { fail('$repl_ping_slave_period must be an integer') }
  if (!is_integer($repl_timeout)) { fail('$repl_timeout must be an integer') }
  validate_re($repl_disable_tcp_nodelay, [ 'yes', 'no' ] )
  validate_string($repl_backlog_size)
  if (!is_integer($repl_backlog_ttl)) { fail('$repl_backlog_ttl must be an integer') }
  if (!is_integer($slave_priority)) { fail('$slave_priority must be an integer') }
  if (!is_integer($min_slaves_to_write)) { fail('$min_slaves_to_write must be an integer') }
  if (!is_integer($min_slaves_max_lag)) { fail('$min_slaves_max_lag must be an integer') }
  validate_string($requirepass)
  if (!is_integer($maxclients)) { fail('$maxclients must be an integer') }
  if (!is_integer($maxmemory)) and ($maxmemory != undef) { fail('$maxmemory must be an integer describing memory in bytes') }
  validate_re($maxmemory_policy, ['volatile-lru','allkeys-lru','volatile-random','allkeys-random','volatile-ttl','noeviction'])
  if (!is_integer($maxmemory_samples)) { fail('$maxmemory_samples must be an integer') }
  validate_re($appendonly, [ 'yes', 'no' ] )
  validate_string($appendfilename)
  validate_re($appendfsync, ['always','everysec','no'])
  validate_re($no_appendfsync_on_rewrite, [ 'yes', 'no' ] )
  if (!is_integer($auto_aof_rewrite_percentage)) { fail('$auto_aof_rewrite_percentage must be an integer') }
  validate_string($auto_aof_rewrite_min_size)
  validate_re($aof_load_truncated, [ 'yes', 'no' ] )
  if (!is_integer($lua_time_limit)) { fail('$lua_time_limit must be an integer') }
  if (!is_integer($slowlog_log_slower_than)) { fail('$slowlog_log_slower_than must be an integer') }
  if (!is_integer($slowlog_max_len)) { fail('$slowlog_max_len must be an integer') }
  if (!is_integer($latency_monitor_threshold)) { fail('$latency_monitor_threshold must be an integer') }
  validate_re($notify_keyspace_events, [ '[KEg$lshzxeA]+', '""' ])
  if (!is_integer($hash_max_zipmap_entries)) { fail('$hash_max_zipmap_entries must be an integer') }
  if (!is_integer($hash_max_zipmap_value)) { fail('$hash_max_zipmap_value must be an integer') }
  if (!is_integer($list_max_ziplist_entries)) { fail('$list_max_ziplist_entries must be an integer') }
  if (!is_integer($list_max_ziplist_value)) { fail('$list_max_ziplist_value must be an integer') }
  if (!is_integer($set_max_intset_entries)) { fail('$set_max_intset_entries must be an integer') }
  if (!is_integer($zset_max_ziplist_entries)) { fail('$zset_max_ziplist_entries must be an integer') }
  if (!is_integer($zset_max_ziplist_value)) { fail('$zset_max_ziplist_value must be an integer') }
  if (!is_integer($hll_sparse_max_bytes)) { fail('$hll_sparse_max_bytes must be an integer') }
  validate_re($activerehashing, [ 'yes', 'no' ] )
  validate_string($client_output_buffer_limit_normal)
  validate_string($client_output_buffer_limit_slave)
  validate_string($client_output_buffer_limit_pubsub)
  if (!is_integer($hz)) { fail('$hz must be an integer') }
  validate_re($aof_rewrite_incremental_fsync, [ 'yes', 'no' ] )

  file { $conf:
    path    => $conf,
    content => template('redis/redis.conf.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
  }

  file { $conf_logrotate:
    path    => $conf_logrotate,
    content => template('redis/redis.logrotate.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
  }

}