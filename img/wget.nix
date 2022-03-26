{ pkgs ? import <nixpkgs> { }
}:
pkgs.callPackage ./convertToOci.nix {
  image = pkgs.dockerTools.streamLayeredImage {
    name = "wget";
    contents = with pkgs; [
      wget
    ];
    config = {
      Env = [
        "PATH=/bin"
        "SSL_CERT_FILE=${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
      ];
    };
  };
}
