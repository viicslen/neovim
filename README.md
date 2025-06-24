# Personal Neovim Configuration with nvf

This is my personal Neovim configuration built using [nvf](https://github.com/notashelf/nvf), a highly modular and configurable Neovim configuration framework for Nix users.

## Overview

This flake provides a fully-featured Neovim setup optimized for modern development workflows, with particular emphasis on:

- Web development (PHP, TypeScript, JavaScript, HTML, CSS)
- Infrastructure as Code (Nix, Terraform, HCL)
- Systems programming (Go, Zig, C/C++)
- Scripting (Python, Bash, Nushell)
- Laravel development with specialized tooling

## Features

### Language Support

- **PHP**: Full LSP support with Intelephense, Laravel-specific tooling, Pest testing framework
- **TypeScript/JavaScript**: Complete development environment with error translation
- **Web Technologies**: HTML, CSS, Tailwind CSS support
- **Infrastructure**: Nix, Terraform, HCL support
- **Systems**: Go, Zig, C/C++ with debugging capabilities
- **Scripting**: Python, Bash, Nushell
- **Documentation**: Markdown with live preview
- **Data**: SQL support

### Development Tools

- **LSP**: Comprehensive language server protocol support with trouble diagnostics
- **Completion**: Smart autocompletion with nvim-cmp
- **Debugging**: Full DAP (Debug Adapter Protocol) support with UI
- **Testing**: Integrated testing with Neotest and specialized Pest adapter
- **Git Integration**: Fugitive, GitSigns, conflict resolution, and GitLinker
- **File Management**: NvimTree with git integration and file highlighting
- **Project Management**: Project.nvim for workspace management
- **Search**: Telescope for fuzzy finding with hidden file support

### UI & Experience

- **Theme**: Modern interface with proper borders and icons
- **Navigation**: Harpoon for quick file switching, breadcrumbs, aerial outline
- **Visual Enhancements**:
  - Indent guides and scrollbar
  - Syntax highlighting with Treesitter
  - Cursorline and cursorword highlighting
  - Smart column indicators
- **Notifications**: Integrated notification system
- **Dashboard**: Welcome screen with quick actions
- **Terminal**: Integrated terminal with LazyGit support

### AI & Productivity

- **GitHub Copilot**: AI-powered code completion and suggestions
- **Avante.nvim**: Advanced AI assistant with Claude integration
- **Wakatime**: Development time tracking
- **Snippet Management**: LuaSnip for code snippets
- **Formatting**: Conform.nvim with PHP Pint integration

### Specialized Plugins

- **Laravel.nvim**: Laravel-specific commands and navigation
- **Neotest-Pest**: PHP Pest testing framework integration
- **Snacks.nvim**: Enhanced file explorer and utilities

## Installation

### Using the Flake Directly

```bash
# Run Neovim with this configuration
nix run github:viicslen/nvf-config
```

### Integration with NixOS/Home Manager

Add to your flake inputs:

```nix
{
  inputs = {
    # ... other inputs
    nvf-config.url = "github:viicslen/nvf-config";
  };
}
```

Then use in your configuration:

```nix
# In your home.nix or system configuration
environment.systemPackages = [
  inputs.nvf-config.packages.${system}.default
];
```

### Development Shell

For development work on this configuration:

```bash
nix develop
```

## File Structure

```
.
├── flake.nix          # Main flake definition
├── packages.nix       # Package definitions
├── apps.nix          # Application configurations
├── config/
│   ├── default.nix   # Main Neovim configuration
│   └── keybinds.nix  # Custom keybindings
└── pkgs/
    ├── laravel-nvim.nix    # Laravel plugin package
    └── neotest-pest.nix    # Pest testing plugin package
```

## Key Bindings

### Custom Bindings

- `<C-s>` - Save file (Normal, Visual, Insert modes)
- `<leader>;` - Insert semicolon at end of line
- `<leader>,` - Insert comma at end of line
- `>` / `<` - Indent/unindent selection (Visual mode)

### LSP Bindings

- `<leader>gD` - Go to declaration
- `<leader>gd` - Go to definition
- `<leader>gt` - Go to type definition
- `<leader>h` - Show hover information
- `<leader>gi` - List implementations
- `<leader>gr` - List references

### Which-Key Integration

The configuration uses Which-Key with Helix preset for discoverable keybindings. Press `<leader>` and wait to see available options.

## Configuration Highlights

### Language Servers

- **PHP**: Intelephense for comprehensive PHP support
- **TypeScript**: Built-in TS server with error translation
- **Multi-language**: Automatic LSP setup for all supported languages

### Formatter Setup

- **PHP**: Laravel Pint for code formatting
- **Conform.nvim**: Extensible formatting system

### AI Integration

- **Copilot**: Integrated with completion system
- **Avante**: Advanced AI features with cursor planning and Claude tool mode

### Development Workflow

- **Auto-suggestions**: Disabled by default, available on-demand
- **Hard-time**: Vim improvement training with hint mode
- **Leap Motion**: Enhanced cursor movement
- **Multi-cursors**: Advanced editing capabilities

## Customization

The configuration is modular and can be easily customized by:

1. **Modifying `config/default.nix`**: Adjust plugin settings and enable/disable features
2. **Updating `config/keybinds.nix`**: Add or modify keybindings
3. **Adding packages in `pkgs/`**: Include additional Vim plugins
4. **Extending `packages.nix`**: Add new package variants or configurations

## Building and Testing

```bash
# Build the configuration
nix build

# Check formatting
nix build .#checks.x86_64-linux.nix-fmt

# Run the built Neovim
./result/bin/nvim
```

## Dependencies

This configuration uses:

- **nvf**: The core Neovim configuration framework
- **nixpkgs**: For base packages and Vim plugins
- **flake-parts**: For modular flake organization

## License

This configuration is provided as-is for personal use. Individual plugins and components maintain their respective licenses.

## Contributing

This is a personal configuration, but feel free to:

- Fork and adapt for your own use
- Submit issues if you find problems
- Suggest improvements via pull requests

---

Built with ❤️ using [nvf](https://github.com/notashelf/nvf) and the Nix ecosystem.
