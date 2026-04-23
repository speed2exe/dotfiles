---
name: macos-screenshot-capture
description: Native macOS built-in screen capture. Saves directly to ~/Desktop using exact system timestamp naming, so agent can automatically detect and read the latest screenshot without manual file paths. macOS only.
---

# macOS Native Screenshot Capture Skill

> **macOS only** — uses system builtin `screencapture` utility, zero dependencies, no installs required.

Saves files to `~/Desktop` in the default macOS screenshot naming format, so the agent will automatically pick up the latest capture when you say "read screenshot".

## Usage

| Command | Action |
|---|---|
| `snap` | ✅ Interactive area selection (same as Cmd+Shift+4) |
| `snap window` | Click to capture a window |
| `snap full` | Capture entire screen |
| `snap silent` | Capture full screen without shutter sound |
| `snap clip` | Interactive area selection, copy to clipboard (no file saved) |

## Permanent function install
```bash
cat >> ~/.zshrc << 'EOF'
snap() {
  local file=~/Desktop/"Screenshot $(date '+%Y-%m-%d at %H.%M.%S').png"
  case "${1}" in
    window) screencapture -iW "$file" ;;
    full)   screencapture "$file" ;;
    silent) screencapture -x "$file" ;;
    clip)   screencapture -ic ;;
    *)      screencapture -i "$file" ;;
  esac
}
EOF
```

Then reload: `source ~/.zshrc`

✅ All captured files will be automatically detected as the latest screenshot. You do not need to provide file paths, just tell the agent `read screenshot` immediately after capture.
