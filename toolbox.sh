#!/bin/bash
# Sysadmin Toolbox
echo "🔧 Sysadmin Toolbox"
echo "1. Disk Usage:"
df -h | head -n 5
echo ""
echo "2. Memory Usage:"
free -m
echo ""
echo "3. Top 5 CPU consuming processes:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
echo ""
echo "4. Clearing PageCache (requires root)..."
if [ "$EUID" -eq 0 ]; then
    sync; echo 1 > /proc/sys/vm/drop_caches
    echo "Cache cleared."
else
    echo "Skipped cache clear (not root)."
fi
