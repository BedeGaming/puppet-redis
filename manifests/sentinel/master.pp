define redis::sentinel::master (

  $conf                    = $redis::params::sentinel_conf,
  $conf_path               = $redis::params::sentinel_conf_path,

  $master                  = $name,
  $master_name             = $name,
  $master_ip               = $::ipaddress,
  $master_port             = '6379',
  $auth_pass               = undef,
  $down_after_milliseconds = '30000',
  $quorum                  = '1',
  $parallel_syncs          = undef,
  $failover_timeout        = undef,
  $priority                = 500,

  $instance                = undef,

) {

  if ($instance == undef) {
    fail('Cannot create a master without a sentinel instance')
  }

  $config = "${conf_path}/${conf}"

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
