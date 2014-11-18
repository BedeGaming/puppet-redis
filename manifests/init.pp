# Module to Manage Redis and Sentinel
class redis (
  $package        = $redis::params::package,
  $service        = $redis::params::service,
  $conf           = $redis::params::conf,
  $conf_logrotate = $redis::params::conf_logrotate,
  $pidfile        = $redis::params::pidfile,
  $logfile        = $redis::params::logfile,
  $package_ensure = $redis::params::package_ensure,
) inherits redis::params {

  contain 'redis::install'
  contain 'redis::config'
  contain 'redis::service'

  Class['redis::install']->
  Class['redis::config']~>
  Class['redis::service']

}
