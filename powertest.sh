#!/bin/bash

# Do Power Test of TPC-DS

BINDIR=`dirname $0`

USER=root

# Usage: $0 [user [mysql_path]]

if [ $# -ge 1 ]
then
	USER=$1
fi
echo "[CONFIG] Use MySQL user: $USER"

if [ $# -ge 2 ]
then
        MYSQL_PATH=$2
else
        MYSQL_PATH="/usr/local/mysql/bin/mysql"
fi
echo "[CONFIG] Use MySQL path: $MYSQL_PATH"

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
if [ ! -z $PASSWORD ]
then
	MYSQL="$MYSQL -p $PASSWORD"
fi

MYSQL="$MYSQL tpcds"

TOTAL_MSECONDS=0
# We use only 50 queries
for q in {1..48}
do
	START=`msecs`
	./runquery.sh $q $USER $MYSQL_PATH > /dev/null
	END=`msecs`
	DURATION=$(( $END - $START))
	printf "%d: \t%16s secs\n" $q `msec_to_sec $DURATION`
	TOTAL_MSECONDS=$(($TOTAL_MSECONDS + $DURATION))
done

printf "Total: \t%16s secs\n" `msec_to_sec $TOTAL_MSECONDS`
