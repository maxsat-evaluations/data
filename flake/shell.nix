{ inputs, ... }: {
  perSystem =
    {
      pkgs,
      self',
      system,
      ...
    }:
    {
      devShells.default = pkgs.mkShell {
        nativeBuildInputs =
          with pkgs;
          [
            # keep-sorted start
            inputs.wcnf-tools.packages.${system}.default
            jq
            kissat
            self'.packages.gbd
            self'.packages.gbdc-tool
            self'.packages.nushell
            unzip
            xz
            zip
            # keep-sorted end
          ]
          ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux [ self'.packages.runsolver ];

        shellHook = ''
          export PATH="''${PATH:+$PATH:}scripts"
          if [ -z "$LOCAL_DB" ]; then
            export GBD=gbd.toml
          else
            ${pkgs.lib.getExe' pkgs.yq "tomlq"} -t '.databases.paths |= ["'"$LOCAL_DB"'"] + .' gbd.toml > patched-gbd.toml
            export GBD=patched-gbd.toml
          fi
        '';
      };
    };
}
