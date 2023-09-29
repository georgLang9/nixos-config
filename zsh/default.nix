{
  pkgs,
  config,
  ...
}: {
    programs.zsh = {
        enable = true;
        autocd = true;

        dotDir = ".config/zsh";

        enableCompletion = true;
        enableAutosuggestions = true;
        syntaxHighlighting = {
            enable = true;
        };

        oh-my-zsh = {
            enable = true;
            plugins = [ "git" "sudo" "fzf"];

            #TODO: Install and enable powerlevel10k for oh my zsh
            theme = "robbyrussell";
        };

        initExtra = ''
            # Enables command auto-correction
            ENABLE_CORRECTION="true"

            # No bell: Shut up Zsh
            unsetopt beep
        '';
    };

    programs.fzf = {
        enable = true;
        enableZshIntegration = true;
    };
}