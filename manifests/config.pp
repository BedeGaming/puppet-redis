class redis::config (
  $conf           = $redis::conf,
  $conf_logrotate = $redis::conf_logrotate,
  $logfile        = $redis::logfile,
) {

  file { $conf_logrotate:
    path    => $conf_logrotate,
    content => template('redis/redis.logrotate.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
  }

}
