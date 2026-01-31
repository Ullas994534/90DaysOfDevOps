# Linux Troubleshooting Runbook (Hands-on)

> This document is written from **my own hands-on practice**. All commands were executed by me on my Ubuntu system, and the outputs shown below are captured directly from my machine. This runbook follows a simple, repeatable approach used during real Linux troubleshooting.

---

## 1) Environment Basics

These commands are used to check the **OS version, kernel, and overall system details**. This is the first step in any troubleshooting activity.

### Kernel & System Information

```bash
uname -a
```

Output (from my system):

```
Linux ullas 6.17.0-8-generic #8-Ubuntu SMP PREEMPT_DYNAMIC Fri Nov 14 21:44:46 UTC 2025 x86_64 GNU/Linux
```

### Distribution Details

```bash
lsb_release -a
```

Output:

```
Distributor ID: Ubuntu
Description:    Ubuntu 25.10
Release:        25.10
Codename:       questing
```

### OS Release File

```bash
cat /etc/os-release
```

Purpose: Confirms OS name, version, codename, and support URLs.

---

## 2) Filesystem Sanity Checks

Used to verify directory creation, file operations, and permissions.

### Create and Verify Directory

```bash
mkdir /tmp/runbook-demo
cd /tmp/runbook-demo
ls
```

Purpose: Ensures directory creation and navigation work as expected.

### Copy File and Check Permissions

```bash
cp /etc/hosts /tmp/runbook-demo/hosts-copy && ls -l /tmp/runbook-demo
```

Output:

```
-rw-r--r-- 1 ullas ullas 220 Jan 31 23:03 hosts-copy
```

Purpose: Confirms file copy, ownership, permissions, timestamp, and filename.

---

## 3) CPU & Memory Analysis

These commands show **process status, load average, CPU usage, and memory consumption**.

### Real-Time Process View

```bash
top
```

Purpose:

* Shows system uptime and load average
* Displays CPU usage breakdown
* Displays memory and swap usage
* Lists top resource-consuming processes

### Interactive Monitor

```bash
htop
```

Purpose: Interactive, real-time process monitoring and management.

### Process-Level CPU & Memory

```bash
ps -o pid,pcpu,pmem
```

Purpose: Displays process ID with CPU and memory usage.

```bash
ps -o pid,pcpu,pmem,comm -p <PID>
```

Purpose: Shows CPU, memory, and command name for a specific process.

### Memory Summary

```bash
free -h
```

Purpose: Displays total, used, free, and available memory along with swap usage.

### Virtual Memory Statistics

```bash
vmstat
```

Purpose: Shows process, memory, swap, I/O, and CPU activity.

---

## 4) Disk & I/O Analysis

Used to identify disk usage, log growth, and I/O performance.

### Filesystem Usage

```bash
df -h
```

Purpose: Shows filesystem size, used space, available space, usage percentage, and mount points.

### Log Directory Size

```bash
sudo du -sh /var/log
```

Purpose: Identifies total log size to detect abnormal growth.

### Disk I/O Statistics

```bash
iostat
```

Purpose:

* Shows CPU I/O wait
* Displays per-device read/write statistics

### Combined Resource Monitoring

```bash
dstat
```

Purpose: Provides real-time CPU, disk, network, and memory statistics in one view.

---

## 5) Network Diagnostics

Used to identify listening ports, services, and connectivity issues.

### Listening Ports and Services

```bash
ss -tulpn
```

Purpose: Displays active TCP/UDP ports, listening services, and associated processes.

### Legacy Network Tool

```bash
netstat -tulpn
```

Purpose: Shows open ports and network connections (still useful for troubleshooting).

### HTTP / API Connectivity Test

```bash
curl -I <URL>
```

Purpose: Tests HTTP headers and API reachability.

### Network Reachability

```bash
ping <host>
```

Purpose: Checks connectivity, latency, and packet loss.

---

## 6) Log Analysis

Logs are always checked **before restarting any service**.

### System Logs

```bash
journalctl
```

### Service-Specific Logs

```bash
journalctl -u <service> -n 50
```

Purpose: Shows the latest 50 log entries for a specific service.

### Traditional Log Files

```bash
tail -n 50 /var/log/<file>.log
```

Purpose: Displays the last 50 lines of a log file.

---

## 7) Target Service Investigation: Docker (Hands-on)

In this example, I installed Docker, verified its status, checked logs, and stopped the service.

### Install Docker

```bash
sudo apt install docker.io
```

### Check Service Status

