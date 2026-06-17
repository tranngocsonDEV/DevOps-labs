#!/bin/bash



echo "======================================"
echo "      SERVER PERFORMANCE STATS        "
echo "======================================"
echo "--------------------------------------"

# 1. CPU Usage
echo "---CPU USAGE---"
echo "Total CPU Usage: $(top -b -n 1 | grep "Cpu(s)" | awk '{print 100 - $8 "%"}')"
echo ""
# 2.Memory Usage
echo "---MEM USAGE---"
echo "Total memory Usage: $(free -m | awk 'NR==2{printf "Total: %sMB | Used: %sMB | Free: %sMB | Pct: %.2f%%\n", $2, $3, $4, $3*100/$2}')"
echo ""
# 3. Disk Usage
echo "--- DISK USAGE (Root /) ---"
df -h / | awk 'NR==2{printf "Total: %s | Used: %s | Available: %s | Pct: %s\n", $2, $3, $4, $5}'
echo ""

# 4. Top 5 CPU Processes
echo "--- TOP 5 PROCESSES BY CPU USAGE ---"
ps -eo pid,cmd,%cpu --sort=-%cpu | head -n 6
echo ""

# 5. Top 5 Memory Processes
echo "--- TOP 5 PROCESSES BY MEMORY USAGE ---"
ps -eo pid,cmd,%mem --sort=-%mem | head -n 6
echo "======================================"