# Idea

* Simple command for every job (should work with cron
* Backup files and folders from local disk or an USB drive
* Use existing tools (rclone, etc) and a cloud storage with enough space
* Version: Keep removed or edited files in backup dir till removed by hand
* Mount: please note the mount is using cache so remount from time to time
* Bwlimit: used to limit upload speed to keep download speed high and latency low
* Limit transfers and checkers: this is needed to prevent errors


# Commands

> rclone sync /media/dominikschmitt/Externe\ Linux/ davsechetzner:/Externaldrive1 --backup-dir davsechetzner:/Backup/Externaldrive1 --suffix=$(date +"__%Y_%m_%d_%H%M%S") --contimeout=5m --bwlimit "00:45,800 04:30,650 16:00,350 18:00,150 22:00,350 23:30,450"

> rclone sync /media/dominikschmitt/Externe\ Linux/ davsechetzner:/Externaldrive1 --backup-dir davsechetzner:/Backup/Externaldrive1 --suffix=$(date +"__%Y_%m_%d_%H%M%S") --contimeout=5m --bwlimit "00:45,800 04:30,650 16:00,350 18:00,150 22:00,350 23:30,450" -v --stats=10s --transfers=2 --checkers=2

> rclone mount davsechetzner: /media/Hetzner/ --transfers=4 --checkers=4
