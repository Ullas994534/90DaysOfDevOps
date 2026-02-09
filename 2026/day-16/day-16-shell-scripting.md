### Day 16 – Shell Scripting Basics
Task

Now i have started the shell scripting hand-on practice, for my DevOps journey to next level with scripting knowledge for more hands-on practice with shell scripting.


You will:

understood the sheband in shell scripting is important part so we will use the being of the script for #!/bin/bash.
i will get to know about the variables, echo and read how should we use in shell scripting.
and we will gets to know the basic information about if-else conditions and concepts of real scripts

### Challenge Tasks

## Task 1: Your First Script

vim hello.sh
echo "Hello Dosto!"

chmod +x <filename> --> it will give the file to (+x) is the file to executable persmissions.
,/hello.sh --> it will execute the file and will get the output ## Hello Dosto!

![screenshot1](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-16/images/Screenshot%20From%202026-02-09%2012-41-45.png)

if we remove the shebang then also script when run and using bash hello.sh.
The shebang becomes critical when running scripts directly (./script.sh).

## Task 2: Variables

#!/bin/bash
NAME="ULLAS BANAMAGI"
ROLE="DevOps Engineer"
echo "Hello, I am "$NAME" and I am a "$ROLE""

![Screenshot2](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-16/images/Screenshot%20From%202026-02-09%2012-59-44.png)

## Task 3: User Input with read

#!/bin/bash

NAME="ULLAS BANAMAGI"
FAVOURITE_TOOL="DOCKER"

echo "hello "$NAME", your favourite tool is "$FAVOURITE_TOOL""

![Screenshot3](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-16/images/Screenshot%20From%202026-02-09%2013-15-50.png)

## Task 4: If-Else Conditions

#!/bin/bash

<<usage
- checking the positive number
- checking the negative number
- checking the zero
usage

read -p "enter a number to check:" check

if [ $check -gt 0 ]; then
	echo "enter the positive number"
elif [ $check -lt 0 ]; then
       echo "enter the negative number"
else
	echo "enter your number is zero"

fi	

![screenshot4](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-16/images/Screenshot%20From%202026-02-09%2013-52-58.png)

ullas@ullas:~/shell-practice$ cat file_check.sh 
#!/bin/bash

<<usage
- check the file exists or not
- print appropriate message
usage

read -p "enter the file to be searched:" file

if [ -f "$file" ]; then
echo "enter the file "$file" exists"
else
echo "enter the file "$file" does not exists"
fi

![screenshot5](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-16/images/Screenshot%20From%202026-02-09%2014-27-14.png)

Task 5: Combine It All

#!/bin/bash

read -p "enter a service:" service
read -p "check the status?(y/n):" check

if [ "$check" = "y" ]; then
systemctl status "$service" | head -n 10
elif [ "$check" = "n" ]; then
echo "skipped"
else
echo "please enter a correct device"
fi


![screenshot6](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-16/images/Screenshot%20From%202026-02-09%2014-44-38.png)

![screenshot6](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-16/images/Screenshot%20From%202026-02-09%2014-46-11.png)

## what i learned is

how to use the shebang in the starting of the shell script.
variable needs to be in double quotes, and in single quotes it will not work.

