# Module to Manage Redis and Sentinel
class redis (
  $server_enable   = $redis::params::server_enable,
  $sentinel_enable = $redis::params::sentinel_enable,

  $server_package             = $redis::params::server_package,
  $server_service             = $redis::params::server_service,
  $server_conf                = $redis::params::server_conf,
  $server_conf_path           = $redis::params::server_conf_path,
  $server_conf_logrotate      = $redis::params::server_conf_logrotate,
  $server_conf_logrotate_path = $redis::params::server_conf_logrotate_path,
  $server_pidfile             = $redis::params::server_pidfile,
  $server_logfile             = $redis::params::server_logfile,
  $server_package_ensure      = $redis::params::server_package_ensure,
  $server_service_ensure      = $redis::params::server_service_ensure,
  $server_service_manage      = $redis::params::server_service_manage,

  $server_instances = {},

  $sentinel_user                    = $redis::params::sentinel_user,
  $sentinel_conf                    = $redis::params::sentinel_conf,
  $sentinel_conf_logrotate          = $redis::params::sentinel_conf_logrotate,
  $sentinel_pidfile                 = $redis::params::sentinel_pidfile,
  $sentinel_logfile                 = $redis::params::sentinel_logfile,
  $sentinel_service                 = $redis::params::sentinel_service,
  $sentinel_service_ensure          = $redis::params::sentinel_service_ensure,
  $sentinel_service_manage          = $redis::params::sentinel_service_manage,
  $sentinel_working_dir             = $redis::params::sentinel_working_dir,
  $sentinel_port                    = $redis::params::sentinel_port,
  $sentinel_master_name             = $redis::params::sentinel_master_name,
  $sentinel_master_ip               = $redis::params::sentinel_master_ip,
  $sentinel_master_port             = $redis::params::sentinel_master_port,
  $sentinel_auth_pass               = $redis::params::sentinel_auth_pass,
  $sentinel_down_after_milliseconds = $redis::params::sentinel_down_after_milliseconds,
  $sentinel_quorum                  = $redis::params::sentinel_quorum,
  $sentinel_parallel_syncs          = $redis::params::sentinel_parallel_syncs,
  $sentinel_failover_timeout        = $redis::params::sentinel_failover_timeout,

) inherits redis::params {

  contain '::redis::install'

  if $server_enable {
    create_resources('redis::server::instance',$server_instances)
  }

  if $sentinel_enable {
    class { '::redis::sentinel':
      require => Class['::redis::install']
    }
    contain '::redis::sentinel'
  }

}
