class redis::sentinel::config (
  $user                    = $redis::sentinel::user,
  $conf                    = $redis::sentinel::conf,
  $conf_logrotate          = $redis::sentinel::conf_logrotate,
  $logfile                 = $redis::sentinel::logfile,
  $port                    = $redis::sentinel::port,
  $working_dir             = $redis::sentinel::working_dir,
  $quorum                  = $redis::sentinel::quorum,
  $accounce_ip             = $redis::sentinel::accounce_ip,
  $announce_port           = $redis::sentinel::announce_port,
  $auth_pass               = $redis::sentinel::auth_pass,
  $master_name             = $redis::sentinel::master_name,
  $master_ip               = $redis::sentinel::master_ip,
  $master_port             = $redis::sentinel::master_port,
  $down_after_milliseconds = $redis::sentinel::down_after_milliseconds,
  $parallel_syncs          = $redis::sentinel::parallel_syncs,
  $failover_timeout        = $redis::sentinel::failover_timeout,
) {

  file { "${name}_${conf}":
    path    => "${conf_path}/${conf}",
    content => template('redis/redis-sentinel.conf.erb'),
    owner   => $user,
    group   => root,
    mode    => '0644',
  }

  file { "${name}_${conf_logrotate}":
    path    => "${conf_logrotate_path}/${conf_logrotate}",
    content => template('redis/redis-sentinel.logrotate.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
  }

}
