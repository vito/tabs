{ pkgs ? import <nixpkgs> { }
}:
let
  stream = pkgs.dockerTools.streamLayeredImage {
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
in
pkgs.runCommand "write-docker-tar" {} ''
  ${stream} > $out
''
