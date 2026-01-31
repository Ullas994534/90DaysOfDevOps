# Day 06 – Linux Fundamentals: Read and Write Text Files

## Task
This is a **continuation of Day 05**, but much simpler.

Today’s goal is to **practice basic file read/write** using only fundamental commands.

You will create a small text file and practice:
- Creating a file
- Writing text to a file
- Appending new lines
- Reading the file back

Keep it basic and repeatable.

---

## Expected Output
By the end of today, you should have:

- the new created files
- A markdown file named:  
  `file-io-practice.md`

or

- A hand written practice note (Recommended)

Your note should include the commands you ran and what they did.

---

## Guidelines
Follow these rules while creating your practice note:


# Day 06 – File I/O Practice (Linux)

## Objective
Practice basic file creation, writing, and reading using common Linux commands.  
These are everyday tasks for DevOps engineers when handling logs, configs, and scripts.

---

## 1. Creating a File using `touch`

The `touch` command is used to create an empty file.

```bash
ullas@ullas:/home/day-06-practice$ sudo touch nodes.txt
ullas@ullas:/home/day-06-practice$ ls
nodes.txt
2. Writing Content to a File
Creating a file and writing content line by line
bash
Copy code
ullas@ullas:~$ touch notes.txt
Write the first line (overwrite if file exists):

bash
Copy code
ullas@ullas:~$ echo "line1-> I’ve started my DevOps Zero to Hero journey with TrainWithShubham, beginning with Linux from basics to advanced." > notes.txt
Append the second line:

bash
Copy code
ullas@ullas:~$ echo "line2-> Grateful to Shubham for creating such a structured, hands-on learning path." >> notes.txt
Append and display the third line using tee:

bash
Copy code
ullas@ullas:~$ echo "line3-> Focused on consistent practice and building strong fundamentals for a DevOps career" | tee -a notes.txt
Output:

text
Copy code
line3-> Focused on consistent practice and building strong fundamentals for a DevOps career
3. Reading the File Content
View the full file using cat
bash
Copy code
ullas@ullas:~$ cat notes.txt
Output:

text
Copy code
line1-> I’ve started my DevOps Zero to Hero journey with TrainWithShubham, beginning with Linux from basics to advanced.
line2-> Grateful to Shubham for creating such a structured, hands-on learning path.
line3-> Focused on consistent practice and building strong fundamentals for a DevOps career
4. Reading Specific Parts of a File
View the first 2 lines using head
bash
Copy code
ullas@ullas:~$ head -n 2 notes.txt
View the last 2 lines using tail
bash
Copy code
ullas@ullas:~$ tail -n 2 notes.txt
Commands Used
Command	Purpose
touch	Create an empty file
echo	Write text to a file
>	Overwrite file content
>>	Append content to a file
tee	Write to file and display output
cat	Read entire file
head	Read first few lines
tail	Read last few lines

Why This Matters for DevOps
Reading and writing files is a daily task in DevOps.

Logs are text files

Configuration files are text files

Scripts are text files

Strong file handling skills help you debug faster and automate confidently.

Submission Steps
Fork the 90DaysOfDevOps repository

Navigate to 2026/day-06/

Add file-io-practice.md

Commit and push changes to your fork

Learn in Public 🚀
Share your Day 06 progress on LinkedIn:

2–3 lines on what you learned about file read/write

One command you will use often

Optional: Screenshot of your notes

Hashtags:

#90DaysOfDevOps
#DevOpsKaJosh
#TrainWithShubham
Happy Learning
– TrainWithShubham

yaml

