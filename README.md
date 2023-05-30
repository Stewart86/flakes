## Credit and Credit is Due

- Config Originally adapted from [ruixi-rebirth](https://github.com/ruixi-rebirth/flakes) minimal install version with additional to some personal applications.

## Applications included

[TBA]

## Folder Structure and customisation

[TBA]

## Setup and Install

0. Prepare a 64-bit nixos [minimal iso image](https://channels.nixos.org/nixos-22.11/latest-nixos-minimal-x86_64-linux.iso) and burn it, then enter the live system.

1. Partition disk (reference [from](https://nixos.org/manual/nixos/stable/index.html#sec-installation-manual-partitioning-formatting))

```bash
parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart primary 512MB -8GB
parted /dev/sda -- mkpart primary linux-swap -8GB 100%
parted /dev/sda -- mkpart ESP fat32 1MB 512MB
parted /dev/sda -- set 3 esp on
```

2. Format the partition

```bash
mkfs.ext4 -L nixos /dev/sda1
mkswap -L swap /dev/sda2
mkfs.fat -F 32 -n boot /dev/sda3
```

3. Mount

```bash
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot
swapon /dev/sda2
```

4. Generate a basic configuration

```bash
nixos-generate-config --root /mnt
```

5. Clone the repository locally

```bash
nix-shell -p git
git clone  https://github.com/stewart86/flakes.git /mnt/etc/nixos/Flakes
cd /mnt/etc/nixos/Flakes/
nix develop --extra-experimental-features nix-command --extra-experimental-features flakes
```

6. Copy `hardware-configuration.nix` from /mnt/etc/nixos to /mnt/etc/nixos/Flakes/hosts/laptop/hardware-configuration.nix

```bash
cp /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/Flakes/hosts/laptop/hardware-configuration.nix
```

7. remove '/mnt/etc/nixos/Flakes/.git'

```bash
rm -rf .git
```

8. Perform install

```bash
nixos-install --no-root-passwd --flake .#laptop
```

9. Reboot

```bash
reboot
```

10. Enjoy it!

## Cleanup

After successfully installed and booted into Hyprland, it is advisable to move the flake configs to your home folder so you don't have to edit in with sudo rights.

```bash
cp /etc/nixos/Flakes/ ~/Flakes
```

After making your changes all you need is in the root folder of configs

```bash
sudo nixos-rebuild switch --flake .#laptop
```
