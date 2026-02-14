### Day 20 – Bash Scripting Challenge: Log Analyzer and Report Generator

# Task -> As we are system administrator responsible for managing a network of servers.

The script scans a specified log directory and checks if it exists before processing.

It analyzes only today’s log files and counts ERROR, WARNING, and CRITICAL entries.

It calculates the total number of log lines and identifies the top 5 frequent error messages.

Empty or unreadable log files are skipped with a proper note in the report.

A daily summary report is generated with date, server name, and log statistics.

The report is saved in a separate reports folder with proper naming format.

### Challenge Tasks

## Task 1: Input and Validation

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

usage
	
![screenshot1]()

## 2) Task 2: Error Count

 grep -ic "ERROR" BGL_2k.log
 
 ![screnshot2]()
 
## Task 3: Critical Events

grep -n "critical" BGL_2k.log | head -5

![screenshot3]()

## Task 4: Top 5 Errors

grep "ERROR" BGL_2k.log | awk '{$1=$2=$3=$NF=""; print}' | sort | uniq -c | sort -nr | head -5

![screenshot4]()

## Task 5: Generate Report

report(){
	report="log_report_$(date +%Y-%m-%d-%H-%M).txt"
	echo "Date Of Analysis : $(date +%Y-%m-%d" Time : "%H:%M)" >> $report
	echo "Name Of Log File : BGL_2k.log" >> $report
	total_lines >> $report
	err_count >> $report
	top_5 >> $report
	critical_events >> $report
	
![screenshot5()

## Task 6: Archive Log

move(){
	mkdir -p /home/ullas/day20/archive
	mv $report /home/ullas/day20/archive
	echo -e "\nCreated report file $report and moved it to archive folder."
}

![screenshot6]()

### log_analyzer.sh

#!/bin/bash
set -euo pipefail
usage(){
	echo "Usage: BGL_2k.log /home/ullas/day20"
	echo "verify the log are getting analyse."
}

check(){
	if [ -f BGL_2k.log ];then
		:
	else
		echo "File doesn't exists"
	fi
}

error_count(){
	echo "===============number of errors======================="
	grep -ic "ERROR" BGL_2k.log
}

critical_events(){
	echo -e "=========print the critical issues============"
	grep -n "critical" BGL_2k.log | head -5
}

top_5(){
	echo -e "\n ==========check the top 5 errors==============="
	grep "ERROR" BGL_2k.log | awk '{$1=$2=$3=$NF=""; print}' | sort | uniq -c | sort -nr | head -5
}

total_lines(){
	echo -e "\n ==================== check the total number count===================="
        wc -l < BGL_2k.log
        }
        

report(){
	echo -e "\n ================= genarate the report ========================="
	report="BGL_report_$(date +%Y-%m-%d-%H-%M).txt"
	echo "Date Of Analysis : $(date +%Y-%m-%d" Time : "%H:%M)" >> $report
	echo "Name Of Log File : BGL_2k.log" >> $report
	total_lines >> $report
	error_count >> $report
	top_5 >> $report
	critical_events >> $report
	echo "============= successfully created the report=========="
}

move(){

	echo -e "\n =============== move the report to another dir for backup==========="
	mkdir -p /home/ullas/day20/archive
	mv $report /home/ullas/day20/archive
	echo -e "\n Created report file $report and moved it to archive folder."
}

if [ $# -eq 0 ];then
	usage
fi

check
error_count
critical_events
top_5
total_lines
report
move

![screenshot6]()
