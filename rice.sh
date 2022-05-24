#!/bin/sh
user_name="$( cd "$(dirname "$0")" ; pwd -P )"
pushd $user_name > /dev/null

#
#  RUNNING LARBS
#
pacman -S --noconfirm archlinux-keyring
pacman -S --noconfirm --needed pacman-contrib

curl -LO larbs.xyz/larbs.sh

source larbs.sh                                  \
  -r https://github.com/FelixBrendel/arch_rice_1 \
  -b main                                        \
  -p https://raw.githubusercontent.com/FelixBrendel/arch_rice_1/main/progs.csv

user_name=$name #from larbs

mkdir /home/$name/code

# installing doom
git clone --depth 1 https://github.com/doomemacs/doomemacs  /home/$name/.config/emacs
git clone --depth 1 https://github.com/felixbrendel/.doom.d /home/$name/.config/doom
/home/$name/.config/emacs/bin/doom install

#cleanup this repo
rm -rf /home/$name/rice.sh/
rm -rf /home/$name/.git/
