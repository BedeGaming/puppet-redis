class redis::server::service (
  $service        = $redis::server::service,
  $service_ensure = $redis::server::service_ensure,
) {

  service { "$service":
    ensure => $service_ensure,
  }

}
