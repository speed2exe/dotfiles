---
name: home-manager-add-packages
description: Add Nix packages to the Home Manager configuration
---
# home-manager-add-packages

Add Nix packages to `~/.config/home-manager/home.nix` and apply with `home-manager switch`.

## Workflow

1. Read `~/.config/home-manager/home.nix`
2. Find the `home.packages = with pkgs; [` block
3. Add new packages before the closing `];` (check for duplicates first)
4. Write the updated file
5. Run `home-manager switch` (or `home-manager switch --flake ~/.config/home-manager` for flakes)

## Rules

- Read the file first to see existing packages — never add duplicates
- Preserve existing formatting, comments, and 2-space indentation
- Maintain valid Nix syntax (no commas needed between items — it's a list, not an attrset)

## Example

```nix
# Before
home.packages = with pkgs; [
  bun
  sqlite
];

# After adding ripgrep
home.packages = with pkgs; [
  bun
  sqlite
  ripgrep
];
```

Then run `home-manager switch` to install.

## Troubleshooting

- **Syntax error**: Check brackets and indentation
- **Undefined variable**: Package name is wrong — use the `nix-search-cli` skill to find the correct name
- **Changes not applied**: Ensure `home-manager switch` completed without errors
