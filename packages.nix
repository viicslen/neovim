{
  inputs,
  self,
  ...
} @ args: {
  perSystem = {
    config,
    pkgs,
    lib,
    ...
  }: {
    packages = {
      laravel-nvim = pkgs.callPackage ./pkgs/laravel-nvim.nix { };
      neotest-pest = pkgs.callPackage ./pkgs/neotest-pest.nix { };

      default = (inputs.nvf.lib.neovimConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [
            ./config
          ];
        })
        .neovim;
    }
  }
}
