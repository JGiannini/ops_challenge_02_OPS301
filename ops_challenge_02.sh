#!/bin/bash
#
# Author: Jamie Giannini

# Objectives: Alter file permissions of everything in a directory.
# [X] Prompt user for input directory path
# [X] Prompt user for input permissions number (e.g. 777 to perform a chmod 777)
# [X] Navigate to the directory input by the user and changes all files inside it to the input setting.
# [X] Print to the screen the directory contents and the new permissions settings of everything in the directory.
# Extra:
# [X] Design your script to output a log file of all actions that were taken by the script.


function get_path () {
    echo "Enter a directory path:"
    read -r tar_directory # store user entry
    echo -e "\nDirectory entered: $tar_directory" >> "$tar_directory"/logFile.txt # logs directory path provided

    echo "
    Reference:
    0 = - (No permission)
    1 = -x (Execute)
    2 = -w- (Write)
    3 = -wx (Write + Execute)
    4 = r- (Read)
    5 = r-x (Read + Execute)
    6 = rw- (Read + Write)
    7 = rwx (Read + Write + Execute)
"
    echo "Enter permissions number:"
    read -r tar_perm # store user entry
    echo "Permission value entered: $tar_perm" >> "$tar_directory"/logFile.txt # logs number provided

    cd "$tar_directory" || exit
    chmod -R "$tar_perm" "$tar_directory" #recursively alters permissions
    ls -la #list out contents and permissions
    echo "Directory contents and permissions: " >> "$tar_directory"/logFile.txt
    ls -la >> "$tar_directory"/logFile.txt # Logs directory listing with permissions
    getTime="$(date +"%B_%d_%Y_%r")" # Gets current local date and time
    echo "Changes completed: ${getTime}" >> "$tar_directory"/logFile.txt # Logs timestamp
    echo "Changes made by: $USERNAME" >> "$tar_directory"/logFile.txt # Logs username
}
get_path



