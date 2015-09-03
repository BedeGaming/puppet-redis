class redis::params {

  # Redis and Redis Sentinel Enabling
  $server_enable   = true
  $sentinel_enable = false

  $server_package_ensure = 'installed'
  $server_service_ensure = 'running'
  $server_service_manage = true

  case $::osfamily {
    'redhat': {
      $package                      = 'redis'
      $server_service               = 'redis'
      $server_conf                  = 'redis.conf'
      $server_conf_path             = '/etc'
      $server_conf_logrotate        = 'redis'
      $server_conf_logrotate_path   = '/etc/logrotate.d'
      $server_pidfile               = 'redis.pid'
      $server_pidfile_path          = '/var/run/redis'
      $server_logfile               = 'redis.log'
      $server_logfile_path          = '/var/log/redis'
      $sentinel_service             = 'redis-sentinel'
      $sentinel_conf                = 'redis-sentinel.conf'
      $sentinel_conf_path           = '/etc'
      $sentinel_conf_logrotate      = 'redis-sentinel'
      $sentinel_conf_logrotate_path = '/etc/logrotate.d'
      $sentinel_logfile             = 'redis-sentinel.log'
      $sentinel_logfile_path        = '/var/log/redis'
      $sentinel_pidfile             = 'sentinel.pid'
      $sentinel_pidfile_path        = '/var/run/redis'
      $sentinel_user                = 'redis'
      $sentinel_group               = 'redis'
    }

    # Check Release number
    if versioncmp($::operatingsystemmajrelease, '7') >= 0 {
        $service_provider         = 'systemd'
        $server_init_template     = 'redis-systemd.erb'
        $sentinel_init_template   = 'redis-sentinel-systemd.erb'
        $service_path             = '/etc/systemd/system/'
        $server_service_name      = "${name}_${server_service}.service"
        $sentinel_service_name    = "${name}_${sentinel_service}.service"
      } else {
        $service_provider         = 'init'
        $server_init_template     = 'redis-init.erb'
        $sentinel_init_template   = 'redis-sentinel-init.erb'
        $service_path             = '/etc/init.d'
        $server_service_name      = "${name}_${server_service}"
        $sentinel_service_name    = "${name}_${sentinel_service}"
        }
  }

  # Redis Sentinel Paramters
  $sentinel_package_ensure           = 'installed'
  $sentinel_service_ensure           = 'running'
  $sentinel_service_manage           = false
  $sentinel_working_dir              = '/tmp'
  $sentinel_port                     = '26379'
  $sentinel_master_name              = undef
  $sentinel_master_ip                = undef
  $sentinel_master_port              = '6379'
  $sentinel_auth_pass                = undef
  $sentinel_down_after_milliseconds  = '30000'
  $sentinel_quorum                   = '1'
  $sentinel_parallel_syncs           = undef
  $sentinel_failover_timeout         = undef


}
