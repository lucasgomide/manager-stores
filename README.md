# manager-stores

[![Build Status](https://travis-ci.org/lucasgomide/manager-stores.svg?branch=master)](https://travis-ci.org/lucasgomide/manager-stores)
[![Coverage Status](https://coveralls.io/repos/github/lucasgomide/manager-stores/badge.svg?branch=master)](https://coveralls.io/github/lucasgomide/manager-stores?branch=master)

_App have to be descripted here_

## Routes

Some routes

## Deployment

We're using Heroku as PAAS. So it's easy to deploy this app.
The command `git push heroku master` that's enough to do it.

## Monitoring

We're using NewRelic as Monitoring APM.

### Error Tracker

We're using Rollbar as Tracking Error.

## Benchmarking

We're using wrk (for [Linux](https://github.com/wg/wrk/wiki/Installing-Wrk-on-Linux), for [OSx](https://github.com/wg/wrk/wiki/Installing-wrk-on-OS-X)) as tool for benchmarking app

Just run at root app `./benchmarking/benchmark.sh`

## Docker

- docker-compose build
- docker-compose run app rake db:setup
- docker-compose up

## Testing

- rspec
