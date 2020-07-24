class redis::params {

  # Redis and Redis Sentinel Enabling
  $server_enable   = true
  $sentinel_enable = true

  $server_package_ensure = 'installed'
  $server_service_ensure = 'running'
  $server_service_manage = true

  case $::osfamily {
    'redhat': {
      $package                      = 'redis'
      $server_service               = 'redis'
      $server_service_path          = '/etc/init.d'
      $server_unit_path             = '/usr/lib/systemd/system'
      $server_conf                  = 'redis.conf'
      $server_conf_path             = '/etc'
      $server_conf_logrotate        = 'redis'
      $server_conf_logrotate_path   = '/etc/logrotate.d'
      $server_pidfile               = 'redis.pid'
      $server_pidfile_path          = '/var/run/redis'
      $server_logfile               = 'redis.log'
      $server_logfile_path          = '/var/log/redis'
      $server_user                  = 'redis'
      $server_group                 = 'redis'
      $sentinel_service             = 'redis-sentinel'
      $sentinel_service_path        = '/etc/init.d'
      $sentinel_unit_path           = '/usr/lib/systemd/system'
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
  }


  # Redis Sentinel Paramters
  $sentinel_package_ensure           = 'installed'
  $sentinel_service_ensure           = 'running'
  $sentinel_service_manage           = false
  $sentinel_working_dir              = '/tmp'
  $sentinel_port                     = '26379'
  $sentinel_master_name              = undef
  $sentinel_master_ip                = $::ipaddress
  $sentinel_master_port              = '6379'
  $sentinel_auth_pass                = undef
  $sentinel_down_after_milliseconds  = '30000'
  $sentinel_quorum                   = '1'
  $sentinel_parallel_syncs           = undef
  $sentinel_failover_timeout         = undef
  $sentinel_protected_mode           = undef
  $sentinel_announce_ip              = $::ipaddress
  $sentinel_announce_port            = '26379'
  $sentinel_priority                 = '500'
  $sentinel_master_instance          = undef
  $sentinel_myid_raw                 = $::hostname

  # Redis Server Parameters
  $server_replica_announce_ip        = $::ipaddress
  $server_replica_announce_port      = undef

}
