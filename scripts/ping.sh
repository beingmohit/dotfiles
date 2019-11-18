sleep 5 && ping -qc1 google.com 2>&1 | awk -F/ '/^rtt/ { printf "%.0f ms\n", $5; ok = 1 } END { if (!ok) print "Offline" }'
