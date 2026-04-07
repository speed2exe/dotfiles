---
name: nix-search-cli
description: Search for Nix packages using the nix-search CLI tool
---
# nix-search-cli

Search for Nix packages using the nix-search CLI tool, which queries https://search.nixos.org. Supports filtering by name, version, programs, channel, and ElasticSearch QueryString syntax. Wildcards (`*`, `?`) are supported; regex is not.

**Prerequisites:** `nix-search` in PATH — https://github.com/peterldowns/nix-search-cli
**Tip:** Use this before adding packages with the `home-manager-add-packages` skill to verify package names.

## Usage

```
nix-search python linter                              # basic search
nix-search --name 'emacsPackages.*'                   # by name (wildcard)
nix-search --version '1.*'                            # by version
nix-search --program "py*"                            # by installed program
nix-search --channel=23.11 nodejs                     # specific channel (default: unstable)
nix-search --flakes wayland                           # search flakes
nix-search --query-string="package_programs:(crystal OR irb)"  # ElasticSearch
nix-search golang --program go --version '1.*' --details       # combined
nix-search --json --details --max-results 50 --reverse python  # output options
```

## Options

| Flag | Description |
|------|-------------|
| `-c, --channel` | Channel to search (default: unstable) |
| `-d, --details` | Show expanded details |
| `-f, --flakes` | Search flakes instead of nixpkgs |
| `-j, --json` | JSON output |
| `-m, --max-results` | Max results (default: 20) |
| `-n, --name` | Filter by package name |
| `-p, --program` | Filter by installed program |
| `-q, --query-string` | ElasticSearch QueryString |
| `-r, --reverse` | Reverse result order |
| `-v, --version` | Filter by version |
