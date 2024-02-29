{ config, pkgs, ... }:

{
  # TODO please change the username & home directory to your own
  home.username = "kostas";
  home.homeDirectory = "/home/kostas";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';



  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [

  ];


  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  programs.neovim = {
    enable = true;
    #plugins = [
    #  {
    #    plugin = pkgs.vimPlugins.packer-nvim;
    #    config = ''
    #      
    #    '';
    #  }
    #];
    extraConfig = ''
    '';
    #  source ~/.config/nvim/main.lua
    #'';
    #extraConfig = ''
    #  set number relativenumber
    #'';
  };

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

}
