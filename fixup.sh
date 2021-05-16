#!/bin/bash

command_exists() {
    command -v "$1" >/dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        echo
        echo "This script requires $1 but it's not installed. Abort."
        echo
        echo "        Try install with: $2"
        echo
        exit 1
    fi
}

command_exists dialog "sudo apt-get install dialog"

if [ ! -e ./.config ]; then
	LIST=()
	for item in config-*; do
		LIST+=( $( basename $item .sh ) .  off )
	done
	local script
	script=$( dialog --backtitle "Select configuration" \
			 --radiolist "Select product to build:" 20 80 20 \
			 "${LIST[@]}" \
		  3>&1 1>&2 2>&3 )

	clear

	if [ "$script" == ""  ]; then
		exit 1;
	fi

	echo "$script was selected"
	cp ./$script ./.config
fi

[ ! -e ./.config ] && { echo "Please select configuration file!"; exit 1; }

[ -e ./dl/.git ] && {
    pushd dl
    echo "Update download cache files..."
    git pull
    popd
}

echo "Delete all master/trunk download cache files..."
[ -d ./dl ] && rm -f ./dl/*HEAD*

[ -d ./.git ] && {
    echo "Downloading repository latest..."
    git pull
}

echo "Update and install feeds..."
./scripts/feeds update -a
./scripts/feeds install -a

echo "Normalize configuration..."
make defconfig

cat <<EOF


Ready for build:

e.g. $ make -j8
     $ time make -j8
     $ make -j1 V=s
     $ remake --debug -j1 V=s

Then ready to flash:

e.g. $ cd ./bin/targets/stm32mp1/generic
     $ sudo dd if=./openwrt-stm32mp1-dk2-basic-ext4-sdcard.bin of=/dev/sda bs=8M conv=fdatasync status=progress

EOF
