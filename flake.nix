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
          luksSwapName = "luks-ef2ad09c-28f3-4a3a-bc7c-befb427813dc";
          luksNixosName = "luks-bedfe9b4-21ef-485d-bd21-c5a049e0cdaa";
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
      nixos-x11 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          hostName = "nixos-x11";
          luksSwapName = "luks-ef2ad09c-28f3-4a3a-bc7c-befb427813dc";
          luksNixosName = "luks-bedfe9b4-21ef-485d-bd21-c5a049e0cdaa";
        };
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.lenovo-thinkpad-x11
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