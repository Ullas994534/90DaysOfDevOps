# Day 13 – Linux Volume Management (LVM)

## 🎯 Objective
Learn **Linux Logical Volume Management (LVM)** to manage storage flexibly by creating, extending, and mounting volumes without downtime.

📺 *Recommended*: Watch a Linux LVM tutorial before starting to understand the concepts clearly.

---

## 🧠 LVM Components Overview
- **PV (Physical Volume)** – Disk or partition initialized for LVM
- **VG (Volume Group)** – Pool of storage created from PVs
- **LV (Logical Volume)** – Flexible storage unit created from a VG

---

## 🧪 Task 1: Check Current Storage

```bash
lsblk     # List block devices
pvs       # Physical volume details
vgs       # Volume group details
lvs       # Logical volume details
df -h     # Mounted filesystems and usage
🧪 Task 2: Create Physical Volume (PV)

pvcreate /dev/nvme1n1
✅ Output:


Physical volume "/dev/nvme1n1" successfully created.
Verify:


lsblk
pvs
🧪 Task 3: Create Volume Group (VG)

vgcreate devops-vg /dev/nvme1n1
Verify:

vgs
✅ Result:

Volume Group: devops-vg

Size: 10G

Free Space: 10G

🧪 Task 4: Create Logical Volume (LV)

lvcreate -L 5G -n app-data devops-vg
Verify:


lvs
✅ Logical Volume Created:

Name: app-data

Size: 5G

🧪 Task 5: Format and Mount Logical Volume
Format LV

mkfs.ext4 /dev/devops-vg/app-data
Create Mount Directory

mkdir -p /mnt/app-data
Mount the Volume

mount /dev/devops-vg/app-data /mnt/app-data
Verify Mount

df -h /mnt/app-data
✅ Output:

/dev/mapper/devops--vg-app--data  4.9G  24K  4.6G  1% /mnt/app-data
🧪 Task 6: Extend the Logical Volume (Online Resize)
Extend LV Size by 3G

lvextend -L +3G /dev/devops-vg/app-data
Resize Filesystem (Online)

resize2fs /dev/devops-vg/app-data
Verify Updated Size

df -h /mnt/app-data
✅ Final Size:

/dev/mapper/devops--vg-app--data  7.8G  24K  7.4G  1% /mnt/app-data