#!/bin/bash

scrot /tmp/screen.png
TMPBG=/tmp/screen.png
TMPBG_BLUR=/tmp/screen_blur.png
LOCK=$HOME/.config/lock/logos/lyoko.png
RES=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')
 
convert -noise 10x10 -gaussian-blur 15x15 $TMPBG $TMPBG_BLUR
# convert -noise 50x50  $TMPBG $TMPBG_BLUR

#convert /home/USERNAME/Pictures/wallpapers/wallhaven-72201.jpg -alpha set -channel A -evaluate 
set 10% png:- | feh -bg-fill -



# ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK \
# -filter_complex "boxblur=5:1,overlay=(main_w-overlay_w*0.975/0.975)/2:(main_h-overlay_h)/2" \
# -vframes 1 $TMPBG -loglevel quiet


#i3lock -i $TMPBG --clock --timecolor=00000000
#i3lock -i $TMPBG --clock --timecolor=ffffffff --timepos="x+500:h-200"




i3lock \
  -i $TMPBG_BLUR -f --clock \
  --radius 256 --ring-width 5 \
  --timepos="x+200:h-100" --timecolor=ffffffff \
  --datepos="tx+24:ty+25" --datecolor=ffffffff \
  --timestr="Shanghai: %H:%M:%S" --datestr "Type password to unlock..." \
  --insidecolor=00000000 --ringcolor=ffffffff --line-uses-inside 
#   --keyhlcolor=d23c3dff --bshlcolor=d23c3dff --separatorcolor=00000000 
#  --insidevercolor=fecf4dff --insidewrongcolor=d23c3dff \
#  --ringvercolor=ffffffff --ringwrongcolor=ffffffff 
#--indpos="x+290:h-120" \
#  --radius=20 --ring-width=3 --veriftext="" --wrongtext="" \
#  --timecolor="ffffffff" --datecolor="ffffffff"
#i3lock -i $TMPBG

rm $TMPBG
