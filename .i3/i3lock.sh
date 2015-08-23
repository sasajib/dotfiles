#!/bin/bash
scrot /tmp/screen_locked.png
convert /tmp/screen_locked.png -blur 400x10 /tmp/screen_locked.png
i3lock -i /tmp/screen_locked.png
