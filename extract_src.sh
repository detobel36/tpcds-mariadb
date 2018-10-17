#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Usage: $0 <src tarball path>"
	exit 1
fi

unzip $1 -d tpcds-unzip
mv tpcds-unzip/*/ tpcds-kit
rmdir tpcds-unzip
