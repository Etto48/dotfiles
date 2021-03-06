#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/colors.ini"
RFILE="$HOME/.config/rofi/colors.rasi"
IFILE="$HOME/.config/i3/0-config"
DFILE="$HOME/.config/dunst/dunstrc"

# Change colors
change_color() {
	# polybar
	sed -i -e 's/background = #.*/background = #1F1F1F/g' $PFILE
	sed -i -e 's/foreground = #.*/foreground = #FFFFFF/g' $PFILE
	sed -i -e 's/foreground-alt = #.*/foreground-alt = #8F8F8F/g' $PFILE
	sed -i -e "s/shade1 = #.*/shade1 = $SH1/g" $PFILE
	sed -i -e "s/shade2 = #.*/shade2 = $SH2/g" $PFILE
	sed -i -e "s/shade3 = #.*/shade3 = $SH3/g" $PFILE
	sed -i -e "s/shade4 = #.*/shade4 = $SH4/g" $PFILE
	sed -i -e "s/shade5 = #.*/shade5 = $SH5/g" $PFILE
	sed -i -e "s/shade6 = #.*/shade6 = $SH6/g" $PFILE
	sed -i -e "s/shade7 = #.*/shade7 = $SH7/g" $PFILE
	sed -i -e "s/shade8 = #.*/shade8 = $SH8/g" $PFILE
	
	# rofi
	cat > $RFILE <<- EOF
	/* colors */

	* {
	  al:    #00000000;
	  bg:    #1F1F1FFF;
	  bg1:   ${SH2}FF;
	  bg2:   ${SH3}FF;
	  bg3:   ${SH4}FF;
	  bg4:   ${SH5}FF;
	  fg:    #FFFFFFFF;
	}
	EOF
	
	echo "
		#Colors
		set \$accent-color        $SH3
		set \$bg-color 	          #1F1F1F
		set \$inactive-bg-color   #1F1F1F
		set \$text-color          $SH3
		set \$inactive-text-color $SH1
		set \$urgent-bg-color     #1F1F1F
		set \$urgent-text-color   $SH6
	" > $IFILE

	sed -i -e "s/frame_color = \"#.*\"/frame_color = \"$SH3\"/g" $DFILE
	sed -i -e 's/background = \"#.*\"/background = \"#1F1F1F\"/g' $DFILE
	sed -i -e 's/foreground = \"#.*\"/foreground = \"#FFFFFF\"/g' $DFILE

	polybar-msg cmd restart
}

source ~/.config/i3/scripts/settings/color-settings.sh
