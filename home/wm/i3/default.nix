{ pkgs, ... }: {
  xsession.windowManager.i3 = {
    enable = true;

    extraPackages = with pkgs; [
    ];

    config = {
      fonts = [ "ComicShannsMono"];
    };

  };

  packages = with pkgs; [
    dmenu
    i3status
    i3lock
  ];

  services.picom.enable = true;
} 
