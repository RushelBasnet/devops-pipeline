usage=$(echo "scale=1; 100 - $idle" | bc)
echo "Total CPU Usage: $usage %"

echo "Memory Usage:"
mem_total=$(free -m | awk '/Mem:/ {print $2}')
mem_used=$(free -m | awk '/Mem:/ {print $3}')
mem_free=$(free -m | awk '/Mem:/ {print $4}')
mem_usage_percent=$(echo "scale=1; $mem_used/$mem_total*100" | bc)

echo "Total: ${mem_total}MB"
echo "Used: ${mem_used}MB"
echo "Free: ${mem_free}MB"
echo "Usage: ${mem_usage_percent}%"

echo "Disk Usage:"
disk_total=$(df -h / | awk 'NR==2 {print $2}')
disk_used=$(df -h / | awk 'NR==2 {print $3}')
disk_free=$(df -h / | awk 'NR==2 {print $4}')
disk_percent=$(df -h / | awk 'NR==2 {print $5}')

echo "Total: $disk_total"
echo "Used: $disk_used"
echo "Free: $disk_free"
echo "Usage: $disk_percent"

echo "Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

echo "Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

echo "Additional System Info:"
echo "OS Version:"
grep PRETTY_NAME /etc/os-release

echo "Uptime:"
uptime -p

echo "Load Average:"
uptime | awk -F'load average:' '{print $2}'

echo "Logged In Users:"
who
echo ""
