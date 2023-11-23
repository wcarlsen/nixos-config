{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # emacs-overlay.url = "github:nix-community/emacs-overlay";
    # org-babel.url = "github:emacs-twist/org-babel";
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
            ./configuration.nix
            nixos-hardware.nixosModules.lenovo-thinkpad-t480
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
            ./configuration.nix
            nixos-hardware.nixosModules.lenovo-thinkpad-x1
            home-manager.nixosModules.home-manager
            hm
          ];
        };
      };
    };
}
