class redis::install (
  $package        = $redis::package,
  $service        = $redis::service,
  $conf           = $redis::conf,
  $conf_logrotate = $redis::conf_logrotate,
  $pidfile        = $redis::pidfile,
  $logfile        = $redis::logfile,
  $package_ensure = $redis::package_ensure,
) {

  package { "$package":
    ensure => $package_ensure,
  }

}
