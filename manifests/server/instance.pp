define redis::server::instance (

  $service_ensure                    = $redis::params::server_service_ensure,
  $service_enable                    = $redis::params::server_enable,
  $service                           = $redis::params::server_service,
  $service_path                      = $redis::params::server_service_path,
  $unit_path                         = $redis::params::server_unit_path,

  $user                              = $redis::params::server_user,
  $group                             = $redis::params::server_group,

  $conf                              = $redis::params::server_conf,
  $conf_path                         = $redis::params::server_conf_path,
  $conf_logrotate                    = $redis::params::server_conf_logrotate,
  $conf_logrotate_path               = $redis::params::server_conf_logrotate_path,
  $pidfile                           = $redis::params::server_pidfile,
  $pidfile_path                      = $redis::params::server_pidfile_path,
  $logfile                           = $redis::params::server_logfile,
  $logfile_path                      = $redis::params::server_logfile_path,

  $replica_announce_ip               = $redis::params::server_replica_announce_ip,
  $replica_announce_port             = $redis::params::server_replica_announce_port,

  $daemonize                         = 'yes',
  $port                              = '6379',
  $tcp_backlog                       = '511',
  $bind                              = '127.0.0.1',
  $unixsocket                        = undef,
  $timeout                           = '0',
  $tcp_keepalive                     = '0',
  $loglevel                          = 'notice',
  $syslog_enabled                    = 'no',
  $syslog_ident                      = 'redis',
  $syslog_facility                   = 'local0',
  $databases                         = '16',
  $nosave                            = false,
  $save                              = {"900" => "1", "300" => "10", "60" => "10000"},
  $stop_writes_on_bgsave_error       = 'yes',
  $rdbcompression                    = 'yes',
  $rdbchecksum                       = 'yes',
  $dbfilename                        = "dump.rdb",
  $dir                               = '/var/lib/redis/',
  $slaveof                           = undef,
  $masterauth                        = undef,
  $slave_serve_stale_data            = 'yes',
  $slave_read_only                   = 'yes',
  $repl_ping_slave_period            = '10',
  $repl_timeout                      = '60',
  $repl_disable_tcp_nodelay          = 'no',
  $repl_backlog_size                 = '1mb',
  $repl_backlog_ttl                  = '3600',
  $slave_priority                    = '100',
  $min_slaves_to_write               = '0',
  $min_slaves_max_lag                = '0',
  $requirepass                       = undef,
  $maxclients                        = '10000',
  $maxmemory                         = undef,
  $maxmemory_policy                  = 'volatile-lru',
  $maxmemory_samples                 = '3',
  $appendonly                        = 'no',
  $appendfilename                    = "appendonly.aof",
  $appendfsync                       = 'everysec',
  $no_appendfsync_on_rewrite         = 'no',
  $auto_aof_rewrite_percentage       = '100',
  $auto_aof_rewrite_min_size         = '64mb',
  $aof_load_truncated                = 'yes',
  $lua_time_limit                    = '5000',
  $slowlog_log_slower_than           = '10000',
  $slowlog_max_len                   = '128',
  $latency_monitor_threshold         = '0',
  $notify_keyspace_events            = '""',
  $hash_max_zipmap_entries           = '512',
  $hash_max_zipmap_value             = '64',
  $list_max_ziplist_entries          = '512',
  $list_max_ziplist_value            = '64',
  $set_max_intset_entries            = '512',
  $zset_max_ziplist_entries          = '128',
  $zset_max_ziplist_value            = '64',
  $hll_sparse_max_bytes              = '3000',
  $activerehashing                   = 'yes',
  $client_output_buffer_limit_normal = '0 0 0',
  $client_output_buffer_limit_slave  = '256mb 64mb 60',
  $client_output_buffer_limit_pubsub = '32mb 8mb 60',
  $hz                                = '10',
  $aof_rewrite_incremental_fsync     = 'yes',

) {

  if ($::hostname in $slaveof) { $isslave = undef } else { $isslave = true } # Should set first instance to master

  validate_absolute_path($conf_path)
  validate_absolute_path($conf_logrotate_path)
  validate_absolute_path($pidfile_path)
  validate_absolute_path($logfile_path)
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

  exec { "${name}_refresh":
    command     => "/usr/bin/printf '# FILE BODGED BY PUPPET\\n# Redis dynamic config for %s\\n\\ninclude %s\\n\\n' '${name}' '${conf_path}/redis.d/${name}_${conf}' > ${conf_path}/${name}_${conf} && /usr/bin/chown ${user}:${group} ${conf_path}/${name}_${conf}",
    refreshonly => true,
  }

  file { "redis.d_${name}_${conf}":
    path    => "${conf_path}/redis.d/${name}_${conf}",
    content => template('redis/redis.d.conf.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
    notify  => Exec["${name}_refresh"],
  }

  file { "${name}_${conf_logrotate}_logrotate":
    path    => "${conf_logrotate_path}/${name}_${conf_logrotate}",
    content => template('redis/redis.logrotate.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
  }

  file { "${name}_${service}_init":
    path    => "${service_path}/${name}_${service}",
    ensure  => absent,
    notify  => Exec["${name}_systemd_reload"],
  }

  file { "${name}_${service}_unit":
    path    => "${unit_path}/${name}_${service}.service",
    content => template('redis/redis-unit.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
    notify  => Exec["${name}_systemd_reload"],
  }

  exec { "${name}_systemd_reload":
    path        => ['/bin','/sbin'],
    command     => 'systemctl daemon-reload',
    refreshonly => true,
    notify      => Service["${name}_${service}"],
  }

  service { "${name}_${service}":
    ensure    => $service_ensure,
    name      => "${name}_${service}",
    enable    => $service_enable,
    require   => [ File["${name}_${service}_init"], File["redis.d_${name}_${conf}"], File["${name}_${conf_logrotate}_logrotate"] ],
    subscribe => File["redis.d_${name}_${conf}"],
  }

}
