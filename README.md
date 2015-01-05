#Redis

##Overview
Puppet module to manage [Redis](http://redis.io/) and [Redis Sentinel](http://redis.io/topics/sentinel)

##Author
* Rob Rankin <github@undertow.ca>

## To Do
* Tests

## Requirements
### Redis Versions
Developed against Redis version 2.8.17.  Probably supports all 2.8.x, but older versions may not work.

### Operating System
Developed against CentOS 6.5, so should support most RH 6.x distributions.

### Redis Packages
Developed against the REMI Redis RPM packages, probably the best source for up to date Redis packages for RedHat.

### Pull Requests
PRs to extend the module for other Redis versions, distributions or other Redis sources are welcome.

## Module Uses

* Installation and management of Redis instances
* Manage multiple Redis instances on a single server
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
redis::server::instance { 'instance_one':
  requirepass => 'randompass'
}
```

Slave Node
```
redis::server::instance { 'instance_one_slave':
  slaveof    => '<masterip> <masterport>',
  masterauth => 'randompass',
}
```

### Addition of a Sentinel on the nodes
```
redis::sentinel::instance { 'sentinel_one':
  port => '26379',
}
```

```
redis::sentinel::masters { 'redis_instance_one':
  master_ip     => 'ip address',
  master_port   => 'port',
  authpass      => 'randompass',
  quorum        => 2,
  instance      => 'sentinel_one'
}
```



### Configuration options

All Redis Server and Sentinel config file options are available in the module to be overridden as needed.  See the params.pp class for a full list.
