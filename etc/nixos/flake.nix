{

  inputs = {
    # nixpkgs.url = "https://github.com/NixOS/nixpkgs/archive/nixos-24.05.tar.gz";
    nixpkgs.url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
    unstable.url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
    # persway.url = "https://github.com/johnae/persway/archive/main.tar.gz";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; inherit system; };
        modules = [ ./configuration.nix ];
      };
    };

}
