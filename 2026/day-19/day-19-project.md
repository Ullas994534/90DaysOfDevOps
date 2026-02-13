### Day 19 – Shell Scripting Project: Log Rotation, Backup & Crontab


## Task:working on how to do log rotation, server backup the logs and using crontab (automation)


### Challenge Tasks

## Task 1: Log Rotation Script

Create log_rotate.sh that:
#!/bin/bash

log_rotation() {

echo "Starting log rotation..."
mkdir -p "/home/ullas/backup"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

cp "/var/log/nginx/error.log" "/home/ullas/backup/error_$TIMESTAMP.log"

echo "Log copied successfully."

echo "Compress .log files older than 7 days"
find "/home/ullas/backup" -name "*.log" -type f -mtime +7 -exec gzip {} \;

echo "Old log files compressed."

echo "Delete .gz files older than 30 days"
find "/home/ullas/backup" -name "*.gz" -type f -mtime +30 -delete

echo "Old compressed files deleted."

echo "Log rotation completed!"

}

# calling the function
log_rotation

Expected Output:

![screenshot1](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-19/images/Screenshot%20from%202026-02-13%2014-51-10.png)

## 2) Task 2: Server Backup Script

Create backup.sh that:


#!/bin/bash

backup_tar() {

    # Check arguments
    if [ "$#" -ne 2 ]; then
        echo "Usage: backup_tar /home/ullas/day19 /home/ullas/day19/backup/error_$TIMESTAMP.log"
        exit 1
    fi

    SOURCE="$1"
    DEST="$2"

    # Check if source exists
    if [ ! -d "$SOURCE" ]; then
        echo "Error: Source directory does not exist."
        exit 1
    fi

    echo "Starting backup..."

    # Create destination directory
    mkdir -p "$DEST"

    # Create timestamp
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

    ARCHIVE_NAME="backup-$TIMESTAMP.tar.gz"
    ARCHIVE_PATH="$DEST/$ARCHIVE_NAME"

    # Create tar archive
    tar -czf "$ARCHIVE_PATH" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"

    # Verify archive
    if [ -f "$ARCHIVE_PATH" ]; then
        echo "Backup created successfully!"
        echo "Archive Name: $ARCHIVE_NAME"
        ls -slth "$ARCHIVE_PATH"
    else
        echo "Backup failed!"
        exit 1
    fi

    # Delete backups older than 14 days
    find "$DEST" -type f -name "backup-*.tar.gz" -mtime +14 -delete

    echo "Old backups older than 14 days deleted."
    echo "Backup completed successfully!"  
}

# Call function with script arguments
backup_tar "$@"

## Run the commands:
chmod +x backup.sh
/home/ullas/day19 /home/ullas/day19/backup/error_$TIMESTAMP.log

Expected Output:

![screenshot2](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-19/images/Screenshot%20from%202026-02-13%2016-01-35.png)


## Task 3: Crontab

Read: crontab -l — what's currently scheduled?

1) crontab -e: is used o edit cronjob
2) crontab -l: is used to list cronjobs

![screenshot3](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-19/images/Screenshot%20from%202026-02-13%2016-53-44.png)

0 2 * * * bash /home/ullas/day19/log_rotation.sh

0 3 * * 7 bash /home/ullas/backup_demo.sh

*/5 * * * * bash /home/ullas/day19/log_rotation.sh >> /var/log/cron.log 2>&1 /dev/nulll

*/5 * * * * bash /home/ullas/backup_demo.sh >> /var/log/cron.log 2>&1 /dev/null

![screenshot4](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-19/images/Screenshot%20from%202026-02-13%2018-53-01.png)



### Task 4: Combine — Scheduled Maintenance Script

## Create maintenance.sh that:

#!/bin/bash

maintenance() {

LOGFILE="/home/ullas/day19/maintenance.log"

echo "$(date): maintenance started" >> "$LOGFILE"

./log_rotation.sh /home/ullas/day19 >> "$LOGFILE" 2>&1
./backup_demo.sh /home/ullas/day19 >> "$LOGFILE" 2>&1

echo "$(date): maintenance completed successfully" >> "$LOGFILE"

}

maintenance

## output

![screenshot5](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-19/images/Screenshot%20from%202026-02-13%2018-53-01.png)

![screenshot6](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-19/images/Screenshot%20from%202026-02-13%2020-21-26.png)

## Conclusion

Day 19 helped me apply shell scripting concepts to real-world system administration tasks. I built automated solutions for log rotation, server backups, and scheduled maintenance using cron. This project strengthened my understanding of how automation improves reliability, saves time, and keeps servers clean and organized.

## What I Learned

How to use find, gzip, and tar to automate log management and backups.

How to schedule recurring tasks using crontab and understand cron syntax.

How to write production-style scripts with argument validation, error handling, and logging.