#!/bin/bash
# System info script - Amalbek Miras

cd "$(dirname "$0")/.."

echo "=============================="
echo "Student Information"
echo "=============================="
echo "Name: Miras"
echo "Surname: Amalbek"
echo "Group: IT2-2313"
echo "Student ID: 37270"

echo "=============================="
echo "System Information"
echo "=============================="
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -o) $(uname -r)"
echo "Disk Usage:"
df -h /
echo "Memory Usage:"
free -h

if [ -f Amalbek_Miras_info.txt ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi
