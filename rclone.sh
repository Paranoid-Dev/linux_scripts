#!/bin/bash

screen -dmS rclone bash -c 'rclone sync -P --transfers 5 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 5 --bwlimit 8M "onedrive_whimoon:/" "/mnt/pool1/nas/tmp_onedrive_whimoon/" --delete-during; echo "press enter to return"; read x'

