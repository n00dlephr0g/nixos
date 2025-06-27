# /etc/nixos/modules/users.nix

{ config, pkgs, lib, ... }:

{
    # Define a user account.
    users.users.n00dlephr0g = { # Replace 'n00dlephr0g' with your actual username
        isNormalUser = true;
        extraGroups = [
        "wheel"      # Enable `sudo` for this user
        "networkmanager" # Allow user to manage NetworkManager connections
        "lp"         # Printer access
        "docker"     # If you install docker and want user in docker group
        ];
        # Add other groups as needed, e.g., "video", "audio", "input", "plugdev"
        # Set your home directory to automatically create if it doesn't exist
        # If you're using Home Manager, this is where it will apply user-specific configs.
        home = "/home/n00dlephr0g"; # Replace with your actual home directory
        shell = pkgs.zsh; # Set default shell to Zsh for this user
    };
}