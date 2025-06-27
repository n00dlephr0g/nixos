# /etc/nixos/modules/programs.nix

{ config, pkgs, lib, ... }:

{
environment.systemPackages = with pkgs; [
    # --- System ---
    git
    # for bootstrapping other user configs:
    chezmoi
    btop # System monitor
    # Add other general utilities here
    wget
    curl
    htop # Another system monitor, if you want both
    tmux # Terminal multiplexer, good for system-wide availability
    gpg

    # --- Utilities ---
    kitty                   # Terminal emulator
    tmux                    # Terminal multiplexer
    ranger                  # File manager
    qutebrowser             # Web browser
    neovim                  # Editor
    feh                     # Image viewer / wallpaper setter (Xorg, but useful for quick viewing)
    grim                    # Screenshot tool (Wayland)
    slurp                   # Region selection for grim (Wayland)
    vlc                     # Video player
    rmpc
    wl-clipboard            # Wayland clipboard utilities
    zip                     # Archive utilities
    unzip
    unrar
    tar
    p7zip                   # Add p7zip for more archive formats
    zathura-with-plugins    # PDF viewer (minimalist, Vim-like)
    cliphist                # Clipboard history for Wayland
    python3
    blueberry

    # --- System Tools / Monitors ---
    btop                    # Modern system monitor (you already had this)
    # nload, iftop, bandwhich (for network monitoring, if desired)
    # ncdu, duf (for disk usage, if desired)

    # --- Desktop Utilities ---
    swww                    # Wallpaper setter for Wayland (you already had this)
    waybar                  # Status bar for Wayland (highly recommended for Hyprland)
    wofi                    # Application launcher for Wayland
    # You mentioned pywal - you'll install it here, but its actual *usage*
    # (running it to set colors) will be part of your Hyprland/user startup via chezmoi.
    pywal

];

# Some programs have specific NixOS module options for system-wide configuration.
# For example, if you want system-wide Neovim plugins or default configurations.
# However, for Neovim especially, many users prefer to manage plugins
# and specific config via their dotfiles (chezmoi).
# programs.neovim = {
#   enable = true;
#   # You could add global plugins here, but it's often more flexible with chezmoi.
#   # plugins = with pkgs.vimPlugins; [ ];
# };

# Configuration for your shells (e.g., Zsh plugins) will be managed by chezmoi.
    programs.zsh = {
    enable = true; # Ensure Zsh itself is enabled
    # Ensure this list is where you want to declare your plugins.
    # It will automatically source/integrate them.
    plugins = with pkgs; [
    zsh-autosuggestions
    zsh-syntax-highlighting
    powerlevel10k
    ]
};
}