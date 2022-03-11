{ pkgs ? import <nixpkgs> { }
}:
pkgs.callPackage ./oci.nix {
  image = pkgs.dockerTools.streamLayeredImage {
    name = "gh";
    contents = with pkgs; [
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
