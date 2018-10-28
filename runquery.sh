#!/bin/bash

if [ $# -lt 3 ]
then
	echo "Usage: $0 <query number> <save result> <path to save result> [username [mysql_path]]"
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


BINDIR=`dirname $0`

pushd $BINDIR/tpcds-kit/tools

USER=root

NUM_Q=$1
SAVE_RES=$2
PATH_RES="../../$3"

if [ $# -ge 4 ]
then
	USER=$4
fi

if [ $# -ge 5 ]
then
        MYSQL_PATH=$5
else
        MYSQL_PATH="/usr/local/mysql/bin/mysql"
fi


MYSQL="$MYSQL_PATH -u $USER"
if [ ! -z $PASSWORD ]
then
	MYSQL="$MYSQL -p $PASSWORD"
fi

QPATH=queries/query-`printf %02d $NUM_Q`.sql
SELECT_LINE=$(cat $QPATH | grep '^\-\- start')
TEMPLATE_NAME=$(echo $SELECT_LINE | grep -oE 'query([0-9]*).tpl$')
TEMPLATE_NB=$(echo $TEMPLATE_NAME | grep -oE '[0-9]*')

echo ""
echo "------------------------------------------------------------------------"
cat $QPATH
echo "------------------------------------------------------------------------"
echo ""
echo "SELECT: $SELECT_LINE"
echo "TEMP: $TEMPLATE_NB"
echo ""
echo ""

if [ $SAVE_RES -eq 1 ]
then
        START=`msecs`
fi

$MYSQL tpcds < ./$QPATH

if [ $SAVE_RES -eq 1 ]
then
	END=`msecs`
	DURATION=$(( $END - $START))
	STR_DURATION=`msec_to_sec $DURATION`
	printf "$NUM_Q|$TEMPLATE_NB|$STR_DURATION\n" >> "$PATH_RES"
fi
