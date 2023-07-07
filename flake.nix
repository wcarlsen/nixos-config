{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-23.05";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager }: {
    nixosConfigurations = {
      nixos-t480 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          hostName = "nixos-t480";
        };
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.lenovo-thinkpad-t480
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.wcarlsen = import ./home.nix;
          }
        ];
      };
      nixos-x1 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          hostName = "nixos-x1";
        };
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.lenovo-thinkpad-x1
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.wcarlsen = import ./home.nix;
          }
        ];
      };
    };
  };
}