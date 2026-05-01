{
  perSystem =
    { pkgs, ... }:
    {
      packages.wcnf-tools = pkgs.callPackage (
        {
          stdenv,
          fetchFromBitbucket,
          cmake,
          pkg-config,
          zlib,
        }:
        stdenv.mkDerivation {
          pname = "wcnf-tools";
          version = "2022-02-07";

          src = fetchFromBitbucket {
            owner = "fbacchus";
            repo = "maxsat_benchmarks_code_base";
            rev = "e25bfbea2189ee348a0e304c8d2e695429f79537";
            hash = "sha256-SbNtVeeqfIUJzSTi0eHB6SUso9Lem1XSom2K5yo880E=";
          };

          # patchPhase = ''
          #   runHook prePatch

          #   substituteInPlace CMakeLists.txt \
          #     --replace-fail 'DESTINATION "''${CMAKE_SOURCE_DIR}/.."' "$out/bin"

          #   runHook postPatch
          # '';

          # preConfigure = ''
          #   echo "out = $out"
          #   mkdir -p $out/bin
          #   ls $out
          # '';

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
