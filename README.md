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