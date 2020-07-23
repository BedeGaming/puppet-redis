define redis::sentinel::master (

  $conf                    = $redis::params::sentinel_conf,
  $conf_path               = $redis::params::sentinel_conf_path,

  $master                  = $name,
  $master_name             = $name,
  $master_ip               = $redis::params::sentinel_master_ip,
  $master_port             = $redis::params::sentinel_master_port,
  $auth_pass               = $redis::params::sentinel_auth_pass,
  $down_after_milliseconds = $redis::params::sentinel_down_after_milliseconds,
  $quorum                  = $redis::params::sentinel_quorum,
  $parallel_syncs          = $redis::params::sentinel_parallel_syncs,
  $failover_timeout        = $redis::params::sentinel_failover_timeout,
  $priority                = $redis::params::sentinel_priority,

  $instance                = $redis::params::sentinel_master_instance,

) {

  if ($instance == undef) {
    fail('Cannot create a master without a sentinel instance')
  }

  $config = "${conf_path}/${instance}_${conf}"

  $tmpFile=md5("${master}-${priority}-master")

  concat::fragment { "${tmpFile}":
    ensure  => present,
    target  => $config,
    content => join([
      template('redis/redis-sentinel_body.conf.erb'),
    ], ''),
    order   => "${priority}",
  }

}
