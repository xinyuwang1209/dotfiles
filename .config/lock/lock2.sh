#!/bin/bash
pkill -f "lemonbar -n notification"

rectangles=" "

SR=$(xrandr --query | grep ' connected' | grep -o '[0-9][0-9]*x[0-9][0-9]*[^ ]*')
for RES in $SR; do
  SRA=(${RES//[x+]/ })
  CX=$((${SRA[2]} + 25))
  CY=$((${SRA[1]} - 80))
  rectangles+="rectangle $CX,$CY $((CX+300)),$((CY-80)) "
done

TMPBG=/tmp/screen.png
scrot $TMPBG && convert $TMPBG -scale 5% -scale 2000% -draw "fill black fill-opacity 0.4 $rectangles" $TMPBG


i3lock \
  -i $TMPBG --clock \


#  --timepos="main_w-90:main_h-20" 
#  --datepos="tx+24:ty+25" \
  --clock --datestr "Type password to unlock..." 
  --insidecolor=00000000 --ringcolor=ffffffff --line-uses-inside
   --keyhlcolor=d23c3dff --bshlcolor=d23c3dff --separatorcolor=00000000 \
#  --insidevercolor=fecf4dff --insidewrongcolor=d23c3dff \
  --ringvercolor=ffffffff --ringwrongcolor=ffffffff 
--indpos="x+290:h-120" \
  --radius=20 --ring-width=3 --veriftext="" --wrongtext="" \
#  --timecolor="ffffffff" --datecolor="ffffffff"
#i3lock -i $TMPBG



rm $TMPBG
