# TPC-DS for MariaDB

This repository contains files to download, build and test [MariaDB](https://mariadb.com) with [TPC-DS benchmark](http://www.tpc.org/tpcds/).



## Versions

This toolbox is tested for TPC-DS tools v2 and MariaDB 10.2.


## Limitations

TPC-DS has 99 queries for performance test.  However, some queries use SQL
keywords that MariaDB doesn't support.  Our tools just ignore such queries on
power test.  As a result, we use only 96 queries for power test.

#### Not supported keyword
All the queries aren't support because MariaDB 10.2 don't support `INTERSECTION`, `EXCEPT` and `GROUPING`.  Some queries have been adapt to the MariaDB syntax.  More information in the file [ChangelogTemplates](ChangelogTemplates.md).

## Pre-requisites
You should install MariaDB and have an access to this database with a user that have all access without password.

#### Makefile Configuration
You need to configure some parameter before to user the Makefile.  To make that you can copy the [Makefile Config Example](Makefile.config.example), with the following command:
```
cp Makefile.config.example Makefile.config
```
In this file you can configure: the user which will access to the database (without any password and enought permission to create a new database, execute queries...), the path to the database, but also the size of the data that you will generate, load and test.  You can also change the path to fetch the TPC-DS Kit but it must be a git repository.

## Makefile

Use the command `make help` to see all command of Makefile.        
Note that this Makefile is more a tool that a real compile process.  This will help you to setup your install and test different component.

#### Output of help
```--- Help of this Makefile ---

----- INIT PROJECT -----
You could make all the following step with the command: *make*

make install
        To install all software

make extract
        To download and unzip TPC-DS files

make patch
        Apply modifiction to the downloaded TPC-DS files

make build
        Build TPC-DS Tool

----- CLEAR -----

make clean
        Clean build of the tool and all other tests

make remove
        Remove all downloaded files (do not uninstall software)

----- TEST -----

make test
        Test all queries and mesure performances (with size specified in the configuration)

make test_all
        Initialize test (next command) and test performance of all queries (previous command)

make init_test
        Initialize test: generate data and load into database

make test_query QUERY=<num>
        Test a specific query (you

----- DATABASE -----

make install_database
        Install last version of maria-db

make create_mysql_user
        Create user in mariadb (based on configuration) with all permission and without password

----- REPORT -----

make report_md
        Create a Markdown report of the last test


make report_tex
        Create a LaTeX report of the last test
```

## Quick start
To test easily the tool, you just need to execute the two following command:
```
make
make test
```
The first command will install all needed software, download TPC-DS Tools, apply patch (content in this repository) and build the tool.


## Author

This code is based on [SeongJae Park <sj38.park@gmail.com> repository](https://github.com/sjp38/tpcds-mariadb) and edited by Detobel36

