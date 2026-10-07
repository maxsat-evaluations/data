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
            version = "5.3.2";

            src = fetchFromGitHub {
              owner = "Udopia";
              repo = "gbd";
              tag = "gbd-tools-${finalAttrs.version}";
              hash = "sha256-sxD22504ZS/PmhLBjjK5FGyIgi2zK+LUxwbi0h0YBDw=";
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
            version = "0.4.3";

            src = fetchFromGitHub {
              owner = "Udopia";
              repo = "gbdc";
              rev = "9f3a418c47bc4ecef9f940a39db2752a456632b7";
              hash = "sha256-UBVoxT8UkMmklJu4CTjEYkG4460SdV5H5RI8zgjP7pA=";
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
            version = "0.4.3";

            src = fetchFromGitHub {
              owner = "Udopia";
              repo = "gbdc";
              rev = "9f3a418c47bc4ecef9f940a39db2752a456632b7";
              hash = "sha256-UBVoxT8UkMmklJu4CTjEYkG4460SdV5H5RI8zgjP7pA=";
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
