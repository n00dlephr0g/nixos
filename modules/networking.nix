# /etc/nixos/modules/networking.nix

{ config, pkgs, lib, ... }:

{
    # Enable NetworkManager for easy network configuration (Wi-Fi, Ethernet, VPN)
    networking.networkmanager.enable = true;

    # You can optionally disable NetworkManager's internal DNS and set your own:
    # networking.networkmanager.dns = "none";
    # networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];

    # Firewall (recommended)
    networking.firewall.enable = true;
    # networking.firewall.allowedTCPPorts = [ 80 443 ]; # Example: allow web traffic

    # You might want to enable Avahi for local network service discovery (e.g., Chromecast)
    # services.avahi.enable = true;
    # services.avahi.publish.enable = true;

    # For Bluetooth
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true; # Power on Bluetooth at boot
}