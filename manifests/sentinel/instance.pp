define redis::sentinel::instance (

  $service_ensure          = $redis::params::sentinel_service_ensure,
  $service_enable          = $redis::params::sentinel_enable,
  $service                 = $redis::params::sentinel_service,
  $service_path            = $redis::params::sentinel_service_path,
  $unit_path               = $redis::params::sentinel_unit_path,
  $conf                    = $redis::params::sentinel_conf,
  $conf_path               = $redis::params::sentinel_conf_path,
  $conf_logrotate          = $redis::params::sentinel_conf_logrotate,
  $conf_logrotate_path     = $redis::params::sentinel_conf_logrotate_path,
  $pidfile                 = $redis::params::sentinel_pidfile,
  $pidfile_path            = $redis::params::sentinel_pidfile_path,
  $logfile                 = $redis::params::sentinel_logfile,
  $logfile_path            = $redis::params::sentinel_logfile_path,
  $protected_mode          = $redis::params::sentinel_protected_mode,

  $master                  = $name,
  $use_default_master      = false,

  $user                    = $redis::params::sentinel_user,
  $group                   = $redis::params::sentinel_group,
  $announce_ip             = $redis::params::sentinel_announce_ip,
  $announce_port           = $redis::params::sentinel_announce_port,
  $working_dir             = $redis::params::sentinel_working_dir,
  $port                    = $redis::params::sentinel_port,

  $myid                    = sha1($redis::params::sentinel_myid_raw),

) {

  exec { "${name}-sentinel_refresh":
    command     => "/usr/bin/cp ${conf_path}/redis.d/${name}_${conf} ${conf_path}/${name}_${conf} && /usr/bin/chown ${user}:${group} ${conf_path}/${name}_${conf}",
    refreshonly => true,
  }

  $config = "${conf_path}/redis.d/${name}_${conf}"

  concat { $config:
    owner  => root,
    group  => root,
    mode   => '0644',
    notify => Exec["${name}-sentinel_refresh"],
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

  file { "${name}_${conf_logrotate}_logrotate":
    path    => "${conf_logrotate_path}/${name}_${conf_logrotate}",
    content => template('redis/redis-sentinel.logrotate.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
  }

  file { "${name}_${service}_init":
    path    => "${service_path}/${name}_${service}",
    ensure  => absent,
    notify  => Exec["${name}_systemd_reload"],
  }

  file { "${name}_${service}_unit":
    path    => "${unit_path}/${name}_${service}.service",
    content => template('redis/redis-sentinel-unit.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
    notify  => Exec["${name}_systemd_reload"],
  }

  exec { "${name}_systemd_reload":
    path        => ['/bin','/sbin'],
    command     => 'systemctl daemon-reload',
    refreshonly => true,
    notify      => Service["${name}_${service}"],
  }

  service { "${name}_${service}":
    ensure    => $service_ensure,
    name      => "${name}_${service}",
    enable    => $service_enable,
    require   => [ File["${name}_${service}_init"], Concat["${config}"], File["${name}_${conf_logrotate}_logrotate"] ],
    subscribe => Exec["${name}-sentinel_refresh"],
  }

}
