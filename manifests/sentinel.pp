class redis::sentinel (
  $enable                  = $redis::sentinel_enable,
  $conf                    = $redis::sentinel_conf,
  $conf_logrotate          = $redis::sentinel_conf_logrotate,
  $logfile                 = $redis::sentinel_logfile,
  $pidfile                 = $redis::sentinel_pidfile,
  $service                 = $redis::sentinel_service,
  $service_ensure          = $redis::sentinel_service_ensure,
  $cluster_name            = $redis::sentinel_cluster_name,
  $port                    = $redis::sentinel_port,
  $working_dir             = $redis::sentinel_working_dir,
  $redis_master            = $redis::sentinel_redis_master,
  $redis_port              = $redis::sentinel_redis_port,
  $quorum                  = $redis::sentinel_quorum,
  $down_after_milliseconds = $redis::sentinel_down_after_milliseconds,
  $auth_pass               = $redis::sentinel_auth_pass,
) {

  class {'::redis::sentinel::config':
    require => Class['::redis::install']
  }
  contain '::redis::sentinel::config'
  contain '::redis::sentinel::service'

  Class ['::redis::sentinel::config'] ~>
  Class ['::redis::sentinel::service']

}
