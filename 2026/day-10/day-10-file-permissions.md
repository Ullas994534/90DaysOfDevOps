# Day 10 – File Permissions & File Operations Challenge

## 🎯 Task
Master file permissions and basic file operations in Linux through hands-on practice.

---

## 🧪 Day 10 Challenge

### 📄 Files Created, Permission Changes & Commands Used

```bash
touch devops.txt

echo "hello DevOps friends, today task is day-10 working on linux File Permissions & File Operations Challenge with hand-on pratices" > notes.txt

cat notes.txt

vim script.sh
cat script.sh

ls -l

cat /etc/passwd | head -n 5

cat script | head -n 5
cat script.sh | head -n 5
cat script.sh | tail -n 5
cat script.sh | head -n 3
cat script.sh | tail -n 5

ls -l

chmod 777 script.sh
ls -l
./script.sh

cat /etc/passwd | head -n 3
cat /etc/passwd | head -n 5
cat /etc/passwd | tail -n 5

chmod 700 script.sh
./script.sh

chmod 444 devops.txt
chmod 640 notes.txt

mkdir projest/
ls -l

chmod 755 projest/
ls -lta

### Commands Output:

![images Link](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-10/images-day10/touch_command.png)

![images-day10 Link](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-10/images-day10/touch_command.png)

![images Link](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-10/images-day10/Screenshot%20From%202026-02-04%2020-26-06.png)

![image Link](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-10/images-day10/Screenshot%20From%202026-02-04%2020-26-30.png)

![images Link](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-10/images-day10/Screenshot%20From%202026-02-04%2020-26-44.png)

![images Link](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-10/images-day10/Screenshot%20From%202026-02-04%2020-27-02.png)

![images Link](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-10/images-day10/Screenshot%20From%202026-02-04%2020-27-25.png)

What I Learned
📝 File Creation & Viewing

Created files using:

touch → Create empty files

vim → Create and edit files

Viewed file contents using:

cat → Display file content in the terminal

🔐 Linux File Permissions (rwx)

Linux permissions are divided into three types:

r → Read (view file content)

w → Write (modify file)

x → Execute (run a file or script)

Permissions apply to:

User (Owner)

Group

Others

Example Permission:
-rwxr-xr--


User → rwx

Group → r-x

Others → r--

📂 Directory Permissions

Learned how directory permissions affect access

Used ls -l and ls -lta to inspect permissions, ownership, and timestamps

✅ Summary

Learned file creation and viewing commands

Understood the Linux permission model (rwx)

Practiced numeric permission modes:

777, 700, 755, 640, 444

Executed shell scripts using ./script.sh

Explored directory permissions and detailed listings