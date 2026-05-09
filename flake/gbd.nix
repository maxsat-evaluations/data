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
            version = "5.0.1";

            src = fetchFromGitHub {
              owner = "Udopia";
              repo = "gbd";
              tag = "gbd-tools-${finalAttrs.version}";
              hash = "sha256-Wpj/D1MAQcR8hXfc1KJv9MX0RdRR6vlKvi/alk1c1Tg=";
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
          python.pkgs.buildPythonPackage {
            pname = "gbdc";
            version = "0.3.5";

            src = fetchFromGitHub {
              owner = "Udopia";
              repo = "gbdc";
              rev = "d03875b98d3062fec717c231975a4fb5e2ebe551";
              hash = "sha256-jbktIZqUZ334Ts3uKiQ2gb0g5QP44E84OfHmZqtzUE4=";
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
          }
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
          stdenv.mkDerivation {
            pname = "gbdc";
            version = "0.3.5";

            src = fetchFromGitHub {
              owner = "Udopia";
              repo = "gbdc";
              rev = "d03875b98d3062fec717c231975a4fb5e2ebe551";
              hash = "sha256-jbktIZqUZ334Ts3uKiQ2gb0g5QP44E84OfHmZqtzUE4=";
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
          }
        ) { };
      };
    };
}
