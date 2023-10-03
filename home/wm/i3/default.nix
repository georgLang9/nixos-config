{ pkgs, ... }: {
  xsession.windowManager.i3 = {
    enable = true;

    config = {
      fonts = [ "ComicShannsMono"];
    };

  };

  home.file.".config/i3/config" = ./config;

  home.packages = with pkgs; [
    dmenu
    i3status
    i3lock
  ];

  services.picom.enable = true;
} 
