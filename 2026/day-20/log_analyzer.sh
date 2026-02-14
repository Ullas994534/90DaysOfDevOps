
#!/bin/bash

set -euo pipefail
usage(){
	echo "Usage: BGL_2k.log /home/ullas/day20"
	echo "verify the log are getting analyse."
	exit 1
}

check(){
	if [ -f BHG_2k.log ];then
		:
	else
		echo "File doesn't exists"
	fi
}

error_count(){
	echo "number of errors"
	grep -ic "ERROR" BGL_2k.log
}

critical_events(){
	echo -e "\n print the critical issues"
	grep -n "critical" BGL_2k.log | head -n -5
}

top_5(){
	echo -e "\n check the top 5 errors"
	grep "ERROR" BGL_2k.log | awk '{$1=$2=$3=$NF=""; print}' | sort | uniq -c | sort -nr | head -5
}

total_lines(){
	echo -e "\n check the total number count"
        wc -l < BGL_2k.log
        }
        

report(){
	report="log_report_$(date +%Y-%m-%d-%H-%M).txt"
	echo "Date Of Analysis : $(date +%Y-%m-%d" Time : "%H:%M)" >> $report
	echo "Name Of Log File : BGL_2k.log" >> $report
	total_lines >> $report
	err_count >> $report
	top_5 >> $report
	critical_events >> $report
}

move(){
	mkdir -p /home/ullas/day20/archive
	mv $report /home/ullas/day20/archive
	echo -e "\nCreated report file $report and moved it to archive folder."
}

if [ $# -eq 0 ];then
	usage
fi

BGL_2k.log=$1
check
error_count
critical_events
top_5
report
move

