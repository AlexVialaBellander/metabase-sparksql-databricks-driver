# Metabase Driver: Spark Databricks

**Credits**: This repository is only an updated version of the work of Fernando Goncalves and Rajesh Kumar Ravi and later Renan Ferreira and later Léon Stefani.

## Installation

To build a dockerized Metabase including the Databricks driver from this repository, simply run:

```
docker build -t metabase:0.49.6-databricks -f Dockerfile .
```

The Metabase Databricks driver gets build and included in a final Metabase docker image.

## Building the driver (advanced way)

### Prereq: Install Metabase as a local maven dependency, compiled for building drivers

Clone the [Metabase repo](https://github.com/metabase/metabase) first if you haven't already done so.

```bash
cd /path/to/metabase/
./bin/build
```

### Build the Spark Databricks driver

```bash
# (In the sparksql-databricks driver directory)
clojure -X:build :project-dir "\"$(pwd)\""
```

### Copy it to your plugins dir and restart Metabase

```bash
mkdir -p /path/to/metabase/plugins/
cp target/sparksql-databricks.metabase-driver.jar /path/to/metabase/plugins/
jar -jar /path/to/metabase/metabase.jar
```

_or:_

```bash
mkdir -p /path/to/metabase/plugins
cp target/sparksql-databricks.metabase-driver.jar /path/to/metabase/plugins/
cd /path/to/metabase_source
lein run
```
