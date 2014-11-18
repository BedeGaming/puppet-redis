class redis::install (
  $package        = $redis::package,
  $package_ensure = $redis::package_ensure,
) {

  package { "$package":
    ensure => $package_ensure,
  }

}
