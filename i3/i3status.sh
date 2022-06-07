#!/bin/bash

i3status --config ~/.config/i3/i3status.conf | while :
do
    read line
    KBD_CODE=$(xset -q|grep LED| awk '{ print $10 }');
        case "$KBD_CODE" in
            "00000000") KBD="Español" ;;
            "00001000") KBD="Русский" ;;
            "00000002") KBD="english" ;;
            "00001002") KBD="thai" ;;
            *) KBD=$KBD_CODE ;;
        esac

        echo "kbmap: $KBD | $line" || exit 1
done
