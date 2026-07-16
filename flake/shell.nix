{
  perSystem =
    { pkgs, self', ... }:
    {
      devShells.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          # keep-sorted start
          jq
          kissat
          self'.packages.gbd
          self'.packages.gbdc-tool
          self'.packages.nushell
          self'.packages.runsolver
          self'.packages.wcnf-tools
          unzip
          xz
          zip
          # keep-sorted end
        ];

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
