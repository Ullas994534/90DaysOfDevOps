# 🐧 Linux User & Group Management – Hands-On Practice (Day 09)

This repository documents my **hands-on Linux practice** focused on **User, Group, and Permission Management**.  
The task simulates a **real multi-user environment**, demonstrating how Linux controls access using users, groups, and directory permissions.

---

## 🚀 Skills Demonstrated
- Linux user management (`useradd`, `id`)
- Group creation and assignments
- Directory ownership and permissions
- Access validation using real users
- Practical Linux administration concepts



> ⚠️ **Note:** I created a group named `testers` instead of `admins`.

### 👤 Users Created
- `tokyo`
- `berlin`
- `professor`
- `nairobi`

### 👥 Groups Created
- `developers`
- `testers`
- `project-team`



## Users & Groups Created
- Users: tokyo, berlin, professor, nairobi

ullas@ullas:~$ useradd tokyo
useradd: Permission denied.
useradd: cannot lock /etc/passwd; try again later.
ullas@ullas:~$ 
ullas@ullas:~$ sudo useradd tokyo
[sudo: authenticate] Password: 
ullas@ullas:~$ sudo useradd berlin
ullas@ullas:~$ sudo useradd professor
ullas@ullas:~$ sudo useradd nairobi


- Groups: developers, admins, project-team

groupadd developers
groupadd admins
groupadd project-team

### Commands Output:

![images Link](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-09/images/useradd.png)

![images Link](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-09/images/Screenshot%20From%202026-02-03%2021-28-38.png)

![images Link](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-09/images/Screenshot%20From%202026-02-03%2021-42-14.png)

![images Link](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-09/images/Screenshot%20From%202026-02-03%2022-29-20.png)

![images Link](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-09/images/Screenshot%20From%202026-02-03%2022-34-24.png)

![images Link](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-09/images/Screenshot%20From%202026-02-03%2023-04-17.png)

![images Link](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-09/images/Screenshot%20From%202026-02-03%2023-08-24.png)


## Group Assignments
```bash
id tokyo
uid=1001(tokyo) gid=1001(tokyo) groups=1001(tokyo),1005(developers)

id berlin
uid=1002(berlin) gid=1002(berlin) groups=1002(berlin),1005(developers),1008(testers)

id professor
uid=1003(professor) gid=1003(professor) groups=1003(professor)

id nairobi
uid=1004(nairobi) gid=1004(nairobi) groups=1004(nairobi),1007(project-team)


## Directories Created:

ls -ld /opt/team-workspace
drwxrwxr-x 2 root project-team 4096 Feb 2 07:50 /opt/team-workspace

ls -ld /opt/dev-project
drwxrwxr-x 2 root developers 4096 Feb 2 07:36 /opt/dev-project


## Executed Commands:

# Create users and groups
useradd tokyo
groupadd developers

# Add user to group
gpasswd -a tokyo developers

# Create project directory
mkdir /opt/dev-project

# Assign group ownership
chgrp developers /opt/dev-project

# Set directory permissions
chmod 775 /opt/dev-project

# Validate access as a normal user
sudo -u tokyo touch /opt/dev-project/tokyo.txt


## 🎯 Key Learnings

Linux user permissions are critical for system security

Groups simplify access control in team environments

Correct directory permissions enable safe collaboration

Real-user testing validates permission configurations