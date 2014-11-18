class redis::params {

  $package_ensure = 'installed'

  $service_ensure = 'running'

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

}
