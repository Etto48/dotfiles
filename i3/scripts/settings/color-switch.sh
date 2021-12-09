#!/usr/bin/env bash

SEDIR="$HOME/.config"
SCDIR="$HOME/.config/i3/scripts/settings"

# Launch Rofi
MENU="$(rofi -no-config -no-lazy-grab -sep "|" -dmenu -i -p '' \
-theme $SEDIR/rofi/styles.rasi \
<<< " amber| blue| blue-gray| brown| cyan| deep-orange|\
 deep-purple| green| gray| indigo| blue-light| green-light|\
 lime| orange| pink| purple| red| teal| yellow| amber-dark|\
 blue-dark| blue-gray-dark| brown-dark| cyan-dark| deep-orange-dark|\
 deep-purple-dark| green-dark| gray-dark| indigo-dark| blue-light-dark|\
 green-light-dark| lime-dark| orange-dark| pink-dark| purple-dark| red-dark| teal-dark| yellow-dark|")"
            case "$MENU" in
				## Light Colors
				*amber) "$SCDIR"/colors-light.sh --amber ;;
				*blue) "$SCDIR"/colors-light.sh --blue ;;
				*blue-gray) "$SCDIR"/colors-light.sh --blue-gray ;;
				*brown) "$SCDIR"/colors-light.sh --brown ;;
				*cyan) "$SCDIR"/colors-light.sh --cyan ;;
				*deep-orange) "$SCDIR"/colors-light.sh --deep-orange ;;
				*deep-purple) "$SCDIR"/colors-light.sh --deep-purple ;;
				*green) "$SCDIR"/colors-light.sh --green ;;
				*gray) "$SCDIR"/colors-light.sh --gray ;;
				*indigo) "$SCDIR"/colors-light.sh --indigo ;;
				*blue-light) "$SCDIR"/colors-light.sh --light-blue ;;
				*green-light) "$SCDIR"/colors-light.sh --light-green ;;
				*lime) "$SCDIR"/colors-light.sh --lime ;;
				*orange) "$SCDIR"/colors-light.sh --orange ;;
				*pink) "$SCDIR"/colors-light.sh --pink ;;
				*purple) "$SCDIR"/colors-light.sh --purple ;;
				*red) "$SCDIR"/colors-light.sh --red ;;
				*teal) "$SCDIR"/colors-light.sh --teal ;;
				*yellow) "$SCDIR"/colors-light.sh --yellow ;;
				## Dark Colors
				*amber-dark) "$SCDIR"/colors-dark.sh --amber ;;
				*blue-dark) "$SCDIR"/colors-dark.sh --blue ;;
				*blue-gray-dark) "$SCDIR"/colors-dark.sh --blue-gray ;;
				*brown-dark) "$SCDIR"/colors-dark.sh --brown ;;
				*cyan-dark) "$SCDIR"/colors-dark.sh --cyan ;;
				*deep-orange-dark) "$SCDIR"/colors-dark.sh --deep-orange ;;
				*deep-purple-dark) "$SCDIR"/colors-dark.sh --deep-purple ;;
				*green-dark) "$SCDIR"/colors-dark.sh --green ;;
				*gray-dark) "$SCDIR"/colors-dark.sh --gray ;;
				*indigo-dark) "$SCDIR"/colors-dark.sh --indigo ;;
				*blue-light-dark) "$SCDIR"/colors-dark.sh --light-blue ;;
				*green-light-dark) "$SCDIR"/colors-dark.sh --light-green ;;
				*lime-dark) "$SCDIR"/colors-dark.sh --lime ;;
				*orange-dark) "$SCDIR"/colors-dark.sh --orange ;;
				*pink-dark) "$SCDIR"/colors-dark.sh --pink ;;
				*purple-dark) "$SCDIR"/colors-dark.sh --purple ;;
				*red-dark) "$SCDIR"/colors-dark.sh --red ;;
				*teal-dark) "$SCDIR"/colors-dark.sh --teal ;;
				*yellow-dark) "$SCDIR"/colors-dark.sh --yellow				
            esac
