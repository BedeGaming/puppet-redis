class redis::service (
  $service        = $redis::service,
  $service_ensure = $redis::service_ensure,
) {

  service { "$service":
    ensure => $service_ensure,
  }

}
