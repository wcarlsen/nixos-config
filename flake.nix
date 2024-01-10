{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    org-babel.url = "github:emacs-twist/org-babel";
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, unstable, emacs-overlay, org-babel, ... }:
    let
      system = "x86_64-linux";
      hm = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.wcarlsen = import ./home/home.nix;
        home-manager.extraSpecialArgs = { inherit unstable system emacs-overlay org-babel; };
      };
    in
    {
      nixosConfigurations = {
        nixos-t480 = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            hostName = "nixos-t480";
          };
          modules = [
            ./system/t480/configuration.nix
            nixos-hardware.nixosModules.lenovo-thinkpad-t480
            nixos-hardware.nixosModules.common-gpu-nvidia
            nixos-hardware.nixosModules.common-pc-laptop
            home-manager.nixosModules.home-manager
            hm
          ];
        };
        nixos-x1 = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            hostName = "nixos-x1";
          };
          modules = [
            ./system/x1/configuration.nix
            nixos-hardware.nixosModules.lenovo-thinkpad-x1-9th-gen
            nixos-hardware.nixosModules.common-pc-laptop
            home-manager.nixosModules.home-manager
            hm
          ];
        };
        nixos-surface = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            hostName = "nixos-surface";
          };
          modules = [
            ./system/surface/configuration.nix
            nixos-hardware.nixosModules.microsoft-surface-pro-intel
            nixos-hardware.nixosModules.common-pc-laptop
            home-manager.nixosModules.home-manager
            hm
          ];
        };
      };
    };
}
