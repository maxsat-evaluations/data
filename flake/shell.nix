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
          # keep-sorted end
        ];

        GBD_DB = "wcnf_meta.db:wcnf_base.db";
        shellHook = ''
          export PATH="''${PATH:+$PATH:}scripts"
        '';
      };
    };
}
