#/bin/bash

if [ $# -lt 1 ]
then
        echo "Usage: $0 <type of report>"
        exit 1
fi

INPUT_RESULT_FILE="result.txt"
TYPE_REPORT=$1

MARKDOWN="markdown"

if [ "$TYPE_REPORT" = "$MARKDOWN" ]
then
	OUTPUT_RESULT_FILE="result.md"
	printf "| Query | Template | Time (secs) | Note |\n|-------|----------|-------------|------|\n" > $OUTPUT_RESULT_FILE
else
	echo "Unknow type of report"
	exit
fi

COUNT=0
while read -r line
do
	if [ $COUNT -ge 1 ]
	then
		printf "|$line| |\n" >> $OUTPUT_RESULT_FILE
	fi
	COUNT=$((COUNT+1))

done < "$INPUT_RESULT_FILE"
echo "Formated $COUNT results"
