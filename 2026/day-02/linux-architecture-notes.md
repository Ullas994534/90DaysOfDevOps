# Day 02 – Linux Architecture, Processes, and systemd

## Linux Architecture, Processes, and systemd

### 🎯 Today’s Goal
Understand how Linux works **under the hood**.  
This knowledge is the foundation for **troubleshooting, monitoring, and operating systems** as a DevOps engineer.

You will learn:
- Core components of Linux (Kernel, User Space, init/systemd)
- How processes are created and managed
- What systemd does and why it matters

---

## Linux Architecture Overview

Linux is built using a layered architecture.

### 1. Kernel
- Core component of the operating system
- Manages:
  - CPU scheduling
  - Memory management
  - Disk and file systems
  - Network communication
  - Hardware interaction
- Runs in **kernel space** with high privileges

### 2. User Space
- Area where user applications run
- Includes:
  - Shells (bash, zsh)
  - Linux utilities (ls, cp, mv)
  - Applications (nginx, docker, databases)
- Runs in **user space** with limited permissions

### 3. Init System (systemd)
- First process started by the kernel (**PID 1**)
- Responsible for:
  - Starting services
  - Managing system boot
  - Handling background processes
  - Logging and service dependencies

---

## Process Management in Linux

### What Is a Process?
- A **process** is a running instance of a program
- Each process has:
  - PID (Process ID)
  - Parent process
  - CPU and memory allocation

### How Processes Are Created
1. User runs a command
2. Shell sends request to the kernel
3. Kernel creates the process
4. Process is scheduled for execution

### Process States
- **Running** – actively executing
- **Sleeping** – waiting for resources
- **Stopped** – paused manually
- **Zombie** – finished execution but not cleaned up

---

## systemd Explained

### What is systemd?
- systemd is the **init system and service manager**
- Used in modern Linux distributions
- Controls system startup and services

### Why systemd Matters
- Faster boot time
- Centralized service management
- Automatic service restarts
- Better dependency handling
- Unified logging

### Common systemd Commands
```bash
systemctl status <service>
systemctl start <service>
systemctl stop <service>
systemctl restart <service>
Example:

bash
Copy code
systemctl status nginx
Basic Linux Fundamental Commands for DevOps
1. top
Displays real-time system performance

Shows:

Running, stopped, and zombie processes

CPU and memory usage

Load average

Example:

bash
Copy code
top
2. df -h
Displays disk space usage of all mounted file systems

Shows:

Total size

Used space

Available space

-h means human-readable (MB, GB)

Example:

bash
Copy code
df -h
3. touch <filename>
Creates a new empty file

Updates timestamp if file already exists

Example:

bash
Copy code
touch test.txt
4. mkdir <dirname>
Creates a new directory

Can create multiple directories at once

Example:

bash
Copy code
mkdir logs
5. vim <filename>
Opens a file in the Vim editor

Used to create, view, or edit files

Common Vim commands:

i → insert mode

Esc → command mode

:wq → save and exit

:q! → exit without saving

Example:

bash
Copy code
vim app.conf
6. cat <filename>
Displays file content in the terminal

Useful for small files

Example:

bash
Copy code
cat test.txt
7. ps
Shows running processes

Helps monitor system activity

Common options:

bash
Copy code
ps -ef
ps aux
Example:

bash
Copy code
ps -ef
8. systemctl
Manages services using systemd

Used to start, stop, restart, and check service status

Example:

bash
Copy code
systemctl status nginx
Why Linux Is Important for DevOps
Linux is the backbone of:

Servers

Cloud platforms

Containers (Docker, Kubernetes)

Understanding Linux helps DevOps engineers to:

Quickly identify and fix service failures

Monitor and manage running processes

Troubleshoot CPU, memory, and disk issues

Handle system services and logs confidently

Reduce downtime during production incidents

✅ Key Takeaway
Strong Linux knowledge enables faster troubleshooting, stable systems, and reliable DevOps operations.

yaml
Copy code

---

### Next step (optional)
If you want, I can:
- Add **interview questions** below each section  
- Convert this into **90 Days of DevOps format**
- Add **real production troubleshooting examples**
- Help you write the **git commit message**

Just tell me 👍





