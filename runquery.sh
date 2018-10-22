#!/bin/bash

if [ $# -lt 1 ]
then
	echo "Usage: $0 <query number> [username [mysql_path]]"
	exit 1
fi

BINDIR=`dirname $0`

pushd $BINDIR/tpcds-kit/tools

USER=root

NUM_Q=$1

if [ $# -ge 2 ]
then
	USER=$2
fi

if [ $# -ge 3 ]
then
        MYSQL_PATH=$3
else
        MYSQL_PATH="/usr/local/mysql/bin/mysql"
fi


MYSQL="$MYSQL_PATH -u $USER"
if [ ! -z $PASSWORD ]
then
	MYSQL="$MYSQL -p $PASSWORD"
fi

QPATH=queries/query-`printf %02d $NUM_Q`.sql
echo ""
echo "------------------------------------------------------------------------"
cat $QPATH
echo "------------------------------------------------------------------------"
echo ""
echo ""
$MYSQL tpcds < ./$QPATH
