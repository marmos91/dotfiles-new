{ pkgs, ... }: {
  # Create /etc/zshrc that loads the darwin environment.
  programs.zsh.enable = true; # default shell on catalina
  programs.fish.enable = true;

  users.users.marmos91.home = "/Users/marmos91";

  environment = {
    shells = with pkgs; [ bash zsh fish ];
    loginShell = pkgs.fish;

    # Install programs system wide
    systemPackages = with pkgs; [ coreutils curl git ];
    # Add homebrew path to PATH
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };

  # Make these defaults
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  fonts.packages =
    [ (pkgs.nerdfonts.override { fonts = [ "FiraCode" "Meslo" ]; }) ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  system.defaults = {
    finder.AppleShowAllExtensions = true;
    finder._FXShowPosixPathInTitle = true;
    finder.FXPreferredViewStyle = "clmv";
    finder.ShowStatusBar = true;

    dock.autohide = true;
    dock.orientation = "left";
    dock.persistent-apps = [
      "/Applications/Arc.app"
      "/System/Applications/Mail.app"
      "/System/Applications/Messages.app"
      "/Applications/Whatsapp.app"
      "/Applications/Telegram Desktop.app"
      "/Applications/Slack.app"
      "/Applications/Wezterm.app"
      "/Applications/Spotify.app"
      "/System/Applications/System Settings.app"
    ];
    dock.persistent-others = [ "/Users/marmos91/Downloads" "/Applications" ];
    dock.mru-spaces = false;
    dock.showhidden = true;
    dock.show-recents = false;
    # Icon size
    dock.tilesize = 42;

    NSGlobalDomain.AppleShowAllExtensions = true;

    # Make keyboard usable
    NSGlobalDomain.InitialKeyRepeat = 10;
    NSGlobalDomain.KeyRepeat = 1;

    # Expand save panel by default
    NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
    NSGlobalDomain.NSNavPanelExpandedStateForSaveMode2 = true;

    # Save on computer, not iCloud
    NSGlobalDomain.NSDocumentSaveNewDocumentsToCloud = false;

    # Disable smart quotes as they’re annoying when typing code
    NSGlobalDomain.NSAutomaticQuoteSubstitutionEnabled = false;

    # Disable automatic period substitution as it’s annoying when typing code
    NSGlobalDomain.NSAutomaticPeriodSubstitutionEnabled = false;

    # Disable automatic capitalization as it’s annoying when typing code
    NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;

    # Disable smart dashes as they’re annoying when typing code
    NSGlobalDomain.NSAutomaticDashSubstitutionEnabled = false;

    # Disable auto-correct
    NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;

    # Configure tracking speed (0 to 3)
    NSGlobalDomain."com.apple.trackpad.scaling" = 3.0;

    menuExtraClock.Show24Hour = true;

    # Disable click to show desktop (false means "Only in Stage Manager")
    WindowManager.EnableStandardClickToShowDesktop = false;

    # Trackpad
    trackpad.Clicking = true;
  };

  security.pam.enableSudoTouchIdAuth = true;

  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    masApps = { };
    casks = [
      "arc"
      "gpg-suite"
      "logi-options-plus"
      "nikitabobko/tap/aerospace"
      "raycast"
      "spotify"
      "telegram-desktop"
      "visual-studio-code"
      "wezterm"
    ];
    brews = [ "clang-format" "nvm" "tmux" "ibazel" "pinentry-mac" "helm" ];
  };
}
