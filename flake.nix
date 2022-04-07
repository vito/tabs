{
  description = "a flake for the images needed by tabs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    rec {
      packages.x86_64-linux.gh = pkgs.callPackage ./img/gh.nix { };
      packages.x86_64-linux.wget = pkgs.callPackage ./img/wget.nix { };
    };
}
