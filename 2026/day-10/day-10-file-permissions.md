# Day 10 – File Permissions & File Operations Challenge 🐧

## 📌 Task
Master **file permissions** and **basic file operations** in Linux with hands-on practice.

---

## 🧪 Commands Practiced

### 🔹 File Creation & Editing
```bash
touch devops.txt
echo "hello DevOps friends, today task is day-10 working on linux File Permissions & File Operations Challenge with hand-on practices" > notes.txt
cat notes.txt
vim script.sh
cat script.sh
🔹 Listing & Viewing Files
bash
Copy code
ls -l
cat /etc/passwd | head -n 5
cat script.sh | head -n 5
cat script.sh | tail -n 5
🔹 File Permissions
bash
Copy code
chmod 777 script.sh
ls -l
./script.sh
bash
Copy code
chmod 700 script.sh
./script.sh
bash
Copy code
chmod 444 devops.txt
chmod 640 notes.txt
🔹 Directory Operations
bash
Copy code
mkdir projest/
ls -l
chmod 755 projest/
ls -lta
Output Screenshots
Command Outputs
