class redis::sentinel::config (
  $conf                    = $redis::sentinel::conf,
  $conf_logrotate          = $redis::sentinel::conf_logrotate,
  $logfile                 = $redis::sentinel::logfile,
  $cluster_name            = $redis::sentinel::cluster_name,
  $port                    = $redis::sentinel::port,
  $working_dir             = $redis::sentinel::working_dir,
  $redis_master            = $redis::sentinel::redis_master,
  $redis_port              = $redis::sentinel::redis_port,
  $quorum                  = $redis::sentinel::quorum,
  $down_after_milliseconds = $redis::sentinel::down_after_milliseconds,
  $auth_pass               = $redis::sentinel::auth_pass,
) {

  file { $conf:
    path    => $conf,
    content => template('redis/redis-sentinel.conf.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
  }

  file { $conf_logrotate:
    path    => $conf_logrotate,
    content => template('redis/redis-sentinel.logrotate.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
  }

}
