# /etc/nixos/modules/desktop.nix

{ config, pkgs, lib, ... }:

{
    # Enable a graphical environment (X server is not directly used by Wayland,
    # but some applications still rely on XWayland, which this enables)
    services.xserver.enable = true;
    services.xserver.exportConfiguration = true; # Good for some apps

    # Enable Wayland support globally
    # This is usually implicitly handled by Hyprland, but good to be explicit
    # programs.sway.enable = true; # Not Hyprland, but example for Wayland compositor

    # Hyprland setup
    programs.hyprland = {
        enable = true;
        # It's highly recommended to manage Hyprland with Home Manager for per-user configs.
        # If you put this here, it's system-wide.
        # Refer to Hyprland's NixOS module options for full configuration.
        # e.g., programs.hyprland.settings = { ... };
    };

    # Set default terminal for programs (Hyprland will likely pick this up)
    environment.sessionVariables.TERMINAL = "kitty";
}