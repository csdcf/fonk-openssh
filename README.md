# openssh

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with openssh](#setup)
    * [What openssh affects](#what-openssh-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with openssh](#beginning-with-openssh)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Module to manage OpenSSH with focus on using augeas for configfile modifications
to provide compatibility with upstream changes in this files.
Puppetversion: > 2.6.2
OS: RedHat

## Module Description

This Module installs the openssh server and client and manages the sshd\_config.
It optionally gathers the hostkeys and provides them for other hosts.

## Setup

### What openssh affects

* Packages and service for openssh
* sshd\_config
* system-wide known\_hosts file

### Setup Requirements

To use spreading of hostkeys you will need a puppetdb-enabled puppetserver

### Beginning with openssh

To begin using this module with default parameters, declare the class with `include openssh`

Any Puppet code that uses anything from the apt module requires that the core apt class be declared.

## Usage

```
class { 'openssh': }
```

## Reference

### Classes

* `openssh`: Main class that is used to set the variables and includes the other classes

* `openssh::params`: Sets defaults for the variables used by this module

* `openssh::install`: Installs the packages on the system

* `openssh::config`: Cares about the whole openssh-configuration including rollout of known hostkeys

* `openssh::service`: Handles the openssh service

### Parameters

#### openssh
* `ensure`: Set the ensure-value for the packages.
  Default: 'present'

* `packages`: Name or array of the packages to be installed.
  Default: osfamily-specific (see params.pp)

* `servicename`: Name of the service to be started
  Default: osfamily-specific (see params.pp)

* `sshd_config`: Path to the sshd\_config file
  Default: /etc/ssh/sshd\_config

* `sshd_config_def`: Default values for sshd\_config parameters. This should almost never need to be changed.

* `config`: A hash with all options that should get set in sshd\_config

* `exporttag`: Tag that the exported hostkey get for collecting. If 'false', key won't get exported.
  Default: managedhosts

* `collecttag`: Keys with this tag will get collected. If 'false', keys won't get collected.

## Limitations

Currently only RedHat compatible systems are supported
This is where you list OS compatibility, version compatibility, etc.

## Development

If you like to cotribute, pull requests are welcome :-)
