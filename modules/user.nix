# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bonesaw = {
    isNormalUser = true;
    description = "bonesaw";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };
}

