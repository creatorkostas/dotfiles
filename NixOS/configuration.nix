# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
    
  
	  boot.loader = {
	  efi = {
	    canTouchEfiVariables = true;
	    efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
	  };
	  grub = {
	     efiSupport = true;
	     #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
	     device = "nodev";
	  };
	};

  services.power-profiles-daemon.enable = true;
  #powerManagement.enable = true;
  #services.thermald.enable = true;
  /*
  services.tlp = {
    
    enable = true;
    settings = {
      TLP_DEFAULT_MODE = "BAT";
    
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      CPU_HWP_DYN_BOOST_ON_AC = 1;
      CPU_HWP_DYN_BOOST_ON_BAT = 0;
      
      

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;
      
      MEM_SLEEP_ON_AC = "s2idle";
      MEM_SLEEP_ON_BAT = "deep";

      #Optional helps save long term battery health
      #START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
      #STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

      };
  };
  */
  networking.hostName = "MokiaLaptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Athens";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "el_GR.UTF-8";
    LC_IDENTIFICATION = "el_GR.UTF-8";
    LC_MEASUREMENT = "el_GR.UTF-8";
    LC_MONETARY = "el_GR.UTF-8";
    LC_NAME = "el_GR.UTF-8";
    LC_NUMERIC = "el_GR.UTF-8";
    LC_PAPER = "el_GR.UTF-8";
    LC_TELEPHONE = "el_GR.UTF-8";
    LC_TIME = "el_GR.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  hardware.pulseaudio.support32Bit = true;
  

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kostas = {
    isNormalUser = true;
    description = "kostas";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    packages = with pkgs; [
      firefox
      mpv
      bitwarden
      stremio
      zoom-us
      teamviewer
      spotify
      tor-browser
      teams-for-linux
      gnome.gnome-boxes
      thunderbird
      android-studio
      tree
      vimPlugins.packer-nvim
      luajit
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  
  
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  wget
  neovim
  nano
  htop
  btop
  ranger  
  git
  vscode
  netbeans
  zsh
  gnome.gnome-tweaks
  syncthing
  sqlitebrowser
  bleachbit
  stacer
  gnome.dconf-editor
  hyprland-protocols
  lls
  libreoffice
  direnv
  cargo
  gnumake #make
  gcc
  docker-compose
  rofi
  hyprpaper
  waybar
  killall
  cliphist
  dunst
  font-awesome
  font-awesome_4
  font-awesome_5
  nerdfonts
  cmake
  pamixer
  pulseaudioFull
  openjdk11-bootstrap
  maven
  python3
  python3Packages.virtualenv
  python3Packages.pyyaml
  python3Packages.pyserial
  python3Packages.cobs
  python311Packages.pip
  brightnessctl
  wl-clipboard
  alsa-utils
  piper-tts
  tgpt
  tmux
  yt-dlp
  yewtube
  alacritty
  neofetch
  ffmpeg
  nodejs_21
  firebase-tools
  jetbrains.clion
  conan
  gcc-arm-embedded-13
  openocd
  minicom
  sam-ba
  gh
  gitlab-runner
  appimage-run
  libthai
  ];
  
  #enableDefaultFonts = true;
  virtualisation.docker.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  services.flatpak.enable = true;
  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
  };
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
