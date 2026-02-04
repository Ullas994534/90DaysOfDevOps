Day 11 Challenge

## Files & Directories Created, Ownership Changes and Commands Used

ls -l
touch devops-file.txt
sudo touch devops-file.txt
ls -l
sudo chown tokyo devops-file.txt
ls -l
sudo chown berlin devops-file.txt
ls -l
chgrp team-notes.txt
 sudo chgrp team-notes.txt
 ls -l
sudo groupadd team-notes.txt
 ls -l
 cat /etc/group
sudo groupdell team-notes.txt
sudo groupdel team-notes.txt
cat /etc/group
touch team-notes.txt
sudo touch team-notes.txt
 ls -l
sudo groupadd heist-team
 ls -l heist-team
cat /etc/group | tail -n 2
ls -l
 sudo chgrp heist-team team-notes.txt
ls -l
 sudo touch projest-config.yaml
  ls -l projest-config.yaml 
  sudo chown professor projest-config.yaml
sudo chgrp heist-team projest-config.yaml
  ls -l
 mkdir -p heist-project/vault
 sudo mkdir -p heist-project/vault
  sudo mkdir -p heist-project/plans
touch heist-project/vault/gold.txt
sudo touch heist-project/vault/gold.txt
  sudo touch heist-project/plans/strategy.conf
 sudo groupadd planners
sudo chown -R professor:planners heist-project/
ls -l
 ls -l heist-project/
ls -lR heist-project/
 sudo groupadd vault-team
 sudo groupadd teach-team
 cat /etc/passwd | tail -n 2
cat /etc/grou[ | tail -n 2
 cat /etc/group | tail -n 2
mkdir bank-heist
 sudo mkdir bank-heist
sudo touch bank-heist/access-codes.txt
 sudo touch bank-heist/blueprints.pdf
sudo touch bank-heist/escape-plan.txt
sudo chown -R tokyo:vault-team access.code.txt
 sudo chown -R tokyo:vault-team bank-heist/access-codes.txt
 sudo chown -R berlin:tech-team bank-heist/blueprints.pdf
 sudo chown -R berlin:teach-team bank-heist/blueprints.pdf
sudo chown -R nairobi:vault-team bank-heist/escape-plan.txt
 ls -l bank-heist/
 
 ### output screenshot:
 
![Command Output 1](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-11/images/Screenshot%20From%202026-02-04%2023-42-10.png)

![Command Output 2](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-11/images/Screenshot%20From%202026-02-04%2023-55-10.png)

![Command Output 3](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-11/images/Screenshot%20From%202026-02-04%2023-55-28.png)

![Command Output 4](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-11/images/Screenshot%20From%202026-02-04%2023-59-28.png)

![Command Output 5](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-11/images/Screenshot%20From%202026-02-05%2000-08-25.png)

![Command Output 6](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-11/images/Screenshot%20From%202026-02-05%2000-26-12.png)



## What I Learned

1) Owner, Group, Other understanding
Every file in Linux has an owner (user), a group, and others. Permissions are controlled separately for each using r (read), w (write), x (execute).

2) Changing owner & group
Using chown user:group filename lets me change who owns a file and which group controls it. This is important for access control in multi-user systems.

3) Recursive ownership with -R
Using chown -R user:group directory/ applies ownership changes to the directory and all files/subdirectories inside it, which is essential for managing projects and folders efficiently.

Troubleshooting
Permission denied?

Use sudo for chown/chgrp operations
Group doesn't exist?

Create it first: sudo groupadd groupname
User doesn't exist?

Create it first: sudo useradd username
Why This Matters for DevOps
In real DevOps scenarios, you need proper file ownership for:

Application deployments
Shared team directories
Container file permissions
CI/CD pipeline artifacts
Log file management
Submission
Navigate to 2026/day-11/ folder
Add day-11-file-ownership.md with screenshots
Commit and push to your fork
Learn in Public
Share on LinkedIn about mastering file ownership.

Use hashtags:

#90DaysOfDevOps
#DevOpsKaJosh
#TrainWithShubham

