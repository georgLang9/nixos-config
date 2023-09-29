{
  pkgs,
  config,
  ...
}: {
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    withNodeJs = true;
    withPython3 = true;

    extraConfig = ''
      set number relativenumber
    '';
  };

  # config files 
  home.file.".config/neovim" = {
      source = ./config;
      recursive = true;
  };

  home = {
    packages = with pkgs; [
      # Add LSP, DAP, linters and formatters here

      # C/C++
      gcc # c/c++ compiler, required by nvim-treesitter!
      llvmPackages.clang-unwrapped # c/c++ tools with clang-tools such as clangd
      cmake
      cmake-language-server
    ]
    ++ (
      if pkgs.stdenv.isDarwin
      then []
      else [
        verible
      ]
    );
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}