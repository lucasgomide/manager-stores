# manager-stores

[![Build Status](https://travis-ci.org/lucasgomide/manager-stores.svg?branch=master)](https://travis-ci.org/lucasgomide/manager-stores)
[![Coverage Status](https://coveralls.io/repos/github/lucasgomide/manager-stores/badge.svg?branch=master)](https://coveralls.io/github/lucasgomide/manager-stores?branch=master)

Manager Store is a simple web application to manager some POS (Points of sale). You can search the closest POS once given longitude and latitude. You can also create new ones POS and get a specific one from its ID.

## Application

What is under this app ? It's basic Rails API with GraphQL as query language API, Postgres as database store with postgis extension to store some geography/geometric data.

Why I've choosen this kind of stack instead of another one.

At first, why Rails? I've started this project using Sinatra + Sequel. Although I get some troubles to make it a modular application easily. After 3 days developing it, I had choose change it to Rails. Earning the active-record (ORM) I was able to include the _activerecord-postgis-adapter_ to handler better geometric datas type. Changing to Rails give me more power to build a modular and flexibilty application.

Why GraphQL ? I've decided use GraphQL to learn more about it. It was my first experience. No more reason.

And about Postgres? I was thinking about what kind of aproach. So, I took my decision thinking about a real project. Thinking about costs and manageability. The redis is memory database, usually no persitent and add any cluster is expensive (usually). It's a little hard do debug and find some keys (it was based on my experience).
The Postgres is a powerful database store. Writing and reading are extremally fast operation and easy to manager.
Although Redis is faster than Postgres because is a memory database I've choseen Postgres thinking mainly about costs and manageability.

## How to use it

That's the graphQL schema supported:

```graphql
{
  id
  tradingName
  document
  ownerName
  address {
    type
    coordinates
  }
  coverageArea {
    type
    coordinates
  }
}
```

It means you can get all of them data. Once given the API will return it.

[Query/Output examples](link)
[Using with variables](link)

### getPDV

Providing some id this route returns the POS.

Method: GET

URL: `https://manager-stores.herokuapp.com/graphql?query={getPDV(id: 11){ownerName}}`

### createPDV

Giving an input this request will try create the resource.

Method: POST

URL: `https://manager-stores.herokuapp.com/graphql`

Payload:

```graphql
mutation {
  createPDV(
    tradingName: "Bar do zé"
    ownerName: "Cori"
    document: "1233123/232"
    address: { coordinates: [12, 23] }
    coverageArea: { coordinates: [[[[123, 123]]]] }
  ) {
    id
    address {
      id
      coordinates
    }
  }
}
```

### searchClosestPDV

Providing latitude and longitude the closest POS with coverage this area.

Method: GET

URL: `https://manager-stores.herokuapp.com/graphql?query={searchClosestPDV(lng: -40.36556, lat: -22.99669){ownerName}}`

## Deployment

We're using Heroku as PAAS for this app.
The command `git push heroku master` that's enough to deploy it.

## Monitoring

We're using NewRelic as Monitoring APM.

### Error Tracker

We're using Rollbar as Tracking Error.

## Benchmarking

We're using wrk (for [Linux](https://github.com/wg/wrk/wiki/Installing-Wrk-on-Linux), for [OSx](https://github.com/wg/wrk/wiki/Installing-wrk-on-OS-X)) as tool for benchmarking app

Just run at root app `./benchmarking/benchmark.sh`

## Development

```bash
docker-compose build #(once executed it is not necessary anymore. Except if you'd made any changes on Dockerfile or docker-compose.)
docker-compose up
```

## Testing

```bash
docker-compose build #(once executed it is not necessary anymore. Except if you'd made any changes on Dockerfile or docker-compose.)
docker-compose up
docker-compose run app rake spec
```
