# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  # Change default shell, not doable with home-manager
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  # Many programs look at /etc/shells to determine if a user is a "normal" user and not a "system" user.
  # Therefore it is recommended to add the user shells to this list:
  environment.shells = with pkgs; [ zsh ];
  environment.pathsToLink = [ "/share/zsh" ]; # Enable completion for system packages (e.g. systemd)
}
