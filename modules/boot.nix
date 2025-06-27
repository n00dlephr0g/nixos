# /etc/nixos/modules/boot.nix

{ config, pkgs, lib, ... }:

{
    # Enable GRUB bootloader
    boot.loader.systemd-boot.enable = true

    # Enable the default Linux kernel
    boot.kernelPackages = pkgs.linuxPackages_latest; # Or pkgs.linuxPackages for default

    # Enable or disable microcode updates (recommended for Intel/AMD)
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    # Filesystems (if not managed by hardware-configuration.nix, e.g., for ZFS/Btrfs)
    # fileSystems."/".options = [ "noatime" "compress=zstd" ]; # Example for Btrfs

    # If you have an NVIDIA GPU, you'd configure it here:
    # services.xserver.videoDrivers = [ "nvidia" ];
    # hardware.nvidia.powerManagement.enable = true; # Example
    # hardware.nvidia.prime.sync.enable = true; # Example for laptops with integrated + dedicated GPU
}