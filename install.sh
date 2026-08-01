#!/usr/bin/env bash

sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount --flake .#minimal

mount | grep /mnt

read -p "is this mounting scheme correct? [y/N]: " correctMounting

case $correctMounting in
y | Y | yes | Yes | YES)
  echo "good. continuing install..."
  ;;
n | N | no | No | NO)
  echo "oops. aborting install..."
  exit 1
  ;;
*)
  echo "unrecognized input. aborting install..."
  exit 1
  ;;
esac

read -p "enter the swap partition (e.g. /dev/nvme0n1p2, /dev/sda2, etc.): " swapDevice

swapon "$swapDevice"

nixos-generate-config --root /mnt --no-filesystems

nixos-install --flake .#minimal

for _ in {1..5}; do
  echo "setting user password..."
  read -sp "user password: " password
  printf "\n"
  read -sp "retype user password: " password2
  printf "\n"

  if [ $password != $password2 ]; then
    echo "your passwords do not match. try again"
  else
    # mkpasswd -m yescrypt > /mnt/persist/passwd
    echo "user password set!"
    echo "install done! please check manually in the /mnt folder for possible errors before reboot"
    exit 0
  fi
done

echo "setting user password failed! please create the password manually using 'mkpasswd -m yescript > /mnt/persist/passwd'"
