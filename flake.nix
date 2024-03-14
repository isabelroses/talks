{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {nixpkgs, ...}: let
    systems = ["aarch64-darwin" "aarch64-linux" "x86_64-darwin" "x86_64-linux"];
    forAllSystems = fn: nixpkgs.lib.genAttrs systems (system: fn nixpkgs.legacyPackages.${system});
  in {
    devShells = forAllSystems (pkgs: {default = import ./shell.nix {inherit pkgs;};});

    formatter = forAllSystems (pkgs: pkgs.alejandra);
  };
}
