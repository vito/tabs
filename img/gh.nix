{ pkgs ? import <nixpkgs> { }
}:
pkgs.callPackage ./convertToOci.nix {
  image = pkgs.dockerTools.streamLayeredImage {
    name = "gh";
    contents = with pkgs; [
      busybox
      gh
    ];
    config = {
      Env = [
        "PATH=/bin"
        "SSL_CERT_FILE=${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
      ];
    };
  };
}
