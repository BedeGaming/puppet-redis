#Redis

##Overview
Puppet module to manage [Redis](http://redis.io/)

##Author
* Rob Rankin <github@undertow.ca>

## To Do
* Tests

## Requirements

### Operating System
This module currently requires RedHat/CentOS.  Pull requests to extend it for other OS's gratefully accepted.

### Redis Packages
This module requires RedHat compatible RPMs to be available.  Possibly the best source for these is the REMI repos, which provide RPMs up to version 2.8.17 (most current at time of writing)

## Module Uses

* Installation and upgrading of Redis instances

## Install Redis

### Base FoundationDB install within sane defaults
```
class { '::redis': }
```

### Configuration options

All redis config file options are available in module to be overridden as needed.  See the params.pp class for a full list.
