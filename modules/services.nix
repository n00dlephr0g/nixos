# /etc/nixos/modules/services.nix

{ config, pkgs, lib, ... }:

{
    # PipeWire (modern sound server, replaces PulseAudio and JACK)
    # Highly recommended for a modern desktop
    services.pipewire = {
        enable = true;
        alsa.enable = true; # ALSA compatibility
        alsa.support32Bit = true; # For 32-bit applications that use ALSA
        pulse.enable = true; # PulseAudio compatibility (important for most apps)
        # wireplumber.enable = true; # The session manager for PipeWire (default, often implicitly enabled)
        # jack.enable = true; # If you need JACK applications for pro audio
    };

    # RealtimeKit (recommended for PipeWire to ensure low-latency audio)
    security.rtkit.enable = true;

    # CUPS (Common Unix Printing System) for printing
    services.printing.enable = true;

    # Display Manager (for graphical login)
    # SDDM is a good choice for Hyprland due to its Wayland-friendliness.
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true; # Enable Wayland support for SDDM
        # theme = "sddm-nordic-theme"; # Example, you'd need to add the package
    };

    # XDG Desktop Portal for Hyprland
    # Essential for screen sharing, screenshots, file pickers etc. on Wayland
    xdg.portal = {
        enable = true;
        wlr.enable = true; # For wlroots-based compositors like Hyprland
        extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; # For GTK apps (e.g., Firefox file picker)
        # For Hyprland specific portal (highly recommended for better integration):
        # Enable xdg-desktop-portal-hyprland if you're using flakes/unstable
        # You'll likely enable this within your Hyprland configuration or users.nix if using Home Manager
    };


    # Notifications daemon (essential for a functioning desktop)
    services.udev.enable = true;
    # mako is a good choice for Wayland
    services.mako.enable = true;

    # Use a network manager applet (optional, if you prefer a GUI in your bar)
    # environment.systemPackages = with pkgs; [
    #   networkmanagerapplet # For nm-applet, often used with Waybar
    # ];
}