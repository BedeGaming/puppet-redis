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

* Installation and management of Redis instances
* Creation of Redis Master/Slave setups
* Installation and management of Sentinel instances (manages Redis master/slave failvoer)

## Install Redis

### Base Redis install within sane defaults, as taken from 2.8.17
```
class { '::redis': }
```

### Redis Master / Slave Setup with 2 nodes
Master Node
```
class { '::redis':
  requirepass => 'randompass'
}
```

Slave Node
```
class { '::redis':
  slaveof    => '<masterip> <masterport>',
  masterauth => 'randompass',
}
```

### Addition of a Sentinel on nodes
Master Node
```
class { '::redis':
  requirepass          => 'randompass'
  sentinel_enable      => true,
  sentinel_master_name => '<mastername>,
  sentinel_master_ip   => '<masterip>',
  sentinel_master_port => '<masterport>',
  sentinel_quorum      => '<quorum>',
}
```

Slave Node
```
class { '::redis':
  slaveof              => '<masterip> <masterport>',
  masterauth           => 'randompass',
  sentinel_enable      => true,
  sentinel_master_name => '<mastername>,
  sentinel_master_ip   => '<masterip>',
  sentinel_master_port => '<masterport>'
  sentinel_quorum      => '<quorum>',
}
```



### Configuration options

All Redis Server and Sentinel config file options are available in the module to be overridden as needed.  See the params.pp class for a full list.
