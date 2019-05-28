#!/usr/bin/env fish

if ps aux | grep -q "rclone_sheffield"
    printf "this worked\n"
else 
    printf "this didn't work"
end
