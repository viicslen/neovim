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
          inherit pkgs;
          modules = [
            ./config
          ];
        })
        .neovim;
    };
  };
}
