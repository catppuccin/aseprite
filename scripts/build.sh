#!/usr/bin/env bash

mkdir ./.dist

clear
echo ""
echo "Choose flavor out of -
 1. Mocha
 2. Macchiato
 3. Frappé
 4. Latte 
(Type the number corresponding to said palette)
"
read -r FLAVOUR
clear
if [[ $FLAVOUR == "1" ]]; then
    echo "The palette Mocha(1) was selected";
    FLAVOURNAME="Mocha";
elif [[ $FLAVOUR == "2" ]]; then
    echo "The palette Macchiato(2) was selected";
    FLAVOURNAME="Macchiato";
elif [[ $FLAVOUR == "3" ]]; then
    echo "The palette Frappe(3) was selected";
    FLAVOURNAME="Frappe";
elif [[ $FLAVOUR == "4" ]]; then
    echo "The palette Latte(4) was selected";
    FLAVOURNAME="Latte";
else echo "Not a valid flavour name" && exit;
fi
echo ""

echo Building...
cp ./base/others/* ./.dist
sed -f ./scripts/palettes/$FLAVOURNAME.sed ./base/theme.xml > ./.dist/theme.xml
cp ./base/sheet/sheet_$FLAVOURNAME.png ./.dist/sheet.png

echo "Compressing..."
cd ./.dist || exit 
zip -FSr ../catppuccin.aseprite-extension *
echo "Done!"