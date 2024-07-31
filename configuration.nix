{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "Arukenia";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  users.users.katie = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    packages = with pkgs; [
      firefox
      alejandra
    ];
  };

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-users = ["katie" "root"];
  };

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
  ];

  services.openssh.enable = true;

  system.stateVersion = "24.05";
}
