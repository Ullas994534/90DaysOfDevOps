# Linux Troubleshooting Runbook

This runbook documents a **systematic approach to Linux troubleshooting** using real command outputs from my Ubuntu system.  
The goal is to capture evidence **before taking action**, a critical habit for DevOps and SRE roles.

---

## 1. Environment Basics

These commands help identify the OS, kernel, and system details.

### OS & Kernel Information

```bash
uname -a
Output:

nginx
Copy code
Linux ullas 6.17.0-8-generic #8-Ubuntu SMP PREEMPT_DYNAMIC Fri Nov 14 21:44:46 UTC 2025 x86_64 GNU/Linux
bash
Copy code
lsb_release -a
Output:

yaml
Copy code
Distributor ID: Ubuntu
Description:    Ubuntu 25.10
Release:        25.10
Codename:       questing
bash
Copy code
cat /etc/os-release
Purpose:

Confirms OS version

Useful for compatibility, package issues, and support cases

2. Filesystem Sanity Checks
Create and Verify Directories
bash
Copy code
mkdir /tmp/runbook-demo
cd /tmp/runbook-demo
ls
Purpose:

Confirms write permissions

Verifies filesystem health

Copy Files and Verify Metadata
bash
Copy code
cp /etc/hosts /tmp/runbook-demo/hosts-copy
ls -l /tmp/runbook-demo
Output:

css
Copy code
-rw-r--r-- 1 ullas ullas 220 Jan 31 23:03 hosts-copy
Purpose:

Validates file permissions, ownership, and timestamps

3. CPU & Memory Snapshot
Real-Time System View
bash
Copy code
top
What it shows:

Load average

CPU usage (user, system, idle, iowait)

Memory and swap usage

Top resource-consuming processes

Example findings:

Chrome and GNOME processes consuming highest CPU and memory

System mostly idle (~80% idle CPU)

Enhanced View (Optional)
bash
Copy code
htop
Purpose:

Interactive and more readable process management

Process-Level Inspection
bash
Copy code
ps -o pid,pcpu,pmem
bash
Copy code
ps -o pid,pcpu,pmem,comm -p <PID>
Purpose:

Inspect specific processes by PID

Useful when tracking high CPU or memory consumers

Memory Summary
bash
Copy code
free -h
Output:

powershell
Copy code
Mem: 5.1Gi total, 4.1Gi used, 143Mi free
Swap: 11Gi total, 2.3Gi used
Purpose:

Quick view of memory pressure and swap usage

4. Disk & I/O Analysis
Disk Usage by Filesystem
bash
Copy code
df -h
Purpose:

Detect full disks

Identify mount points and capacity issues

Directory Size Check
bash
Copy code
sudo du -sh /var/log
Output:

bash
Copy code
506M /var/log
Purpose:

Identify log growth issues

I/O Performance
bash
Copy code
iostat
Purpose:

Detect disk bottlenecks

Check CPU iowait and disk throughput

bash
Copy code
vmstat
Purpose:

Memory pressure

Swap activity

CPU and I/O balance

bash
Copy code
dstat
Purpose:

Combined real-time view of CPU, disk, memory, and network

5. Network Inspection
Open Ports & Listening Services
bash
Copy code
ss -tulpn
Purpose:

Identify which services are listening

Replace netstat on modern systems

bash
Copy code
netstat -tulpn
Purpose:

Legacy but still useful on older systems

Connectivity & API Testing
bash
Copy code
ping <host>
bash
Copy code
curl -I <url>
Purpose:

Test network reachability

Validate HTTP endpoints

6. Log Analysis
System Logs
bash
Copy code
journalctl
Purpose:

View complete system logs

Service-Specific Logs
bash
Copy code
journalctl -u <service> -n 50
Purpose:

View recent logs for a specific service

File-Based Logs
bash
Copy code
tail -n 50 /var/log/<file>.log
Purpose:

Inspect application-specific logs

7. Target Service Case Study: Docker
Install Docker
bash
Copy code
sudo apt install docker.io
Verify Service Status
bash
Copy code
systemctl status docker.service
Findings:

Docker service is active and running

Triggered by docker.socket

Review Docker Logs
bash
Copy code
journalctl -u docker.service -n 50
Observations:

Clean startup

Graceful shutdown

No critical errors

Stop Docker Service
bash
Copy code
systemctl stop docker.service
Note:

docker.socket remains active, which can auto-start Docker again

bash
Copy code
systemctl status docker.service
Result:

Service stopped successfully

Suggested Troubleshooting Structure
Use this checklist during incidents:

text
Copy code
Target service / process
Snapshot: CPU & Memory
Snapshot: Disk & IO
Snapshot: Network
Logs reviewed
Quick findings
If this worsens (next steps)
Resources
Why This Matters for DevOps
Production incidents rarely come with clear symptoms.
A repeatable troubleshooting checklist helps you:

Capture evidence before restarting services

Read CPU, memory, disk, and network signals confidently

Follow a log-first mindset

Reduce downtime and avoid guesswork

These habits are essential for DevOps, SRE, and Linux L2/L3 roles.

References
man top, man ps, man df

man journalctl, man ss

Linux systemd documentation
# Linux Troubleshooting Runbook

This runbook documents a **systematic approach to Linux troubleshooting** using real command outputs from my Ubuntu system.  
The goal is to capture evidence **before taking action**, a critical habit for DevOps and SRE roles.

---

## 1. Environment Basics

These commands help identify the OS, kernel, and system details.

### OS & Kernel Information

```bash
uname -a
Output:

