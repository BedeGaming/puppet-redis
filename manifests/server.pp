class redis::server (

  $service                           = $redis::server_service,
  $service_ensure                    = $redis::server_service_ensure,
  $service_manage                    = $redis::server_service_manage,
  $cluster_name                      = $redis::server_cluster_name,
  $conf                              = $redis::server_conf,
  $conf_path                         = $redis::server_conf_path,
  $conf_logrotate                    = $redis::server_conf_logrotate,
  $conf_logrotate_path               = $redis::server_conf_logrotate_path,
  $pidfile                           = $redis::server_pidfile,
  $logfile                           = $redis::server_logfile,

  $instances                         = $redis::server_instances,

) {

  create_resources('redis::server::instance',$instances)

}
