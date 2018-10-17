#!/bin/bash

#BINDIR=`dirname $0`

#pushd $BINDIR

TPCDSKIT=./tpcds-kit
TPCDS_CUSTOM=./tpcds-patch

if [ ! -d $TPCDSKIT ]
then
	echo "tpcds kit source code not found under $TPCDSKIT/."
	exit 1
fi

cp -r $TPCDS_CUSTOM/* $TPCDSKIT
