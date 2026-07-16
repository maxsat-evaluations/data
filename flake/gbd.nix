{
  perSystem =
    { pkgs, self', ... }:
    {
      packages = {
        gbd = pkgs.python3Packages.callPackage (
          {
            python,
            fetchFromGitHub,
            setuptools,
            wheel,
            gbdc,
          }:
          python.pkgs.buildPythonPackage (finalAttrs: {
            pname = "gbd";
            version = "5.2.0";

            src = fetchFromGitHub {
              owner = "Udopia";
              repo = "gbd";
              tag = "gbd-tools-${finalAttrs.version}";
              hash = "sha256-bk4FAHybB9CKZJO9nTj1dJ6ERY7gNS2viG6pG/sGQWo=";
            };

            pyproject = true;

            build-system = [
              setuptools
              wheel
            ];

            propagatedBuildInputs = with python.pkgs; [
              flask
              tatsu
              polars
              waitress
              pebble
              gbdc
              ipython
            ];

            pythonImportsCheck = [
              "gbd"
              "gbd_core"
              "gbd_init"
              "gbd_server"
            ];

            postCheck = ''
              python -m unittest
            '';
          })
        ) { inherit (self'.packages) gbdc; };

        gbdc = pkgs.python3Packages.callPackage (
          {
            fetchFromGitHub,
            python,
            libarchive,
            cadical,
            pybind11,
            cmake,
            scikit-build-core,
            ninja,
          }:
          python.pkgs.buildPythonPackage (finalAttrs: {
            pname = "gbdc";
            version = "0.4.0";

            src = fetchFromGitHub {
              owner = "Udopia";
              repo = "gbdc";
              tag = "gbdc-${finalAttrs.version}";
              hash = "sha256-IxnuWgz8wUhXkD3pKBF8RF/i9engSVTaGv01hhNzR6w=";
            };

            patches = [ ./gbdc-cmake-system-cadical.patch ];

            pyproject = true;
            dontUseCmakeConfigure = true;

            build-system = [
              pybind11
              cmake
              scikit-build-core
              ninja
            ];

            buildInputs = [
              libarchive
              cadical
            ];
          })
        ) { };

        gbdc-tool = pkgs.callPackage (
          {
            stdenv,
            fetchFromGitHub,
            libarchive,
            cadical,
            cmake,
            python3,
          }:
          stdenv.mkDerivation (finalAttrs: {
            pname = "gbdc";
            version = "0.4.0";

            src = fetchFromGitHub {
              owner = "Udopia";
              repo = "gbdc";
              tag = "gbdc-${finalAttrs.version}";
              hash = "sha256-IxnuWgz8wUhXkD3pKBF8RF/i9engSVTaGv01hhNzR6w=";
            };

            patches = [ ./gbdc-cmake-system-cadical.patch ];

            postPatch = ''
              substituteInPlace CMakeLists.txt \
                --replace-fail 'install(TARGETS gbdc DESTINATION .)' "install(TARGETS gbdctool DESTINATION $out/bin/)"
            '';

            nativeBuildInputs = [
              cmake
              (python3.withPackages (python-pkgs: with python-pkgs; [ pybind11 ]))
            ];

            buildInputs = [
              libarchive
              cadical
            ];
          })
        ) { };
      };
    };
}
