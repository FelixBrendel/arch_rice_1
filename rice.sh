#!/bin/sh
user_name="$( cd "$(dirname "$0")" ; pwd -P )"
pushd $user_name > /dev/null

#
#  RUNNING LARBS
#
pacman -S --noconfirm archlinux-keyring
# NOTE(Felix): we manually need to install git here even though larbs would do
#   that because of a bug in larbs that occurs if you specify a dotfiles
#   repository. (https://github.com/LukeSmithxyz/LARBS/issues/450)
pacman -S --noconfirm --needed pacman-contrib git

curl -LO larbs.xyz/larbs.sh

. ./larbs.sh                                     \
  -r https://github.com/FelixBrendel/arch_rice_1 \
  -b main                                        \
  -p https://raw.githubusercontent.com/FelixBrendel/arch_rice_1/main/progs.csv

user_name=$name #from larbs

mkdir /home/$name/code

# installing doom
sudo -u "$user_name" git clone --depth 1 https://github.com/doomemacs/doomemacs  /home/$name/.config/emacs
sudo -u "$user_name" git clone --depth 1 https://github.com/felixbrendel/.doom.d /home/$name/.config/doom
sudo -u "$user_name" /home/$name/.config/emacs/bin/doom install
sudo -u "$user_name" /home/$name/.config/emacs/bin/doom sync

#cleanup this repo
rm -rf /home/$name/rice.sh/
rm -rf /home/$name/.git/
