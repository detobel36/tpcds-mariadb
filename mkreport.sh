#!/bin/bash

if [ $# -lt 1 ]
then
        echo "Usage: $0 <type of report>"
        exit 1
fi

function generateLine {
	printf "-"
}

function endFile {
	printf ""
}


INPUT_RESULT_FILE="result.txt"
TYPE_REPORT=$1

CPU_INFO=`lscpu | grep "Model name:" | grep -oE "[^:]*$" | xargs`
RAM_INFO=`free -h | grep "Mem" | grep -oE "^Mem:[ ]*[0-9,\.a-zA-Z]*" | grep -oE "[a-zA-Z0-9,\.]*$"`

if [ "$TYPE_REPORT" = "markdown" ]
then
	OUTPUT_RESULT_FILE="result.md"
	printf "CPU: $CPU_INFO   \n" > $OUTPUT_RESULT_FILE
	printf "RAM: $RAM_INFO   \n" >> $OUTPUT_RESULT_FILE

	printf "| Query | Template | Time (secs) | Note |\n|-------|----------|-------------|------|\n" >> $OUTPUT_RESULT_FILE

	function generateLine {
		printf "|$1| |\n"
	}


elif [ "$TYPE_REPORT" = "latex" ]
then
	OUTPUT_RESULT_FILE="result.tex"
	printf "CPU: $CPU_INFO\\\\\\ \\\\n" > $OUTPUT_RESULT_FILE
	printf "RAM: $RAM_INFO\\\\\\ \\\\n" >> $OUTPUT_RESULT_FILE

	printf "\\\\begin{longtable}{|c|c|c|c|}\n\\\\hline\n Query & Template & Time (secs) & Note \\\\\\ \\\\hline\n\\\\endfirsthead\n\\\\endhead\n\\\\endfoot\\\\endlastfoot" >> $OUTPUT_RESULT_FILE
	#printf "\\\\begin{table}[]\n\\\\begin{tabular}{|l|l|l|l|}\n\\\\hline\nQuery & Template & Time (secs) & Note \\\\\\ \\hline\n" > $OUTPUT_RESULT_FILE

	function generateLine {
		LIGNE=$(echo $1 | sed -r 's/\|/ \& /g')
		printf "$LIGNE & \\\\\\ \\\\hline\n"
	}

	function endFile {
		printf "\\\\end{longtable}"
		# printf "\\\\end{tabular}\n\\\\end{table}"
	}


else
	echo "Unknow type of report"
	exit
fi

COUNT=0
while read -r line
do
	if [ $COUNT -ge 1 ]
	then
		generateLine $line >> $OUTPUT_RESULT_FILE
		#printf "|$line| |\n" >> $OUTPUT_RESULT_FILE
	fi
	COUNT=$((COUNT+1))

done < "$INPUT_RESULT_FILE"

endFile >> $OUTPUT_RESULT_FILE

echo "Formated $COUNT results"
