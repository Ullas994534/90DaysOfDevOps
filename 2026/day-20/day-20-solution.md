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
	
![screenshot1](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-20/images/Screenshot%20from%202026-02-14%2020-52-14.png)

## 2) Task 2: Error Count

 grep -ic "ERROR" BGL_2k.log
 
 ![screnshot2](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-20/images/Screenshot%20from%202026-02-14%2018-56-20.png)
 
## Task 3: Critical Events

grep -n "critical" BGL_2k.log | head -5

![screenshot3](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-20/images/Screenshot%20from%202026-02-14%2018-57-46.png)

## Task 4: Top 5 Errors

grep "ERROR" BGL_2k.log | awk '{$1=$2=$3=$NF=""; print}' | sort | uniq -c | sort -nr | head -5

![screenshot4](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-20/images/Screenshot%20from%202026-02-14%2018-58-31.png)

## Task 5: Generate Report

report(){
	report="log_report_$(date +%Y-%m-%d-%H-%M).txt"
	echo "Date Of Analysis : $(date +%Y-%m-%d" Time : "%H:%M)" >> $report
	echo "Name Of Log File : BGL_2k.log" >> $report
	total_lines >> $report
	err_count >> $report
	top_5 >> $report
	critical_events >> $report
	
![screenshot5](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-20/images/Screenshot%20from%202026-02-14%2020-24-28.png)

## Task 6: Archive Log

move(){
	mkdir -p /home/ullas/day20/archive
	mv $report /home/ullas/day20/archive
	echo -e "\nCreated report file $report and moved it to archive folder."
}

![screenshot6](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-20/images/Screenshot%20from%202026-02-14%2020-37-17.png)

![screenshot7](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-20/images/Screenshot%20from%202026-02-14%2020-38-11.png)

![screenshot8](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-20/images/Screenshot%20from%202026-02-14%2020-38-50.png)

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

![screenshot9](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-20/images/Screenshot%20from%202026-02-14%2020-46-01.png)


### what i learned:

I built a structured Bash script using functions, argument validation, and set -euo pipefail for safer scripting.

I performed log analysis using tools like grep, awk, sort, uniq, wc, and head.

I counted ERROR, WARNING, and CRITICAL entries and extracted the top 5 frequent error messages.

I implemented file validation and handled missing files gracefully.

I automated report generation with timestamps and dynamic file naming.

I organized output by archiving generated reports into a separate backup directory.

### Conclusion:

This challenge helped me strengthen my shall scripting skills by combining log analysis, automation, and file management into a real-world system administration task. I learned how to process logs efficiently, generate structured reports, and organize backups, making the script practical and production-ready.

