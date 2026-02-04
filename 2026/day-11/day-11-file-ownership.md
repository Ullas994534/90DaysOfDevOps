# Day 11 – File Ownership & Group Management Challenge 🐧

## 🎯 Objective
Understand and practice **Linux file ownership, group management, and recursive permission handling**, which are critical for real-world DevOps and multi-user environments.

---

## 🗂️ Files & Directories Created, Ownership Changes & Commands Used

```bash
ls -l

touch devops-file.txt
sudo touch devops-file.txt
ls -l

sudo chown tokyo devops-file.txt
ls -l

sudo chown berlin devops-file.txt
ls -l

touch team-notes.txt
sudo touch team-notes.txt
ls -l

sudo groupadd team-notes
cat /etc/group

sudo chgrp team-notes team-notes.txt
ls -l

sudo groupdel team-notes
cat /etc/group

sudo groupadd heist-team
cat /etc/group | tail -n 2

sudo chgrp heist-team team-notes.txt
ls -l

sudo touch project-config.yaml
ls -l project-config.yaml

sudo chown professor project-config.yaml
sudo chgrp heist-team project-config.yaml
ls -l

mkdir -p heist-project/vault
mkdir -p heist-project/plans

sudo touch heist-project/vault/gold.txt
sudo touch heist-project/plans/strategy.conf

sudo groupadd planners
sudo chown -R professor:planners heist-project/
ls -lR heist-project/

sudo groupadd vault-team
sudo groupadd tech-team

mkdir bank-heist
sudo touch bank-heist/access-codes.txt
sudo touch bank-heist/blueprints.pdf
sudo touch bank-heist/escape-plan.txt

sudo chown tokyo:vault-team bank-heist/access-codes.txt
sudo chown berlin:tech-team bank-heist/blueprints.pdf
sudo chown nairobi:vault-team bank-heist/escape-plan.txt

ls -l bank-heist/

### commands output:

![images Link](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-11/images/Screenshot%20From%202026-02-04%2023-42-10.png)

![images Link](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-11/images/Screenshot%20From%202026-02-04%2023-55-10.png)

![images Link](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-11/images/Screenshot%20From%202026-02-04%2023-55-28.png)

![images Link](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-11/images/Screenshot%20From%202026-02-04%2023-59-28.png)

![images Link](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-11/images/Screenshot%20From%202026-02-05%2000-08-25.png)

![images Link](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-11/images/Screenshot%20From%202026-02-04%2023-42-10.png)

![images Link](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-11/images/Screenshot%20From%202026-02-05%2000-26-12.png)


📘 What I Learned
1️⃣ Owner, Group & Others
Every Linux file has:

Owner (user)

Group

Others

Permissions are controlled using:

r → read

w → write

x → execute

2️⃣ Changing Owner & Group
Using:

bash
Copy code
chown user:group filename
I can control who owns a file and which group has access, which is essential in shared environments.

3️⃣ Recursive Ownership with -R
Using:

bash
Copy code
chown -R user:group directory/
Applies ownership to all files and subdirectories, making it ideal for managing projects and application folders.

🛠️ Troubleshooting Notes
❌ Permission Denied?
➡️ Use sudo for chown / chgrp

❌ Group Doesn’t Exist?
➡️ Create it first:


sudo groupadd groupname
❌ User Doesn’t Exist?
➡️ Create it first:

sudo useradd username
🚀 Why This Matters for DevOps
Correct file ownership is critical for:

Application deployments

Shared team directories

Container file permissions


Log file management



Hashtags
#90DaysOfDevOps
#DevOpsKaJosh
#TrainWithShubham

