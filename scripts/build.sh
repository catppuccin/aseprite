#!/usr/bin/env bash

mkdir ./theme

clear
echo ""
echo "Choose flavor out of -
 1. Mocha
 2. Macchiato 
 3. Frappé
 4. Latte 
(Type the number corresponding to said pallet)
"
read -r FLAVOUR
clear
if [[ $FLAVOUR == "1" ]]; then
    echo "The pallet Mocha(1) was selected";
    FLAVOURNAME="Mocha";
elif [[ $FLAVOUR == "2" ]]; then
    echo "The pallet Macchiato(2) was selected";
    FLAVOURNAME="Macchiato";
elif [[ $FLAVOUR == "3" ]]; then
    echo "The pallet Frappe(3) was selected";
    FLAVOURNAME="Frappe";
elif [[ $FLAVOUR == "4" ]]; then
    echo "The pallet Latte(4) was selected";
    FLAVOURNAME="Latte";
else echo "Not a valid flavour name" && exit;
fi
echo ""

echo Building...
cp ./base/* ./theme
sed -f ./scripts/Pallets/$FLAVOURNAME.sed ./base/theme.xml > ./theme/theme.xml

echo "compressing..."
cd ./theme || exit 
zip -FSr ../catppuccin.aseprite-extension *
echo "done! :3"