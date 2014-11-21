class redis::sentinel (
  $enable                  = $redis::sentinel_enable,
  $service                 = $redis::sentinel_service,
  $service_ensure          = $redis::sentinel_service_ensure,
  $conf                    = $redis::sentinel_conf,
  $conf_logrotate          = $redis::sentinel_conf_logrotate,
  $logfile                 = $redis::sentinel_logfile,
  $pidfile                 = $redis::sentinel_pidfile,
  $port                    = $redis::sentinel_port,
  $working_dir             = $redis::sentinel_working_dir,
  $quorum                  = $redis::sentinel_quorum,
  $announce_ip             = $redis::sentinel_announce_ip,
  $announce_port           = $redis::sentinel_announce_port,
  $master_name             = $redis::sentinel_master_name,
  $master_ip               = $redis::sentinel_redis_master,
  $master_port             = $redis::sentinel_redis_port,
  $auth_pass               = $redis::sentinel_auth_pass,
  $down_after_milliseconds = $redis::sentinel_down_after_milliseconds,
  $parallel_syncs          = $redis::sentinel_parallel_syncs,
  $failover_timeout        = $redis::sentinel_failover_timeout,
) {

  class {'::redis::sentinel::config':
    require => Class['::redis::install']
  }
  contain '::redis::sentinel::config'
  contain '::redis::sentinel::service'

  Class ['::redis::sentinel::config'] ~>
  Class ['::redis::sentinel::service']

}
