{
  perSystem =
    { pkgs, ... }:
    {
      packages.nushell = pkgs.stdenvNoCC.mkDerivation {
        name = "nushell-with-plugins";

        src = pkgs.nushell;

        buildInputs = [
          pkgs.makeWrapper
        ];

        installPhase = ''
          mkdir -p $out/bin/

          makeWrapper ${pkgs.lib.getExe pkgs.nushell} $out/bin/nu \
            --add-flags "--plugins ${pkgs.lib.getExe pkgs.nushellPlugins.query}"
        '';
      };
    };
}
