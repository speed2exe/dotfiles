{ config, pkgs, libs, inputs, system, ... }:

{
  imports =
    [ # Hardware
      ./hardware-configuration.nix
    ];

  # Boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Network
  networking.networkmanager.enable = true;

  # Time zone
  time.timeZone = "Asia/Singapore";

  # Internationalisation
  i18n.defaultLocale = "en_US.UTF-8";

  # Users
  users.users.zack2827 = {
    isNormalUser = true;
    home = "/home/zack2827";
    extraGroups = [ "wheel" ];
  };

  # X11
  services.xserver = {
    enable = true;
    autorun = false;
    displayManager.startx.enable = true;
    windowManager.bspwm.enable = true;
  };

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "IosevkaTerm" ]; })
    jost
  ];

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [

    # Nix
    home-manager

    ## Desktop
    xclip maim pinta xdotool picom
    sxhkd brightnessctl polybar
    # rofi
    rofi-wayland
    dracula-theme dracula-icon-theme
    lxappearance dunst nitrogen
    microsoft-edge firefox
    ## Terminal
    starship fortune fzf btop
    alacritty bat git fzf eza
    wget fd ripgrep procs
    gh killall gcc gnumake tree
    tmux glib neovim
    # Wayland
    wl-clipboard

    # flakes
    inputs.persway.packages.${system}.default
  ];

  # https://github.com/Mic92/nix-ld
  programs.nix-ld.enable = true;

  # https://nixos.wiki/wiki/Thunar
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-media-tags-plugin
    thunar-volman
  ];
  services.gvfs.enable = true;
  services.tumbler.enable = true;

  # direnv
  programs.direnv.enable = true;

  programs.waybar.enable = true;
  environment.variables.WLR_NO_HARDWARE_CURSORS = "1";
  environment.variables.NIXOS_OZONE_WL = "1";

  # SwayWM
  programs.sway = {
    enable = true;
    xwayland.enable = true;
  };

  # # GPG sign
  # programs.gnupg.agent = {
  #    enable = true;
  #    pinentryFlavor = "tty"; # export GPG_TTY=$(tty)
  #    enableSSHSupport = true;
  # };

  # Environment
  environment.variables.EDITOR = "nvim";

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
