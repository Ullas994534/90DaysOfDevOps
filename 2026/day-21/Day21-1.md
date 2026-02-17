**### Day 21 – Shell Scripting Cheat Sheet**

**### Build Your Own Reference Guide (DevOps Friendly)**

-----
**## Quick Reference Table**

|**Topic**|**Key Syntax**|**Description**|
| :- | :- | :- |
|Shebang|#!/bin/bash|Defines interpreter (must be first line)|
|Variable|VAR="value"|Declare variable|
|Arguments|$1, $2, $#, $@|Command-line inputs|
|If|if [ condition ]; then|Conditional statement|
|For Loop|for i in list; do|Loop through list|
|Function|name() {}|Define function|
|Read Input|read var|Take user input|
|Grep|grep pattern file|Search text|
|Awk|awk '{print $1}' file|Print column|
|Sed|sed 's/old/new/g'|Replace text|
|Head|head -5 file|First 5 lines|
|Tail|tail -5 file|Last 5 lines|
|WC|wc -l file|Line count|
|Make Executable|chmod +x script.sh|Give execute permission|

-----
**🔹 Task 1: Basics**

**1️⃣ Shebang**

#!/bin/bash

Defines the interpreter for the script.

-----
**2️⃣ Running a Script**

chmod +x script.sh

./script.sh

bash script.sh

-----
**3️⃣ Comments**

\# This is a comment

echo "Hello" # Inline comment

-----
**4️⃣ Variables**

name="Ullas"

echo "$name"

echo '$name'  # Prints literally

-----
**5️⃣ Read User Input**

echo "Enter name:"

read name

-----
**6️⃣ Command-Line Arguments**

$0  # Script name

$1  # First argument

$#  # Number of arguments

$@  # All arguments

$?  # Last command exit status

-----
**🖥 Example: Basic Node Health Check Script**

#!/bin/bash

echo "Script Name: $0"

if [ $# -lt 1 ]; then

`    `echo "Usage: $0 <server\_name>"

`    `exit 1

fi

SERVER\_NAME="$1"

echo "Number of arguments: $#"

echo "Server Name: $SERVER\_NAME"

echo "All arguments: $@"

echo "Enter your name:"

read USER\_NAME

GREETING="Hello"

echo "$GREETING $USER\_NAME, checking node: $SERVER\_NAME"

DATE=$(date)

echo "Current Date: $DATE"

echo "Last command exit status: $?"

exit 0

-----
**🔹 Task 2: Operators & Conditionals**

**✅ String Comparisons**

[ "$a" = "$b" ]

[ "$a" != "$b" ]

[ -z "$a" ]

[ -n "$a" ]

**✅ Integer Comparisons**

[ $a -eq $b ]

[ $a -gt $b ]

[ $a -lt $b ]

**✅ File Tests**

[ -e file ]

[ -f file ]

[ -d dir ]

[ -r file ]

[ -w file ]

[ -x file ]

[ -s file ]

-----
**💾 Example: Disk Usage Alert Script**

#!/bin/bash

usage=$(df -h / | awk 'NR==2 {gsub("%",""); print $5}')

if [ "$usage" -gt 90 ]; then

`    `echo "CRITICAL: Disk usage above 90% ($usage%)"

`    `exit 1

elif [ "$usage" -gt 80 ]; then

`    `echo "WARNING: Disk usage above 80% ($usage%)"

`    `exit 2

else

`    `echo "OK: Disk usage normal ($usage%)"

`    `exit 0

fi

-----
**🔹 Task 3: Loops**

**🔁 For Loop (List)**

for i in 1 2 3; do

`    `echo $i

done

**🔁 For Loop (C Style)**

for ((i=0;i<5;i++)); do

`    `echo $i

done

**🔁 While Loop**

while [ $i -gt 0 ]; do

`    `echo $i

`    `((i--))

done

**🔁 Until Loop**

until [ $i -eq 5 ]; do

`    `echo $i

`    `((i++))

done

-----
**🛠 Example: Service Status Checker**

#!/bin/bash

services=("nginx" "sshd" "docker" "cron")

for service in "${services[@]}"; do

`    `if systemctl is-active --quiet "$service"; then

`        `echo "SUCCESS: $service is running"

`    `else

`        `echo "ERROR: $service is NOT running"

`    `fi

done

-----
**🔹 Task 4: Functions**

check\_service() {

`    `local service\_name=$1

`    `if systemctl is-active --quiet "$service\_name"; then

`        `echo "SUCCESS: $service\_name is running"

`        `return 0

`    `else

`        `echo "ERROR: $service\_name is NOT running"

`        `return 1

`    `fi

}

check\_service nginx

if [ $? -eq 0 ]; then

`    `echo "Everything is fine."

else

`    `echo "Please restart the service."

fi

-----
**🔹 Task 5: Text Processing Commands**

**🔎 Grep**

grep -i "error" file.log

grep -r "text" /var/log

**📊 Awk**

awk '{print $1}' file

awk -F, '{print $2}' file.csv

**✏ Sed**

sed 's/old/new/g' file

sed -i 's/a/b/g' file

**✂ Cut**

cut -d: -f1 /etc/passwd

**🔃 Sort & Uniq**

sort file.txt

sort -n file.txt

uniq -c file.txt

-----
**🔥 Real Log Analysis Example**

awk '{print $1}' /var/log/nginx/access.log | sort | uniq -c | sort -nr | head -5

-----
**🔹 Task 6: Useful DevOps One-Liners**

find . -type f -mtime +7 -delete

wc -l \*.log

sed -i 's/old/new/g' \*.txt

systemctl status nginx

df -h | awk '$5>80'

tail -f app.log | grep ERROR

-----
**🔹 Task 7: Error Handling & Debugging**

**Strict Mode**

set -e

set -u

set -o pipefail

set -x

-----
**🛡 Production-Level Backup Script**

#!/bin/bash

set -euo pipefail

set -x

SOURCE\_DIR="/home/user/data"

BACKUP\_DIR="/backup"

TMP\_FILE="/tmp/backup\_temp.log"

cleanup() {

`    `echo "Cleaning up temporary files..."

`    `rm -f "$TMP\_FILE"

}

trap cleanup EXIT

if [ ! -d "$SOURCE\_DIR" ]; then

`    `echo "Error: Source directory does not exist!"

`    `exit 1

fi

tar -czf "$BACKUP\_DIR/data\_backup.tar.gz" "$SOURCE\_DIR" > "$TMP\_FILE"

echo "Backup completed successfully!"

exit 0

