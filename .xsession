wal -i ~/google_drive/Wallpaper 
~/scripts/screen_setup.sh

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload top &
done

exec insync start
