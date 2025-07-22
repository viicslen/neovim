{lib, ...}: let
  inherit (lib.meta) getExe;
in {
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    apps = {
      default = {
        program = getExe config.packages.default;
        meta.description = "My personal Neovim configuration with NVF";
      };
      nom = {
        type = "app";
        program = getExe (pkgs.writeShellApplication {
          name = "nvf-launcher";
          runtimeInputs = [pkgs.nix-output-monitor];
          text = ''
            # Function to check if rebuild is needed
            needs_rebuild() {
              # Simple check - you could make this more sophisticated
              ! nix path-info github:viicslen/neovim >/dev/null 2>&1
            }

            # If we need to rebuild, use nom
            if needs_rebuild; then
              echo "Building/updating nvf-config with enhanced output..."
              nom build github:viicslen/neovim --no-link
            fi

            # Run neovim
            exec ${getExe config.packages.default} "$@"
          '';
        });
        meta.description = "Smart launcher for NVF Neovim configuration with nix-output-monitor";
      };
    };
  };
}
