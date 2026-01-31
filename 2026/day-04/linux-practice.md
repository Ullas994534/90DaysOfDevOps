# Day 04 – Linux Practice: Processes and Services

## 🎯 Task

Today’s goal is to practice Linux fundamentals using real commands.

You will create a short practice note by actually running basic commands and observing their output.

### You will practice:
- Checking running processes
- Inspecting one systemd service
- Capturing a simple troubleshooting flow

This is **hands-on**. Keep it simple and focused on fundamentals.

---

## 📌 Guidelines

Follow these rules while creating your practice note.

---

## 1️⃣ Process Commands

### `ps`
`ps` is used to check **process status**.

It shows:
- PID (Process ID)
- User
- CPU usage
- Memory usage
- Command that started the process

**PID** → A unique ID assigned to each process.
![Image Link]https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-04/images/Screenshot%20From%202026-01-31%2020-48-07.png

![Image Link]https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-04/images/Screenshot%20From%202026-01-31%2020-54-17.png

Example:
```bash
ps -ef
top
top is a real-time system monitoring tool.

It:

Displays a live list of running processes

Shows CPU usage, memory usage, and load averages

Allows interactive process management

![Image Link]https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-04/images/Screenshot%20From%202026-01-31%2021-00-38.png

Example:

bash
Copy code
top
2️) Service Commands (systemd)
systemctl
Used to manage system services.

You can:

Start or stop services

Check service status

Enable or disable services at boot

List running services
bash
Copy code
![Image Link]https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-04/images/Screenshot%20From%202026-01-31%2021-09-20.png

systemctl list-units --type=service --state=running
Breakdown:

systemctl → Service manager

list-units → Lists active units

--type=service → Only services

--state=running → Only running services
![Image Link]https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-04/images/Screenshot%20From%202026-01-31%2021-13-23.png

3️) 2 Log Commands
journalctl
Used to view system logs.

It collects logs from:

Kernel

systemd services

Applications

Boot events

Examples:
![Image Link]https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-04/images/6.png

bash
Copy code
journalctl
journalctl -f        # Follow logs live
journalctl -k        # Kernel logs
dmesg
Used to view kernel messages related to:

Boot process

Hardware

Disk

Memory

Devices

Examples:
![Image Link]https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-04/images/7.png

bash
Copy code
dmesg | tail
dmesg | grep -i error
4️⃣ Service Inspection: cron
I picked cron for service inspection.

Cron is used for scheduling jobs.

Service name by distro:
Ubuntu/Debian → cron
RHEL/CentOS → crond
![Image link]https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-04/images/7.png

Check if cron service exists
bash
![Image Link]https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-04/images/8.png

systemctl list-unit-files | grep cron
Check cron service status

systemctl status cron
![Image Link]https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-04/images/9.png

Check if cron starts at boot
bash
Copy code
systemctl is-enabled cron
Inspect running cron process
![Image Link]https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-04/images/10.png

ps -ef | grep cron
![Image Link]https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-04/images/11.png
Check system-wide cron jobs

cat /etc/crontab
![Image Link]https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-04/images/12.png

ls -l /etc/cron.*
![Image Link]https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-04/images/13.png

Inspect user cron jobs
Current user:

bash
Copy code
crontab -l
![Image Link]https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-04/images/14.png

Root user:

sudo crontab -u root -l
![Image Link]https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-04/images/15.png
If no jobs exist, you’ll see:

pgsql
Copy code
no crontab for user
Check cron permissions (important!)
bash
Copy code
ls -l /etc/cron.allow /etc/cron.deny
![Image Link]https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-04/images/16.png
Rules:

If cron.allow exists → only listed users can use cron

If only cron.deny exists → listed users are blocked

Inspect cron logs (VERY important)
Ubuntu:

bash
Copy code
grep CRON /var/log/syslog
![Image Link]https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-04/images/17.png

journalctl -u cron
![Image Link]https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-04/images/18.png

Look for:

Job execution time

Command errors

Permission issues

Test cron is working: Quick test job (runs every minute)
![Image Link]https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-04/images/19.png

Example: run a job every minute to confirm cron is working.

Why Cron Inspection Matters (DevOps Angle)
Cron is widely used for:

Backups

Log rotation

Monitoring scripts

Cleanup jobs

Automation tasks

If cron fails, automation fails.

🚀 Why This Matters for DevOps
Hands-on practice builds speed and confidence.

In production:

You won’t have time to search for basic commands

You must diagnose issues quickly

This practice helps build muscle memory with Linux fundamentals.