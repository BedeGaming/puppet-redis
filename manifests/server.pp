class redis::server (

  $service                           = $redis::server_service,
  $service_ensure                    = $redis::server_service_ensure,
  $service_manage                    = $redis::server_service_manage,
  $cluster_name                      = $redis::server_cluster_name,
  $conf                              = $redis::server_conf,
  $conf_logrotate                    = $redis::server_conf_logrotate,
  $pidfile                           = $redis::server_pidfile,
  $logfile                           = $redis::server_logfile,
  $daemonize                         = $redis::server_daemonize,
  $port                              = $redis::server_port,
  $tcp_backlog                       = $redis::server_tcp_backlog,
  $bind                              = $redis::server_bind,
  $unixsocket                        = $redis::server_unixsocket,
  $timeout                           = $redis::server_timeout,
  $tcp_keepalive                     = $redis::server_tcp_keepalive,
  $loglevel                          = $redis::server_loglevel,
  $syslog_enabled                    = $redis::server_syslog_enabled,
  $syslog_ident                      = $redis::server_syslog_ident,
  $syslog_facility                   = $redis::server_syslog_facility,
  $databases                         = $redis::server_databases,
  $nosave                            = $redis::server_nosave,
  $save                              = $redis::server_save,
  $stop_writes_on_bgsave_error       = $redis::server_stop_writes_on_bgsave_error,
  $rdbcompression                    = $redis::server_rdbcompression,
  $rdbchecksum                       = $redis::server_rdbchecksum,
  $dbfilename                        = $redis::server_dbfilename,
  $dir                               = $redis::server_dir,
  $slaveof                           = $redis::server_slaveof,
  $masterauth                        = $redis::server_masterauth,
  $slave_serve_stale_data            = $redis::server_slave_serve_stale_data,
  $slave_read_only                   = $redis::server_slave_read_only,
  $repl_ping_slave_period            = $redis::server_repl_ping_slave_period,
  $repl_timeout                      = $redis::server_repl_timeout,
  $repl_disable_tcp_nodelay          = $redis::server_repl_disable_tcp_nodelay,
  $repl_backlog_size                 = $redis::server_repl_backlog_size,
  $repl_backlog_ttl                  = $redis::server_repl_backlog_ttl,
  $slave_priority                    = $redis::server_slave_priority,
  $min_slaves_to_write               = $redis::server_min_slaves_to_write,
  $min_slaves_max_lag                = $redis::server_min_slaves_max_lag,
  $requirepass                       = $redis::server_requirepass,
  $maxclients                        = $redis::server_maxclients,
  $maxmemory                         = $redis::server_maxmemory,
  $maxmemory_policy                  = $redis::server_maxmemory_policy,
  $maxmemory_samples                 = $redis::server_maxmemory_samples,
  $appendonly                        = $redis::server_appendonly,
  $appendfilename                    = $redis::server_appendfilename,
  $appendfsync                       = $redis::server_appendfsync,
  $no_appendfsync_on_rewrite         = $redis::server_no_appendfsync_on_rewrite,
  $auto_aof_rewrite_percentage       = $redis::server_auto_aof_rewrite_percentage,
  $auto_aof_rewrite_min_size         = $redis::server_auto_aof_rewrite_min_size,
  $aof_load_truncated                = $redis::server_aof_load_truncated,
  $lua_time_limit                    = $redis::server_lua_time_limit,
  $slowlog_log_slower_than           = $redis::server_slowlog_log_slower_than,
  $slowlog_max_len                   = $redis::server_slowlog_max_len,
  $latency_monitor_threshold         = $redis::server_latency_monitor_threshold,
  $notify_keyspace_events            = $redis::server_notify_keyspace_events,
  $hash_max_zipmap_entries           = $redis::server_hash_max_zipmap_entries,
  $hash_max_zipmap_value             = $redis::server_hash_max_zipmap_value,
  $list_max_ziplist_entries          = $redis::server_list_max_ziplist_entries,
  $list_max_ziplist_value            = $redis::server_list_max_ziplist_value,
  $set_max_intset_entries            = $redis::server_set_max_intset_entries,
  $zset_max_ziplist_entries          = $redis::server_zset_max_ziplist_entries,
  $zset_max_ziplist_value            = $redis::server_zset_max_ziplist_value,
  $hll_sparse_max_bytes              = $redis::server_hll_sparse_max_bytes,
  $activerehashing                   = $redis::server_activerehashing,
  $client_output_buffer_limit_normal = $redis::server_client_output_buffer_limit_normal,
  $client_output_buffer_limit_slave  = $redis::server_client_output_buffer_limit_slave,
  $client_output_buffer_limit_pubsub = $redis::server_client_output_buffer_limit_pubsub,
  $hz                                = $redis::server_hz,
  $aof_rewrite_incremental_fsync     = $redis::server_aof_rewrite_incremental_fsync,


) {
  class {'::redis::server::config':
    require => Class['::redis::install']
  }
  contain '::redis::server::config'
  contain '::redis::server::service'

  if $service_manage {
    Class ['::redis::server::config'] ~>
    Class ['::redis::server::service']
  } else {
    Class ['::redis::server::config'] ->
    Class ['::redis::server::service']
  }
}
