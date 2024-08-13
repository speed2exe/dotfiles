{ config, pkgs, libs, inputs, system, ... }:

{
  imports =
    [ # Hardware
      /etc/nixos/hardware-configuration.nix
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

  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    nativeMessagingHosts.packages = [ pkgs.firefoxpwa ];
  };

  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Nix
    home-manager

    ## Desktop
    brightnessctl rofi-wayland
    dracula-theme dracula-icon-theme
    dunst pinta firefoxpwa
    gpu-screen-recorder-gtk
    ## Terminal
    starship fortune fzf btop
    alacritty bat git fzf eza
    wget fd ripgrep procs
    gh killall gcc gnumake tree
    tmux glib neovim delta
    ## X11
    xclip sxhkd polybar
    nitrogen lxappearance
    maim xdotool picom
    # ## Wayland
    # wl-clipboard
    # grim slurp hyprpaper

    # flakes
    # inputs.persway.packages.${system}.default
  ];

  # https://github.com/Mic92/nix-ld
  programs.nix-ld.enable = true;

  # zram
  zramSwap.enable = true;

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

  # # Hyprland
  # programs.hyprland = {
  #   enable = true;
  #   xwayland.enable = true;
  # };
  # programs.waybar.enable = true;

  # # GPG sign
  # programs.gnupg.agent = {
  #    enable = true;
  #    pinentryFlavor = "tty"; # export GPG_TTY=$(tty)
  #    enableSSHSupport = true;
  # };

  # Environment
  environment.variables.EDITOR = "nvim";
  # environment.variables.WLR_NO_HARDWARE_CURSORS = "1";
  # environment.variables.NIXOS_OZONE_WL = "1";

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
