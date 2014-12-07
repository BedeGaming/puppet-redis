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
  $use_default_master      = false,

  $user                    = 'redis',
  $group                   = 'redis',
  $accounce_ip             = undef,
  $announce_port           = undef,
  $working_dir             = '/tmp',
  $port                    = '26379',

) {

  $config = "${conf_path}/${conf}"

  concat { $config:
    owner  => $user,
    group  => $group,
    mode   => '0644',
    #    notify => Class['::redis::sentinel::service'],
  }

  if $use_default_master {
    ::redis::sentinel::master { "${name}-default":
      master      => $name,
      master_name => $name,
      master_ip   => $::ipaddress,
      master_port => '6379',
      instance    => $name,
    }
  }

  concat::fragment { "${name}_${conf}_header":
    ensure  => present,
    target  => $config,
    content => template('redis/redis-sentinel_header.conf.erb'),
    order   => '001',
  }

  concat::fragment { "${name}_${conf}_footer":
    ensure  => present,
    target  => $config,
    content => template('redis/redis-sentinel_footer.conf.erb'),
    order   => '699',
  }

  file { "${name}_${conf_logrotate}":
    path    => "${conf_logrotate_path}/${name}_${conf_logrotate}",
    content => template('redis/redis-sentinel.logrotate.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
  }


}
