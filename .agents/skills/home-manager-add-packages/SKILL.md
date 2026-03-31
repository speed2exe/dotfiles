---
name: home-manager-add-packages
description: Add Nix packages to the Home Manager configuration
---
# home-manager-add-packages

Add Nix packages to the Home Manager configuration.

## Description

This skill reads `~/.config/home-manager/home.nix` and adds new packages to the `home.packages = with pkgs;` list, then syncs the configuration.

## Workflow

1. Read `~/.config/home-manager/home.nix`
2. Find the `home.packages = with pkgs; [` block
3. Add new packages to the list (before the closing `];`)
4. Write the updated configuration back
5. **SYNC: Run `home-manager switch` to apply changes**

## CRITICAL: Sync After Editing

**ALWAYS run `home-manager switch` after editing `home.nix`:**

```bash
# Standard home-manager installation
home-manager switch

# Using flakes
home-manager switch --flake ~/.config/home-manager
```

Without this step, the packages are added to the config file but NOT installed on the system!

## Package Location

Packages are added inside:
```nix
home.packages = with pkgs; [
  # existing packages...
  
  # new packages added here
];
```

## Important Notes

- **ALWAYS** read the file first to see the current package list
- **ALWAYS** preserve existing formatting and comments
- **NEVER** add duplicate packages (check if already present)
- **ALWAYS** maintain proper Nix syntax (commas between items)
- The list uses **2-space indentation** for packages
- **CRITICAL: Always run `home-manager switch` after editing**

## Examples

### Before:
```nix
home.packages = with pkgs; [
  bun
  sqlite
  go
];
```

### After adding `claude-code`:
```nix
home.packages = with pkgs; [
  bun
  sqlite
  go
  claude-code
];
```

Then run:
```bash
home-manager switch
```

### After adding multiple packages:
```nix
home.packages = with pkgs; [
  bun
  sqlite
  go
  claude-code
  ripgrep
  fzf
];
```

Then run:
```bash
home-manager switch
```

## Common Packages to Add

| Package | Description |
|---------|-------------|
| `claude-code` | Anthropic's Claude Code CLI |
| `claude-code-bin` | Binary distribution of Claude Code |
| `codex` | OpenAI Codex CLI |
| `ripgrep` | Fast grep alternative |
| `fzf` | Fuzzy finder |
| `fd` | Fast find alternative |
| `bat` | Cat with syntax highlighting |
| `eza` | Modern ls replacement |
| `btop` | System resource monitor |
| `starship` | Cross-shell prompt |
| `nix-search-cli` | Search Nix packages |

## Troubleshooting Sync Issues

### "error: syntax error"
Check that proper Nix syntax is maintained (commas, brackets).

### "error: undefined variable"
The package name might be wrong. Search with `nix-search <name>`.

### Changes not applied
Make sure you ran `home-manager switch` after editing.

## See Also

- `nix-search-cli` skill - Search for Nix packages
- https://github.com/nix-community/home-manager
- https://search.nixos.org/packages
