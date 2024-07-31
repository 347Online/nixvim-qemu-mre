{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixvim,
    nixpkgs,
  } @ inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem rec {
      specialArgs = {
        inherit inputs;
        system = "x86_64-linux";
      };
      modules = [
        nixvim.nixosModules.nixvim
        ./configuration.nix
      ];
    };
  };
}
