# Module to Manage Redis and Sentinel
class redis (
  $server_enable   = $redis::params::server_enable,
  $sentinel_enable = $redis::params::sentinel_enable,

  $server_package                           = $redis::params::server_package,
  $server_service                           = $redis::params::server_service,
  $server_conf                              = $redis::params::server_conf,
  $server_conf_logrotate                    = $redis::params::server_conf_logrotate,
  $server_pidfile                           = $redis::params::server_pidfile,
  $server_logfile                           = $redis::params::server_logfile,
  $server_package_ensure                    = $redis::params::server_package_ensure,
  $server_service_ensure                    = $redis::params::server_service_ensure,
  $server_daemonize                         = $redis::params::server_daemonize,
  $server_port                              = $redis::params::server_port,
  $server_tcp_backlog                       = $redis::params::server_tcp_backlog,
  $server_bind                              = $redis::params::server_bind,
  $server_unixsocket                        = $redis::params::server_unixsocket,
  $server_timeout                           = $redis::params::server_timeout,
  $server_tcp_keepalive                     = $redis::params::server_tcp_keepalive,
  $server_loglevel                          = $redis::params::server_loglevel,
  $server_syslog_enabled                    = $redis::params::server_syslog_enabled,
  $server_syslog_ident                      = $redis::params::server_syslog_ident,
  $server_syslog_facility                   = $redis::params::server_syslog_facility,
  $server_databases                         = $redis::params::server_databases,
  $server_nosave                            = $redis::params::server_nosave,
  $server_save                              = $redis::params::server_save,
  $server_stop_writes_on_bgsave_error       = $redis::params::server_stop_writes_on_bgsave_error,
  $server_rdbcompression                    = $redis::params::server_rdbcompression,
  $server_rdbchecksum                       = $redis::params::server_rdbchecksum,
  $server_dbfilename                        = $redis::params::server_dbfilename,
  $server_dir                               = $redis::params::server_dir,
  $server_slaveof                           = $redis::params::server_slaveof,
  $server_masterauth                        = $redis::params::server_masterauth,
  $server_slave_serve_stale_data            = $redis::params::server_slave_serve_stale_data,
  $server_slave_read_only                   = $redis::params::server_slave_read_only,
  $server_repl_ping_slave_period            = $redis::params::server_repl_ping_slave_period,
  $server_repl_timeout                      = $redis::params::server_repl_timeout,
  $server_repl_disable_tcp_nodelay          = $redis::params::server_repl_disable_tcp_nodelay,
  $server_repl_backlog_size                 = $redis::params::server_repl_backlog_size,
  $server_repl_backlog_ttl                  = $redis::params::server_repl_backlog_ttl,
  $server_slave_priority                    = $redis::params::server_slave_priority,
  $server_min_slaves_to_write               = $redis::params::server_min_slaves_to_write,
  $server_min_slaves_max_lag                = $redis::params::server_min_slaves_max_lag,
  $server_requirepass                       = $redis::params::server_requirepass,
  $server_maxclients                        = $redis::params::server_maxclients,
  $server_maxmemory                         = $redis::params::server_maxmemory,
  $server_maxmemory_policy                  = $redis::params::server_maxmemory_policy,
  $server_maxmemory_samples                 = $redis::params::server_maxmemory_samples,
  $server_appendonly                        = $redis::params::server_appendonly,
  $server_appendfilename                    = $redis::params::server_appendfilename,
  $server_appendfsync                       = $redis::params::server_appendfsync,
  $server_no_appendfsync_on_rewrite         = $redis::params::server_no_appendfsync_on_rewrite,
  $server_auto_aof_rewrite_percentage       = $redis::params::server_auto_aof_rewrite_percentage,
  $server_auto_aof_rewrite_min_size         = $redis::params::server_auto_aof_rewrite_min_size,
  $server_aof_load_truncated                = $redis::params::server_aof_load_truncated,
  $server_lua_time_limit                    = $redis::params::server_lua_time_limit,
  $server_slowlog_log_slower_than           = $redis::params::server_slowlog_log_slower_than,
  $server_slowlog_max_len                   = $redis::params::server_slowlog_max_len,
  $server_latency_monitor_threshold         = $redis::params::server_latency_monitor_threshold,
  $server_notify_keyspace_events            = $redis::params::server_notify_keyspace_events,
  $server_hash_max_zipmap_entries           = $redis::params::server_hash_max_zipmap_entries,
  $server_hash_max_zipmap_value             = $redis::params::server_hash_max_zipmap_value,
  $server_list_max_ziplist_entries          = $redis::params::server_list_max_ziplist_entries,
  $server_list_max_ziplist_value            = $redis::params::server_list_max_ziplist_value,
  $server_set_max_intset_entries            = $redis::params::server_set_max_intset_entries,
  $server_zset_max_ziplist_entries          = $redis::params::server_zset_max_ziplist_entries,
  $server_zset_max_ziplist_value            = $redis::params::server_zset_max_ziplist_value,
  $server_hll_sparse_max_bytes              = $redis::params::server_hll_sparse_max_bytes,
  $server_activerehashing                   = $redis::params::server_activerehashing,
  $server_client_output_buffer_limit_normal = $redis::params::server_client_output_buffer_limit_normal,
  $server_client_output_buffer_limit_slave  = $redis::params::server_client_output_buffer_limit_slave,
  $server_client_output_buffer_limit_pubsub = $redis::params::server_client_output_buffer_limit_pubsub,
  $server_hz                                = $redis::params::server_hz,
  $server_aof_rewrite_incremental_fsync     = $redis::params::server_aof_rewrite_incremental_fsync,

  $sentinel_conf                    = $redis::params::sentinel_conf,
  $sentinel_conf_logrotate          = $redis::params::sentinel_conf_logrotate,
  $sentinel_pidfile                 = $redis::params::sentinel_pidfile,
  $sentinel_logfile                 = $redis::params::sentinel_logfile,
  $sentinel_service                 = $redis::params::sentinel_service,
  $sentinel_service_ensure          = $redis::params::sentinel_service_ensure,
  $sentinel_cluster_name            = $redis::params::sentinel_cluster_name,
  $sentinel_port                    = $redis::params::sentinel_port,
  $sentinel_working_dir             = $redis::params::sentinel_working_dir,
  $sentinel_redis_master            = $redis::params::sentinel_redis_master,
  $sentinel_redis_port              = $redis::params::sentinel_redis_port,
  $sentinel_quorum                  = $redis::params::sentinel_quorum,
  $sentinel_down_after_milliseconds = $redis::params::sentinel_down_after_milliseconds,
  $sentinel_auth_pass               = $redis::params::sentinel_auth_pass,

) inherits redis::params {

  contain '::redis::install'

  if $server_enable {
    class { '::redis::server':
      require => Class['::redis::install']
    }
    contain '::redis::server'
  }

  if $sentinel_enable {
    class { '::redis::sentinel':
      require => Class['::redis::install']
    }
    contain '::redis::sentinel'
  }

}
