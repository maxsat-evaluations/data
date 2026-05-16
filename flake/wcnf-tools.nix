{
  perSystem =
    { pkgs, ... }:
    {
      packages.wcnf-tools = pkgs.callPackage (
        {
          stdenv,
          fetchFromGitHub,
          cmake,
          pkg-config,
          zlib,
        }:
        stdenv.mkDerivation {
          pname = "wcnf-tools";
          version = "2022-02-07";

          src = fetchFromGitHub {
            owner = "maxsat-evaluations";
            repo = "benchmark-tools";
            rev = "cab3af33d6d60d09a90028bed250b15c9813bb92";
            hash = "sha256-dvoLsXwsR0tszT2SOEBJ3yAUcBzLimTIAmQ6lCm0Alo=";
          };

          nativeBuildInputs = [
            cmake
            pkg-config
          ];

          buildInputs = [
            stdenv.cc.libc.static
            zlib.dev
            zlib.static
          ];

          postInstall = ''
            mkdir -p $out/bin/
            cp ../bin/* $out/bin/
          '';
        }
      ) { };
    };
}
