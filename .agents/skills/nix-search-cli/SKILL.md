---
name: nix-search-cli
description: Search for Nix packages using the nix-search CLI tool
---
# nix-search-cli

Search for Nix packages using the nix-search CLI tool.

## Description

This skill allows searching for Nix packages using the nix-search CLI, which queries the https://search.nixos.org index. Supports filtering by name, version, programs, and more.

## Prerequisites

- nix-search CLI installed and available in PATH
- See: https://github.com/peterldowns/nix-search-cli

## Usage

Basic search (same as web interface):
```
nix-search python linter
```

Search by package name:
```
nix-search --name python
nix-search --name 'emacsPackages.*'
```

Search by version:
```
nix-search --version 1.20
nix-search --version '1.*'
```

Search by installed programs:
```
nix-search --program python
nix-search --program "py*"
```

Search on specific channel (default: unstable):
```
nix-search --channel=unstable python3
nix-search --channel=23.11 nodejs
```

Search flakes:
```
nix-search --flakes wayland
```

Advanced search with ElasticSearch QueryString:
```
nix-search --query-string="package_programs:(crystal OR irb)"
nix-search --query-string='package_description:(MIT Scheme)'
```

Combined search with multiple filters:
```
nix-search golang --program go --version '1.*' --details
```

Output options:
```
nix-search --json python           # JSON output
nix-search --details python      # Expanded details
nix-search --max-results 50 python  # Limit results
nix-search --reverse python        # Reverse order
```

## Common Options

| Flag | Description |
|------|-------------|
| -c, --channel | Which channel to search (default: unstable) |
| -d, --details | Show expanded details |
| -f, --flakes | Search flakes instead of nixpkgs |
| -j, --json | JSON output format |
| -m, --max-results | Maximum results (default: 20) |
| -n, --name | Search by package name |
| -p, --program | Search by installed programs |
| -q, --query-string | ElasticSearch QueryString |
| -r, --reverse | Reverse result order |
| -s, --search | Default search (same as website) |
| -v, --version | Search by version |

## Examples

1. Find Python development tools:
   ```
   nix-search --program python --details
   ```

2. Find Node.js version 20.x:
   ```
   nix-search --name nodejs --version '20.*'
   ```

3. Find all packages related to "linter":
   ```
   nix-search linter --max-results 100
   ```

4. Find packages with specific license:
   ```
   nix-search --query-string='package_license:"MIT"' --json
   ```

## Notes

- The search index is provided by search.nixos.org
- Wildcards (* and ?) are supported in name, version, and program filters
- Regular expressions are NOT supported, use wildcards instead
- QueryString syntax follows ElasticSearch conventions
