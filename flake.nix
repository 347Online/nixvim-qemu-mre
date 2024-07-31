{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  } @ inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem rec {
      specialArgs = {
        inherit inputs;
        system = "x86_64-linux";
      };
      modules = [
        ./configuration.nix
      ];
    };
  };
}