nginx
Copy code
Linux ullas 6.17.0-8-generic #8-Ubuntu SMP PREEMPT_DYNAMIC Fri Nov 14 21:44:46 UTC 2025 x86_64 GNU/Linux
bash
Copy code
lsb_release -a
Output:

yaml
Copy code
Distributor ID: Ubuntu
Description:    Ubuntu 25.10
Release:        25.10
Codename:       questing
bash
Copy code
cat /etc/os-release
Purpose:

Confirms OS version

Useful for compatibility, package issues, and support cases

2. Filesystem Sanity Checks
Create and Verify Directories
bash
Copy code
mkdir /tmp/runbook-demo
cd /tmp/runbook-demo
ls
Purpose:

Confirms write permissions

Verifies filesystem health

Copy Files and Verify Metadata
bash
Copy code
cp /etc/hosts /tmp/runbook-demo/hosts-copy
ls -l /tmp/runbook-demo
Output:

css
Copy code
-rw-r--r-- 1 ullas ullas 220 Jan 31 23:03 hosts-copy
Purpose:

Validates file permissions, ownership, and timestamps

3. CPU & Memory Snapshot
Real-Time System View
bash
Copy code
top
What it shows:

Load average

CPU usage (user, system, idle, iowait)

Memory and swap usage

Top resource-consuming processes

Example findings:

Chrome and GNOME processes consuming highest CPU and memory

System mostly idle (~80% idle CPU)

Enhanced View (Optional)
bash
Copy code
htop
Purpose:

Interactive and more readable process management

Process-Level Inspection
bash
Copy code
ps -o pid,pcpu,pmem
bash
Copy code
ps -o pid,pcpu,pmem,comm -p <PID>
Purpose:

Inspect specific processes by PID

Useful when tracking high CPU or memory consumers

Memory Summary
bash
Copy code
free -h
Output:

powershell
Copy code
Mem: 5.1Gi total, 4.1Gi used, 143Mi free
Swap: 11Gi total, 2.3Gi used
Purpose:

Quick view of memory pressure and swap usage

4. Disk & I/O Analysis
Disk Usage by Filesystem
bash
Copy code
df -h
Purpose:

Detect full disks

Identify mount points and capacity issues

Directory Size Check
bash
Copy code
sudo du -sh /var/log
Output:

bash
Copy code
506M /var/log
Purpose:

Identify log growth issues

I/O Performance
bash
Copy code
iostat
Purpose:

Detect disk bottlenecks

Check CPU iowait and disk throughput

bash
Copy code
vmstat
Purpose:

Memory pressure

Swap activity

CPU and I/O balance

bash
Copy code
dstat
Purpose:

Combined real-time view of CPU, disk, memory, and network

5. Network Inspection
Open Ports & Listening Services
bash
Copy code
ss -tulpn
Purpose:

Identify which services are listening

Replace netstat on modern systems

bash
Copy code
netstat -tulpn
Purpose:

Legacy but still useful on older systems

Connectivity & API Testing
bash
Copy code
ping <host>
bash
Copy code
curl -I <url>
Purpose:

Test network reachability

Validate HTTP endpoints

6. Log Analysis
System Logs
bash
Copy code
journalctl
Purpose:

View complete system logs

Service-Specific Logs
bash
Copy code
journalctl -u <service> -n 50
Purpose:

View recent logs for a specific service

File-Based Logs
bash
Copy code
tail -n 50 /var/log/<file>.log
Purpose:

Inspect application-specific logs

7. Target Service Case Study: Docker
Install Docker
bash
Copy code
sudo apt install docker.io
Verify Service Status
bash
Copy code
systemctl status docker.service
Findings:

Docker service is active and running

Triggered by docker.socket

Review Docker Logs
bash
Copy code
journalctl -u docker.service -n 50
Observations:

Clean startup

Graceful shutdown

No critical errors

Stop Docker Service
bash
Copy code
systemctl stop docker.service
Note:

docker.socket remains active, which can auto-start Docker again

bash
Copy code
systemctl status docker.service
Result:

Service stopped successfully

Suggested Troubleshooting Structure
Use this checklist during incidents:

text
Copy code
Target service / process
Snapshot: CPU & Memory
Snapshot: Disk & IO
Snapshot: Network
Logs reviewed
Quick findings
If this worsens (next steps)
Resources
Why This Matters for DevOps
Production incidents rarely come with clear symptoms.
A repeatable troubleshooting checklist helps you:

Capture evidence before restarting services

Read CPU, memory, disk, and network signals confidently

Follow a log-first mindset

Reduce downtime and avoid guesswork

These habits are essential for DevOps, SRE, and Linux L2/L3 roles.

References
man top, man ps, man df

man journalctl, man ss

Linux systemd documentation
Personal notes from Day 02–Day 04