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
  home.file.".config/nvim" = {
      source = ./lazyvim;
      recursive = true;
      executable = true;
  };

  home = {
    packages = with pkgs; [
      # Add LSP, DAP, linters and formatters here

      # C/C++
      gcc # c/c++ compiler, required by nvim-treesitter!
      llvmPackages.clang-unwrapped # c/c++ tools with clang-tools such as clangd
      cmake
      cmake-language-server
      gnumake

      #-- nix
      nil
      rnix-lsp
      # nixd
      statix # Lints and suggestions for the nix programming language
      deadnix # Find and remove unused code in .nix source files
      alejandra # Nix Code Formatter

      # lua
      stylua
      lua-language-server

      # python
      python3
      
      # javascript
      nodejs

      # rust
      cargo

      # misc
      tree-sitter

      # telescope
      fd
      ripgrep
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
