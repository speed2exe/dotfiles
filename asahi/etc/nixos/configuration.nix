{ config, pkgs, libs, inputs, system, ... }:

# # if require from unstable
# let
#   unstablePkgs = import inputs.unstable {};
# in
{
  imports =
    [ # Hardware
      /etc/nixos/hardware-configuration.nix
      # Apple Silicon Support
      /etc/nixos/apple-silicon-support
    ];

  # Boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.kernelPackages = pkgs.linuxPackages_latest;

  # Network
  networking.networkmanager.enable = true;

  # Time zone
  time.timeZone = "Asia/Singapore";

  # Internationalisation
  i18n.defaultLocale = "en_US.UTF-8";

  virtualisation.docker = {
    enable = true;
  };

  # Users
  users.users.zack2827 = {
    isNormalUser = true;
    home = "/home/zack2827";
    extraGroups = [
      "wheel"
      "docker"
      # "libvirtd"
    ];
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
    nerd-fonts.iosevka-term
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
    brightnessctl
    dracula-theme dracula-icon-theme
    dunst pinta firefoxpwa
    # gpu-screen-recorder-gtk
    ## Terminal
    starship fortune fzf btop
    alacritty bat git fzf eza
    wget fd ripgrep procs st
    gh killall gcc gnumake tree
    tmux glib luarocks neovim
    ## X11
    xclip sxhkd polybar rofi
    nitrogen lxappearance
    maim xdotool picom
    # ## Wayland
    # rofi-wayland
    # wl-clipboard
    # grim slurp hyprpaper

    # Flakes
    # inputs.persway.packages.${system}.default

    # # Virtualisation
    # virt-manager
    # virt-viewer
    # spice
    # spice-gtk
    # spice-protocol
    # win-virtio
    # win-spice
  ];

  # virtualisation = {
  #   libvirtd = {
  #     enable = true;
  #     qemu = {
  #       package = pkgs.qemu_kvm;
  #       swtpm.enable = true;
  #       ovmf.enable = true;
  #       ovmf.packages = [ pkgs.OVMFFull.fd ];
  #     };
  #   };
  #   spiceUSBRedirection.enable = true;
  # };
  # programs.virt-manager.enable = true;
  # services.spice-vdagentd.enable = true;

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
  # environment.variables.WLR_NO_HARDWARE_CURSORS = "1";
  # environment.variables.NIXOS_OZONE_WL = "1";

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
