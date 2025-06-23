{lib, ...}: let
  inherit (lib.meta) getExe;
in {
  perSystem = {config, ...}: {
    apps = {
      default.program = getExe config.packages.default;
    };
  };
}
