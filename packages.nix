{
  inputs,
  self,
  ...
} @ args: {
  perSystem = {
    config,
    system,
    pkgs,
    lib,
    ...
  }: let
    # Create nixpkgs with unfree allowed for nvf
    pkgsUnfree = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
      # Or be more specific:
      # config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
      #   "intelephense"
      # ];
    };
  in {
    packages = {
      laravel-nvim = pkgs.callPackage ./pkgs/laravel-nvim.nix {};
      neotest-pest = pkgs.callPackage ./pkgs/neotest-pest.nix {};

      default =
        (inputs.nvf.lib.neovimConfiguration {
          pkgs = pkgsUnfree;
          modules = [
            {
              # Pass the custom packages to the nvf configuration
              _module.args = {
                inherit (config.packages) laravel-nvim neotest-pest;
              };
            }
            ./config
          ];
        })
        .neovim;
    };
  };
}
