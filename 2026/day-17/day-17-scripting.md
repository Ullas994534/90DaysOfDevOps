### Day 17 – Shell Scripting: Loops, Arguments & Error Handling

## Task

Level up your scripting — use loops, handle arguments, and deal with errors.

You will:

Write for and while loops
Use command-line arguments ($1, $2, $#, $@)
Install packages via script
Add basic error handling

## Challenge Tasks

### Task 1: For Loop

1) Create for_loop.sh that:
 Loops through a list of 5 fruits and prints each one

![screenshot1](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-17/images/Screenshot%20from%202026-02-11%2017-35-18.png)

2) Create count.sh that:
   Prints numbers 1 to 10 using a for loop

![screenshot2](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-17/images/Screenshot%20from%202026-02-11%2017-38-28.png)

![screenshot3](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-17/images/Screenshot%20from%202026-02-11%2017-40-42.png)


2) Task 2: While Loop

#!/bin/bash

read -p "enter the number:" num

while [ $num -ge 0 ]

do
		
	echo $num
	num=$((num - 1))
done


echo "done!"


![screenshot4](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-17/images/Screenshot%20from%202026-02-11%2018-06-06.png)

### Task 3: Command-Line Arguments.

1) Create greet.sh that:

#!/bin/bash

if  [ $Hello "$#" ]
then	

	echo "0th Hello $0"
	echo "1st Hello $1"
	echo "2nd Hello $2"
	echo "3rd Hello $3"
fi

output
![screenshot5](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-17/images/Screenshot%20from%202026-02-11%2018-32-55.png)

2) Create args_demo.sh that

Prints total number of arguments ($#)
Prints all arguments ($@)
Prints the script name ($0)

ullas@ullas-Lenovo-G580:~/day17$ cat args_demo.sh 
#!/bin/bash


	echo "0th argument $0"
	echo "1st Hello $1"
	echo "2nd location $2"
	echo "3rd course $3"

	echo "script name $0"
	echo "total number of arguments $#"
	echo "all arguments $@"

	echo "done!"

![screenshot6](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-17/images/Screenshot%20from%202026-02-11%2019-04-52.png)

### Task 4: Install Packages via Script

Create install_packages.sh that:

llas@ullas-Lenovo-G580:~/day17$ cat install_packages.sh 
#!/bin/bash

# Task 4: Install Packages via Script

packages=("nginx" "curl" "wget")

for package in "${packages[@]}"
do
    echo "Checking package: $package..."
    sleep 2

    dpkg -s "$package" &> /dev/null

    if [[ $? -eq 0 ]]
    then
        echo "Package $package is already installed. Skipping..."
    else
        echo "Installing $package..."
        sudo apt-get install -y "$package"

        if [[ $? -eq 0 ]]
        then
            echo "$package installed successfully."
            sudo systemctl status "$package" --no-pager
        else
            echo "Failed to install $package."
        fi
    fi

    echo "--------installed successfully------------"
done

### output

![screenshot7](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-17/images/Screenshot%20from%202026-02-11%2020-11-08.png)

![screenshot8](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-17/images/Screenshot%20from%202026-02-11%2020-11-17.png)


###  Task 5: Error Handling

ullas@ullas-Lenovo-G580:~/day17$ cat safe_script.sh 
#!/bin/bash

set -e

<< folder

Task 5: Error Handling

folder

mkdir /tmp/devops-test || mkdir -p /tmp/devops-test $>/dev/null

echo "do the production work"

![screenshot9](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-17/images/Screenshot%20from%202026-02-11%2020-38-12.png)

![screenshot10](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-17/images/Screenshot%20from%202026-02-11%2020-42-10.png)

![screenshoy11](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-17/images/Screenshot%20from%202026-02-11%2020-43-01.png)

## Hints


For loop: for item in list; do ... done
While loop: while [ condition ]; do ... done
Arguments: $1 first arg, $# count, $@ all args
Check root: if [ "$EUID" -ne 0 ]; then echo "Run as root"; exit 1; fi
Check package: dpkg -s <pkg> &> /dev/null && echo "installed"









