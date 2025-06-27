# /etc/nixos/configuration.nix

{ config, pkgs, lib, ... }:

{
    # Import the generated hardware configuration.
    # This file contains settings specific to your machine's hardware.
    imports = [
        ./hardware-configuration.nix
        ./modules/boot.nix
        ./modules/networking.nix
        ./modules/services.nix
        ./modules/desktop.nix
        ./modules/programs.nix
        ./modules/users.nix
    ];

    # You can still set global options here if they don't fit naturally
    # into a specific module, or if you prefer them at the top level.

    # Example: System-wide locale
    i18n.defaultLocale = "en_AU.UTF-8"; # As you're in Australia

    # Enable flake support if you plan to use flakes for your configuration
    # (Highly recommended for modern NixOS setups and easier dependency management).
    # You'd typically enable this in an existing setup.
    # nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Auto-upgrade Nix packages (optional, typically for a rolling release feel)
    # system.autoUpgrade.enable = true;
    # system.autoUpgrade.allowReboot = false; # Set to true if you want automatic reboots

    # Set your time zone (Australia/Melbourne as an example)
    time.timeZone = "Australia/Melbourne";

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # are chosen. It is highly recommended to set this to the NixOS
    # release you're currently running. Use the command `nixos-version`
    # to find your current NixOS release.
    system.stateVersion = "24.05"; # Replace with your actual NixOS version

    # Hostname
    networking.hostName = "nixos-desktop"; # Set your desired hostname

    # Enable `sudo` for the 'wheel' group (which your user is in)
    security.sudo.wheelNeedsPassword = true;
}