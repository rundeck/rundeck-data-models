# Rundeck Data Models

## Purpose

This library contains data models and data provider interfaces
that Rundeck uses to represent persistent data in the system.
By modeling the data in this way, the data models can be used in 
projects outside Rundeck that might need to interact with Rundeck data
in a type safe way.

## Usage

The data models are intended to be implemented using a Grails GORM Domain Object
so that the data can be persisted to a database.

The data providers provide a well-defined interface that describes how persistent
data is accessed and manipulated. The default implementation of a data providers
uses the Grails GORM API to interact with the persistent data.

## Releasing

* After making changes to the models, bump the version in the build.gradle file.
* Create a pull request with your changes.
* After the PR has been approved and merged,
pull the latest changes to `main` and create a tag
that corresponds to the version in the build.gradle file.

For CircleCi to publish the new version to Maven Central
the tag must start with `v` and end with the version number.

Example: build.gradle version is 1.0.1 create a tag named `v1.0.1`
then push with `git push origin v1.0.1` this will trigger the CircleCi workflow
to publish the new version to Maven Central.