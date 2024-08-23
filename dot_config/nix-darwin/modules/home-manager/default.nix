{ pkgs, ... }: {
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "24.05";

  # Install programs for current user
  home.packages = with pkgs; [
    _1password
    awscli
    bat
    bazelisk
    btop
    buildifier
    chezmoi
    cmake
    commitlint
    diff-so-fancy
    ffmpeg
    fzf
    gh
    git-lfs
    go-task
    go_1_23
    k9s
    kubectx
    lazygit
    neofetch
    neovim
    nixfmt-classic
    reattach-to-user-namespace
    ripgrep
    rustup
    tilt
    tldr
    wget
    yt-dlp
  ];

  home.sessionPath = [ "/run/current-system/sw/bin" "$HOME/.nix-profile/bin" ];

  home.username = "marmos91";
  home.homeDirectory = "/Users/marmos91";

  home.sessionVariables = {
    EDITOR = "nvim";
    PAGER = "diff-so-fancy";
  };

  programs = {
    eza.enable = true;
    git.enable = true;
    home-manager.enable = true;
  };
}
