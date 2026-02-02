# Day 07 – Linux File System Hierarchy & Scenario-Based Practice

## Objective
Understand where things live in Linux and practice troubleshooting like a DevOps / SRE engineer using real-world scenarios.

---

## Part 1: Linux File System Hierarchy

### Core Directories (Must Know)

### `/` (Root)
- The top-level directory; all files and directories start from here.
- Contains all essential system directories.

**Command run:**
```bash
ls -l /
Observed: bin, etc, home, var, usr

I would use this when:
I need to understand the overall system structure or troubleshoot boot/system-level issues.

/home
Stores home directories for all normal users.

Each user has personal files, configs, and data here.

Command run:

bash
Copy code
ls -l /home
Observed: ullas

I would use this when:
Checking user files, scripts, SSH keys, or disk usage issues.

/root
Home directory of the root (admin) user.

Accessible only by root.

Command run:

bash
Copy code
ls -l /root
Observed: .bashrc, .ssh

I would use this when:
Working as root for recovery, admin scripts, or emergency fixes.

/etc
Stores system-wide configuration files.

No binaries here, only configs.

Command run:

bash
Copy code
ls -l /etc
Observed: hostname, passwd, ssh/

I would use this when:
Troubleshooting service configuration or system settings.

/var/log
Contains system and application logs.

Extremely important for DevOps troubleshooting.

Command run:

bash
Copy code
ls -l /var/log
Observed: syslog, auth.log, journal/

I would use this when:
Investigating service failures, security issues, or crashes.

/tmp
Stores temporary files.

Files may be deleted on reboot.

Command run:

bash
Copy code
ls -l /tmp
Observed: temporary application files

I would use this when:
Testing scripts or storing short-lived files.

Additional Directories (Good to Know)
/bin
Essential command binaries required for system boot.

Examples: ls, cp, mv.

Command run:

bash
Copy code
ls -l /bin
I would use this when:
System is in recovery mode or minimal environment.

/usr/bin
User-level binaries and applications.

Most commands live here.

Command run:

bash
Copy code
ls -l /usr/bin | head
I would use this when:
Checking installed tools or application binaries.

/opt
Optional or third-party applications.

Common for custom installs.

Command run:

bash
Copy code
ls -l /opt
I would use this when:
Managing vendor or custom software installations.

Hands-on Observation
Disk usage of logs:
bash
Copy code
du -sh /var/log/* 2>/dev/null | sort -h | tail -5
Insight:
Large logs like journal and syslog can consume disk space and cause outages.

Hostname:
bash
Copy code
cat /etc/hostname
Insight:
Useful for identifying servers in multi-node environments.

Home directory analysis:
bash
Copy code
ls -la ~
Insight:
Hidden files store shell history, SSH keys, Git configs, and editor settings.

Part 2: Scenario-Based Practice
Scenario 1: Service Not Starting After Reboot
Problem:
A web application service myapp failed to start after server reboot.

Step-by-step Troubleshooting
Step 1: Check service status

bash
Copy code
systemctl status myapp
Step 2: Check service logs

bash
Copy code
journalctl -u myapp -n 50
Step 3: Validate service file

bash
Copy code
systemctl cat myapp
Step 4: Check dependencies and failed services

bash
Copy code
systemctl --failed
Why this flow matters:
It helps isolate whether the issue is configuration, dependency, or runtime-related.

Scenario 2: File Permissions Issue
Problem:
Script /home/user/backup.sh fails with Permission denied.

Step-by-step Solution
Step 1: Check current permissions

bash
Copy code
ls -l /home/user/backup.sh
Expected output:

text
Copy code
-rw-r--r-- backup.sh   # No execute permission
Step 2: Add execute permission

bash
Copy code
chmod +x /home/user/backup.sh
Step 3: Verify permission

bash
Copy code
ls -l /home/user/backup.sh
Expected output:

text
Copy code
-rwxr-xr-x backup.sh
Step 4: Execute script

bash
Copy code
./backup.sh
Why this matters:
Incorrect permissions are one of the most common production issues.

Why This Matters for DevOps
Understanding Linux file system helps with:

Finding logs and configs quickly

Debugging failed deployments

Writing reliable automation scripts

Scenario-based practice prepares you for:

Production incidents

On-call troubleshooting

DevOps & SRE interviews

Learning Summary
Learned Linux file system structure and purpose

Analyzed real system logs and directories

Practiced structured troubleshooting like a DevOps engineer

#90DaysOfDevOps
#DevOpsKaJosh
#TrainWithShubham

