class redis::params {

  case $::osfamily {
    'redhat': {
      $package                 = 'redis'
      $server_service          = 'redis'
      $server_conf             = '/etc/redis.conf'
      $server_conf_logrotate   = '/etc/logrotate.d/redis'
      $server_pidfile          = '/var/run/redis/redis.pid'
      $server_logfile          = '/var/log/redis/redis.log'
      $sentinel_service        = 'redis-sentinel'
      $sentinel_conf           = '/etc/redis-sentinel.conf'
      $sentinel_conf_logrotate = '/etc/logrotate.d/redis-sentinel'
      $sentinel_logfile        = '/var/log/redis/redis-sentinel.log'
      $sentinel_pidfile        = '/var/run/redis/redis.pid'
      $sentinel_logfile        = '/var/log/redis/redis.log'
    }
  }

  # Redis and Redis Sentinel Enabling
  $server_enable   = true
  $sentinel_enable = false

  # Redis Parameters
  $server_package_ensure                    = 'installed'
  $server_service_ensure                    = 'running'
  $server_daemonize                         = 'yes'
  $server_port                              = '6379'
  $server_tcp_backlog                       = '511'
  $server_bind                              = '127.0.0.1'
  $server_unixsocket                        = undef
  $server_timeout                           = '0'
  $server_tcp_keepalive                     = '0'
  $server_loglevel                          = 'notice'
  $server_syslog_enabled                    = 'no'
  $server_syslog_ident                      = 'redis'
  $server_syslog_facility                   = 'local0'
  $server_databases                         = '16'
  $server_nosave                            = false
  $server_save                              = {"900" => "1", "300" => "10", "60" => "10000"}
  $server_stop_writes_on_bgsave_error       = 'yes'
  $server_rdbcompression                    = 'yes'
  $server_rdbchecksum                       = 'yes'
  $server_dbfilename                        = 'dump.rdb'
  $server_dir                               = '/var/lib/redis/'
  $server_slaveof                           = undef
  $server_masterauth                        = undef
  $server_slave_serve_stale_data            = 'yes'
  $server_slave_read_only                   = 'yes'
  $server_repl_ping_slave_period            = '10'
  $server_repl_timeout                      = '60'
  $server_repl_disable_tcp_nodelay          = 'no'
  $server_repl_backlog_size                 = '1mb'
  $server_repl_backlog_ttl                  = '3600'
  $server_slave_priority                    = '100'
  $server_min_slaves_to_write               = '0'
  $server_min_slaves_max_lag                = '0'
  $server_requirepass                       = undef
  $server_maxclients                        = '10000'
  $server_maxmemory                         = undef
  $server_maxmemory_policy                  = 'volatile-lru'
  $server_maxmemory_samples                 = '3'
  $server_appendonly                        = 'no'
  $server_appendfilename                    = 'appendonly.aof'
  $server_appendfsync                       = 'everysec'
  $server_no_appendfsync_on_rewrite         = 'no'
  $server_auto_aof_rewrite_percentage       = '100'
  $server_auto_aof_rewrite_min_size         = '64mb'
  $server_aof_load_truncated                = 'yes'
  $server_lua_time_limit                    = '5000'
  $server_slowlog_log_slower_than           = '10000'
  $server_slowlog_max_len                   = '128'
  $server_latency_monitor_threshold         = '0'
  $server_notify_keyspace_events            = '""'
  $server_hash_max_zipmap_entries           = '512'
  $server_hash_max_zipmap_value             = '64'
  $server_list_max_ziplist_entries          = '512'
  $server_list_max_ziplist_value            = '64'
  $server_set_max_intset_entries            = '512'
  $server_zset_max_ziplist_entries          = '128'
  $server_zset_max_ziplist_value            = '64'
  $server_hll_sparse_max_bytes              = '3000'
  $server_activerehashing                   = 'yes'
  $server_client_output_buffer_limit_normal = '0 0 0'
  $server_client_output_buffer_limit_slave  = '256mb 64mb 60'
  $server_client_output_buffer_limit_pubsub = '32mb 8mb 60'
  $server_hz                                = '10'
  $server_aof_rewrite_incremental_fsync     = 'yes'

  # Redis Sentinel Paramters
  $sentinel_cluster_name             = undef
  $sentinel_port                     = '26379'
  $sentinel_logfile                  = '/var/log/redis/sentinel.log'
  $sentinel_working_dir              = '/tmp'
  $sentinel_redis_master             = undef
  $sentinel_redis_port               = undef
  $sentinel_quorum                   = undef
  $sentinel_down_after_milliseconds  = '30000'
  $sentinel_auth_pass                = undef


}
