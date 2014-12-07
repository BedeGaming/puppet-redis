define redis::sentinel::instance (

  $service_ensure          = $redis::params::sentinel_service_ensure,
  $service_enable          = $redis::params::sentinel_enable,
  $service                 = $redis::params::sentinel_service,
  $service_path            = $redis::params::sentinel_service_path,
  $conf                    = $redis::params::sentinel_conf,
  $conf_path               = $redis::params::sentinel_conf_path,
  $conf_logrotate          = $redis::params::sentinel_conf_logrotate,
  $conf_logrotate_path     = $redis::params::sentinel_conf_logrotate_path,
  $pidfile                 = $redis::params::sentinel_pidfile,
  $pidfile_path            = $redis::params::sentinel_pidfile_path,
  $logfile                 = $redis::params::sentinel_logfile,
  $logfile_path            = $redis::params::sentinel_logfile_path,

  $master                  = $name,

  $user                    = 'redis',
  $group                   = 'redis',
  $accounce_ip             = undef,
  $announce_port           = undef,
  $working_dir             = '/tmp',
  $port                    = '26379',
  $master_name             = $::hostname,
  $master_ip               = $::ipaddress,
  $master_port             = '6379',
  $auth_pass               = undef,
  $down_after_milliseconds = '30000',
  $quorum                  = '1',
  $parallel_syncs          = undef,
  $failover_timeout        = undef,

) {

  file { "${name}_${conf_logrotate}":
    path    => "${conf_logrotate_path}/${conf_logrotate}",
    content => template('redis/redis-sentinel.logrotate.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
    ensure  => present,
  }

  file { "${name}_${conf}":
    path    => "${conf_path}/${conf}",
    content => template('redis/redis-sentinel.conf.erb'),
    owner   => $user,
    group   => root,
    mode    => '0644',
  }

}
