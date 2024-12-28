{ config, lib, pkgs, ... }:

{
  imports = [
    <nixos-wsl/modules>
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";  # Ensure this is set to the correct default user

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    git
    curl
    lf
    wget
    vim
  ];

  # Default Editor
  environment.variables.EDITOR = "vim";

  # Default Shell
  programs.zsh.enable = true;

  users.users.nixos.shell = pkgs.zsh;

  system.stateVersion = "24.05";
}

