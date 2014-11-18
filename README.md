#Redis

##Overview
Puppet module to manage [Redis](http://redis.io/)

##Author
* Rob Rankin <github@undertow.ca>

## To Do
* Tests

## Requirements
### Redis Versions
Currently only supports 2.8.x.  No plans to support older versions of Redis, however pull requests will be accepted!

### Operating System
This module currently requires RedHat/CentOS.  Pull requests to extend it for other OS's gratefully accepted.

### Redis Packages
This module requires RedHat compatible RPMs to be available.  Possibly the best source for these is the REMI repos, which provide RPMs up to version 2.8.17 (most current at time of writing)

## Module Uses

* Installation and upgrading of Redis instances
* Creation of Redis Master/Slave setups
* Anything you can do with the Redis config file

## Install Redis

### Base Redis install within sane defaults
```
class { '::redis': }
```

### Redis Master / Slave Setup with 2 nodes
Node 1
```
class { '::redis':
  requirepass => 'randompass'
}
```

Node 2
```
class { '::redis':
  slaveof    => '<masterip> <masterport>'
  masterauth => 'randompass'
}
```


### Configuration options

All redis config file options are available in the module to be overridden as needed.  See the params.pp class for a full list.
