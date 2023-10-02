{ ... }:

{
  imports = [
    ./wezterm
    ./zsh
  ];

  home.sessionVariables = {
    # set default applications
    EDITOR = "lvim";
    BROWSER = "firefox";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];
}
