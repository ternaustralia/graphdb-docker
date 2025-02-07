# GraphDB Container Images

This repository provides GraphDB container images published to GitHub Container Registry with support for `linux/amd64` and `linux/arm64`.

## Building

You will need docker and make installed on your machine.

1. Checkout this repository
1. Run
```bash
make build VERSION=<the-version-that-you-got>
```

For example the most recent version as of this writing is 10.0.2 so run
```bash
make build VERSION=10.0.2
```

This will build and push an image that you can use called `ghcr.io/ternaustralia/graphdb:10.0.2`.
You can run the image now with

```bash
docker run -d -p 7200:7200 ghcr.io/ternaustralia/graphdb:10.0.2
```

Consult the docker hub documentation for more information.

## Preload a repository

Go to the `preload` folder to run the bulk load data when GraphDB is stopped.

```bash
cd preload
```

By default it will:

* Create or override a repository defined in the `graphdb-repo-config.ttl` file (can be changed manually in the file, default is `demo`)
* Upload a test ntriple file from the `preload/import` subfolder.

> See the [GraphDB preload documentation](http://graphdb.ontotext.com/documentation/free/loading-data-using-preload.html) for more details.

When running the preload docker-compose various parameters can be provided in the `preload/.env` file:

```bash
GRAPHDB_VERSION=10.0.0
GRAPHDB_HEAP_SIZE=2g
GRAPHDB_HOME=../graphdb-data
REPOSITORY_CONFIG_FILE=./graphdb-repo.ttl
```

Build and run:

```bash
docker-compose build
docker-compose up -d
```

> GraphDB data will go to `/data/graphdb`

Go back to the root of the git repository to start GraphDB:

```bash
cd ..
```

### Start GraphDB

To start GraphDB run the following **from the root of the git repository**:

```bash
docker-compose up -d
```

> It will use the repo created by the preload in `graphdb-data/`

> Feel free to add a `.env` file similar to the preload repository to define variables.


# Issues

You can report issues in the GitHub issue tracker or at graphdb-support at ontotext.com


# Contributing

You are invited to contribute new features, fixes, or updates, large or small;
we are always thrilled to receive pull requests, and do our best to process
them as fast as we can.

Before you start to code, we recommend discussing your plans through a GitHub
issue, especially for more ambitious contributions. This gives other
contributors a chance to point you in the right direction, give you feedback on
your design, and help you find out if someone else is working on the same
thing.