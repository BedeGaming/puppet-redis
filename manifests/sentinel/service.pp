class redis::sentinel::service (
  $service        = $redis::sentinel::service,
  $service_ensure = $redis::sentinel::service_ensure,
) {

  service { "$service":
    ensure => $service_ensure,
  }

}
