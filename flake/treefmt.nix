{ inputs, ... }:
{
  imports = [
    inputs.treefmt-nix.flakeModule
  ];

  perSystem =
    { ... }:
    {
      treefmt = {
        settings.global.on-unmatched = "error";
        programs = {
          # Python
          black.enable = true;
          # Spellchecking
          typos.enable = true;
          # Nix
          deadnix.enable = true;
          nixfmt.enable = true;
          # Shell
          shellcheck = {
            enable = true;
            excludes = [ ".envrc" ];
          };
          shfmt.enable = true;
          # Sorting lists
          keep-sorted.enable = true;
        };
      };
    };
}