```bash
systemctl status docker.service
```

Purpose: Confirms whether Docker is running and checks resource usage.

### Review Docker Logs

```bash
journalctl -u docker.service -n 50
```

Purpose: Verifies startup, shutdown, and runtime events.

### Stop Docker Service

```bash
systemctl stop docker.service
```

Note: `docker.socket` may remain active due to socket activation.

### Verify Service State

```bash
systemctl status docker.service
```

---

## Troubleshooting Runbook Template

```
Target service / process
Snapshot: CPU & Memory
Snapshot: Disk & IO
Snapshot: Network
Logs reviewed
Quick findings
If this worsens (next steps)
Resources
```

---

## Why This Matters for DevOps

Incidents rarely come with perfect clues. A fast, repeatable checklist:

* Builds the habit of capturing evidence before acting
* Improves confidence in reading CPU, memory, disk, and network signals
* Encourages a log-first mindset before restarts or escalations

These habits reduce downtime and prevent guesswork in production systems.

---

## References

* Notes from Day 02–04
* Linux man pages: `top`, `ps`, `df`, `journalctl`, `ss`, `netstat`
* My personal lab outputs (Ubuntu 25.10)

## 7. Target Service Investigation: Docker (Hands-on on my system)

### Objective

Install Docker, verify the service status, review logs, and safely stop the service while observing systemd behavior.

---

### Step 1: Install Docker

```bash
sudo apt install docker.io
```

Docker was installed using the Ubuntu package manager on my system.

---

### Step 2: Verify Docker Service Status

```bash
systemctl status docker.service
```

**Observation (from my system):**

* Service state: **active (running)**
* Main process: `dockerd`
* Triggered by: `docker.socket`
* Low memory and CPU usage, indicating a healthy idle state

---

### Step 3: Review Docker Logs

```bash
journalctl -u docker.service -n 50
```

**Log findings:**

* Docker daemon started successfully
* Docker API listening on `/run/docker.sock`
* Service was previously stopped and restarted cleanly
* No error or warning messages observed

---

### Step 4: Stop Docker Service

```bash
systemctl stop docker.service
```

**Note:**
Systemd reported that `docker.socket` was still active. This is expected behavior because Docker uses socket activation.

---

### Step 5: Confirm Docker Is Stopped

```bash
systemctl status docker.service
```

**Observation:**

* Service state: **inactive (dead)**
* Docker daemon stopped successfully
* `docker.socket` remains listed as a triggering unit

---

### Step 6: Verify Logs After Stop

```bash
journalctl -u docker.service -n 50
```

**Result:**

* Service shutdown recorded cleanly
* No crash or forced termination messages

---

### Summary (Docker Investigation)

* Docker installed and verified successfully
* Logs reviewed before taking action
* Service stopped gracefully using systemd
* Socket-based activation behavior understood

This demonstrates a **real-world, log-first troubleshooting workflow** executed on my system.

---

## 8. Docker Impact on System Performance (Before & After)

This section captures **system performance snapshots from my own machine** before stopping Docker and after stopping Docker, to understand its impact on CPU, memory, and overall system load.

---

### Scenario

* Docker (`docker.io`) installed and running
* System performance observed
* Docker service stopped
* System performance checked again for comparison

---

### Performance Snapshot: Docker Running

Commands used:

```bash
top
free -h
ps -o pid,pcpu,pmem,comm | head
```

**Observation:**

* `dockerd` process visible in process list
* Docker consuming small but noticeable memory
* CPU usage remained low (idle system)
* No abnormal load or resource pressure observed

This indicates Docker daemon was running in a healthy idle state.

---

### Action Taken: Stop Docker Service

```bash
systemctl stop docker.service
```

Systemd reported `docker.socket` as active, which is expected behavior due to socket-based activation.

---

### Performance Snapshot: Docker Stopped

Commands used:

```bash
top
free -h
ps -o pid,pcpu,pmem,comm | grep dockerd
```

**Observation:**

* `dockerd` process no longer running
* Slight memory reclaimed by the system
* CPU idle percentage marginally increased
* Overall system performance remained stable

---

### Key Findings

* Docker daemon consumes minimal resources when idle
* Stopping Docker frees memory but does not significantly change CPU load
* System remained stable before and after stopping the service

---

### Why This Matters

This comparison demonstrates:

* Evidence-based troubleshooting (measure before and after)
* Understanding of background service resource impact
* Safe service management without affecting system stability

This mirrors **real production troubleshooting behavior** expected from Linux L2 / DevOps engineers.
