### Day 18 – Shell Scripting: Functions & Slightly Advanced Concepts
Task
Write cleaner, reusable scripts — learn functions, strict mode, and real-world patterns.

You will:

Write and call functions
Use set -euo pipefail for safer scripts
Work with return values and local variables
Build a slightly advanced script.

### Challenge Tasks

## Task 1: Basic Functions


#!/bin/bash

Trainwithshubham()
{

echo "Hello, shubham bhai"
echo "i want to meet you once in bangalore"

}

#ullas called Trainwithshubham function
Trainwithshubham

# DevOps
Trainwithshubham

## Expected Output

![screenshot1](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-18/images/Screenshot%20from%202026-02-11%2023-35-44.png)

## 2) Task 2: Functions with Return Values

Create disk_check.sh with:

#!/bin/bash

check_disk() {
	echo "--- disk space ---"
	df -h
}

check_memory() { 
	echo "--- Memory Usage (RAM and Swap) ---"
	free -h
}

#main function calls
check_disk
check_memory

## Expected Output

![screenshot2](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-18/images/Screenshot%20from%202026-02-12%2000-16-43.png)

### 3) Task 3: Strict Mode — set -euo pipefail

set -e --> Exit immediately if errors occurs.
set -u --> can be used to treat undefined variables as an error
set -o pipefail -->catch error inside pipes

#!/bin/bash

#The "Safety Net" -unofficial Bash strict mode

set -euo pipefail

# if $DIRECTORY is not set, the script stop here (due to -u)

#instead of deleting the root directory.
rm -rf "/home/ullas/pipefail"

echo "script finished successfully"

![screenshot3](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-18/images/Screenshot%20from%202026-02-12%2012-32-07.png)

## 4) Task 4: Local Variables

ubuntu:~$ cat local_variable.sh
#!/bin/bash

demo1(){
local mgs="enter the local mgs"
echo $mgs
}

demo2(){
mgs="enter the global mgs"
}

demo1
echo "outside the function:$mgs"

demo2
echo "function:$mgs"

![screenshot5](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-18/images/Screenshot%20from%202026-02-12%2015-52-58.png)


### Task 5: Build a Script — System Info Reporter

ubuntu:~$ 

#!/bin/bash

set -euo pipefail

host_name() {
hostname
uname -a
}

up_time() {
uptime
}

disk_usage() {
du -sh | head -n 5
}

memory_usage() {
free -h
}

top_cpu() {
top | head -n 5
}

main(){

# calling the function
echo "-----------hostame----------"

host_name

# calling the function
echo "------------uptime----------"
uptime

# calling the function
echo "------------disk_usage-------"
disk_usage

# calling the function
echo "-----------memory_usage-------"
memory_usage

# calling the function
echo "-------------top--------------"
top | head -n 5
}

main

### output

![screenshot4](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-18/images/Screenshot%20from%202026-02-12%2015-52-58.png)

What I Learned (Shell Scripting)

✅ How to write and call functions in Bash for cleaner and reusable scripts

✅ How to pass arguments to functions using $1, $2

✅ Difference between printing output and using return values / exit codes

✅ Why local variables are important to prevent variable leakage

✅ How to use strict mode: set -euo pipefail

-e → Exit script if a command fails

-u → Error on undefined variables

-o pipefail → Fail if any command in a pipeline fails

✅ How to structure scripts with a main() function

✅ Built a real-world System Info Reporter using modular functions

✅ Learned to write safer, production-style Bash scrip
