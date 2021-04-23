#!/bin/bash
#
# Author: Jamie Giannini

# Objectives: Alter file permissions of everything in a directory.
# [X] Prompt user for input directory path
# [X] Prompt user for input permissions number (e.g. 777 to perform a chmod 777)
# [X] Navigate to the directory input by the user and changes all files inside it to the input setting.
# [X] Print to the screen the directory contents and the new permissions settings of everything in the directory.


function get_path () {
    echo "Enter a directory path:"
    read -r tar_directory

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
    read -r tar_perm

    cd "$tar_directory" || exit
    sudo chmod -R "$tar_perm" "$tar_directory" 
    sudo ls -la
}
get_path



