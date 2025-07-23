{pkgs}:
with pkgs;
  vimUtils.buildVimPlugin {
    src = fetchFromGitHub {
      owner = "Juksuu";
      repo = "worktrees.nvim";
      rev = "e21254e82626796437c98634e2bebdabd85c1534";
      sha256 = "sha256-AEOXEv/kxJKvrrau2QenKB8P1loL9xPYMbPk1O8xSw0=";
    };
    pname = "worktrees.nvim";
    version = "dev";
    buildInputs = with vimPlugins; [
      plenary-nvim
      telescope-nvim
    ];
  }
