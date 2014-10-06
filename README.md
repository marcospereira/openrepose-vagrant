# Open Repose Vagrant

A simple Vagrant configuration to test [Open Repose](http://openrepose.org/) API Gateway.

## Requirements

1. [Vagrant](https://www.vagrantup.com/)

## Getting Started

Create, provision and start the Vagrant VM:

    $ make setup

Check it out!

    $ curl -i -v http://localhost:8880/people.json # nginx is ok
    $ curl -i -v -H 'x-pp-user: someuser' http://localhost:8888/people.json # proxied by repose