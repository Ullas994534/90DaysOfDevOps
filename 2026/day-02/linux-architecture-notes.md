Day 02 – Linux Architecture, Processes, and systemd

Linux Architecture, Processes, and systemd

Today’s goal is to understand how Linux works under the hood.

You will create a short note that explains:

The core components of Linux (kernel, user space, init/systemd)
How processes are created and managed
What systemd does and why it matters
This is the foundation for all troubleshooting you will do as a DevOps engineer.


Basic linux fundamentals commands for devops.

1)top -> It used to check the system process and load average, Running process, stopped process,
	       cpu and memory usage and zombie process etc.
	       
most 5 comman commands day to day we are using they are.

1) df -h

Displays disk space usage of all mounted file systems

Shows total size, used space, available space

-h means human-readable (MB, GB)

Example:

df -h

2) touch <filename.extension>

Creates a new empty file

If the file already exists, it updates the timestamp

Commonly used to quickly create files

Example:

touch test.txt

3) mkdir <dirname>

Creates a new directory (folder)

Used to organize files and folders

Can create multiple directories at once

Example:

mkdir logs

4) vim <filename>

Opens a file in the Vim text editor

Used to create, view, or edit files

Common commands:

i → insert mode

Esc → command mode

:wq → save and exit

:q! → exit without saving

Example:

vim app.conf

5) cat <filename>

Displays file content in the terminal

Used to view small files

Can also combine multiple files

Example:

cat test.txt

6) ps

Shows currently running processes

Helps monitor system activity

Common options:

ps -ef → all running processes

ps aux → detailed process list

Example:

ps -ef

7) systemctl

Used to manage system services (systemd)

Start, stop, restart, and check service status

Common commands:

systemctl status <service>

systemctl start <service>

systemctl stop <service>

systemctl restart <service>

Example:

systemctl status nginx

Why Linux Is Important for DevOps

Linux is the core operating system for most servers, cloud platforms, and containers.

Understanding Linux basics helps DevOps engineers to:

Quickly identify and fix service failures

Monitor and manage running processes

Troubleshoot CPU, memory, and disk issues

Handle system services and logs with confidence

Reduce downtime during production incidents

Strong Linux knowledge helps DevOps teams resolve issues faster and keep systems stable.





