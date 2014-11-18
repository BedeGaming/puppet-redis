class redis::params {

  case $::osfamily {
    'redhat': {
      $package        = 'redis'
      $service        = 'redis'
      $conf           = '/etc/redis.conf'
      $conf_logrotate = '/etc/logrotate.d/redis'
      $pidfile        = '/var/run/redis/redis.pid'
      $logfile        = '/var/log/redis/redis.log'
    }
  }

  $package_ensure                    = 'installed'
  $service_ensure                    = 'running'
  $daemonize                         = 'yes'
  $port                              = '6379'
  $tcp_backlog                       = '511'
  $bind                              = '127.0.0.1'
  $unixsocket                        = undef
  $timeout                           = '0'
  $tcp_keepalive                     = '0'
  $loglevel                          = 'notice'
  $syslog_enabled                    = 'no'
  $syslog_ident                      = 'redis'
  $syslog_facility                   = 'local0'
  $databases                         = '16'
  $nosave                            = false
  $save                              = {"900" => "1", "300" => "10", "60" => "10000"}
  $stop_writes_on_bgsave_error       = 'yes'
  $rdbcompression                    = 'yes'
  $rdbchecksum                       = 'yes'
  $dbfilename                        = 'dump.rdb'
  $dir                               = '/var/lib/redis/'
  $slaveof                           = undef
  $masterauth                        = undef
  $slave_serve_stale_data            = 'yes'
  $slave_read_only                   = 'yes'
  $repl_ping_slave_period            = '10'
  $repl_timeout                      = '60'
  $repl_disable_tcp_nodelay          = 'no'
  $repl_backlog_size                 = '1mb'
  $repl_backlog_ttl                  = '3600'
  $slave_priority                    = '100'
  $min_slaves_to_write               = '0'
  $min_slaves_max_lag                = '0'
  $requirepass                       = undef
  $maxclients                        = '10000'
  $maxmemory                         = undef
  $maxmemory_policy                  = 'volatile-lru'
  $maxmemory_samples                 = '3'
  $appendonly                        = 'no'
  $appendfilename                    = 'appendonly.aof'
  $appendfsync                       = 'everysec'
  $no_appendfsync_on_rewrite         = 'no'
  $auto_aof_rewrite_percentage       = '100'
  $auto_aof_rewrite_min_size         = '64mb'
  $aof_load_truncated                = 'yes'
  $lua_time_limit                    = '5000'
  $slowlog_log_slower_than           = '10000'
  $slowlog_max_len                   = '128'
  $latency_monitor_threshold         = '0'
  $notify_keyspace_events            = '""'
  $hash_max_zipmap_entries           = '512'
  $hash_max_zipmap_value             = '64'
  $list_max_ziplist_entries          = '512'
  $list_max_ziplist_value            = '64'
  $set_max_intset_entries            = '512'
  $zset_max_ziplist_entries          = '128'
  $zset_max_ziplist_value            = '64'
  $hll_sparse_max_bytes              = '3000'
  $activerehashing                   = 'yes'
  $client_output_buffer_limit_normal = '0 0 0'
  $client_output_buffer_limit_slave  = '256mb 64mb 60'
  $client_output_buffer_limit_pubsub = '32mb 8mb 60'
  $hz                                = '10'
  $aof_rewrite_incremental_fsync     = 'yes'

}
