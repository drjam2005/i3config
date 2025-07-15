interval=1.0
prev_state=""
prev_file=""

while true; do
    if ! out=$(cmus-remote -Q 2>/dev/null); then
        sleep "$interval"
        continue
    fi

    state=$(awk '/^status /{print $2}' <<<"$out")
    file=$(awk '/^file /{sub(/^file /,""); print; exit}' <<<"$out")

    [[ -z $file ]] && { sleep "$interval"; continue; }

    mp3=${file##*/}
    name=${mp3%.*}

    if [[ $file != "$prev_file" ]]; then
        notify-send -u low -i media-playback-start "▶  Playing" "$name"
    elif [[ $state != "$prev_state" ]]; then
        case $state in
            playing) notify-send -u low -i media-playback-start "⏯  Resumed" "$name" ;;
            paused)  notify-send -u low -i media-playback-pause "⏸  Paused"  "$name" ;;
            stopped) notify-send -u low -i media-playback-stop  "⏹  Stopped" ""      ;;
        esac
    fi

    prev_state=$state
    prev_file=$file
    sleep "$interval"
done

