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
          version = "2026-05-20";

          src = fetchFromGitHub {
            owner = "maxsat-evaluations";
            repo = "benchmark-tools";
            rev = "f12cb03e88e76396672fee2c34fab7fdc8c4574a";
            hash = "sha256-VpglwK/YX7Z0FfHyvwsmvF+JRQsm9q0kQ+It6mLxat8=";
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
