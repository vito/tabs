{
  description = "a flake for the images needed by tabs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { self
    , nixpkgs
    }: { };
}
