# Linux System Backup

A simple Bash script for creating timestamped `.tar` backups of files and directories on Linux.

## Features

* Search files/directories by name
* Interactive selection for multiple matches
* Input validation
* Timestamped backup filenames
* Separate backup directory
* Basic error handling

## Usage

```bash
./backup.sh
```

Enter the name of the file or directory you want to back up. If multiple matches are found, select the desired one.

Backups are saved to:

```text
backups/<name>_<timestamp>.tar
```

## Requirements

* Linux
* Bash
* `find`
* `tar`

## Example

```text
Enter the name of the file or directory to backup: test-data

Multiple matches found:
1) /home/user/.local/share/Trash/files/test-data
2) /home/user/devops-lab/Linux-system-backup/test-data

Choose a number: 2

Backup created: backups/test-data_2026-09-27_11-45-04.tar
```

Made with curiosity and Bash by **Mohammadreza Pirayesh**
rez4dev@gmail
