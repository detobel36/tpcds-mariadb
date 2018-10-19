#!/bin/bash

if [ $# -lt 1 ]
then
	echo "Usage: $0 <scale factor> [sql_user] [sql_path]"
	exit 1
fi

if [ $# -ge 2 ]
then
	USER=$2
else
	USER=root
fi
echo "[CONFIG] Test with SQL user: $USER"

if [ $# -ge 3 ]
then
	MYSQL_PATH=$3
else
	MYSQL_PATH="/usr/local/mysql/bin/mysql"
fi
echo "[CONFIG] Use MySQL path: $MYSQL_PATH"

echo ""

BINDIR=`dirname $0`
pushd $BINDIR/tpcds-kit/tools

SF=$1
DATADIR=data_`printf %02d $SF`

if [ ! -d $DATADIR ]
then
	echo "Data at $DATADIR not found"
	exit 1
fi

function msecs() {
	echo $((`date +%s%N` / 1000000))
}

function msec_to_sec() {
	MSECS=$1
	SECS=$(($MSECS / 1000))
	MSECS=$(($MSECS - $SECS * 1000))
	printf %d.%03d $SECS $MSECS
}

MYSQL="$MYSQL_PATH -u $USER"

echo "# Create database"
$MYSQL -e "create database tpcds"
MYSQL="$MYSQL tpcds"

echo "# Create tables"
$MYSQL < ./tpcds.sql

TOTAL_MSECS=0

echo "# Load data into table"
for f in `ls $DATADIR`
do
	t=`echo $f | sed -e "s/_[0-9]_[0-9]//"`
	t=`echo $t | sed -e "s/.dat//"`
	f="./$DATADIR/"$f
	START=`msecs`
	$MYSQL -e "LOAD DATA LOCAL INFILE '$f' INTO TABLE $t FIELDS TERMINATED BY '|';"
	DURATION=$(( `msecs` - $START))
	SECS=`msec_to_sec $DURATION`
	if [ $? -ne 0 ]
	then
		echo "FAIL"
		exit 1
	fi
	printf "%23s: \t%16s secs\n" $t $SECS
	TOTAL_MSECS=$(($TOTAL_MSECS + $DURATION))
done

echo "# Create index and constraints"
START=`msecs`
$MYSQL < ./tpcds_ri.sql
DURATION=$(( `msecs` - $START))
SECS=`msec_to_sec $DURATION`

printf "index: \t%16s secs\n" $SECS
TOTAL_MSECS=$(($TOTAL_MSECS + $DURATION))

printf "Total: \t%16s secs\n" `msec_to_sec $TOTAL_MSECS`


popd
