# Installation

## Prerequisites

- sudo
- bash
- fzf (required for TUI; CLI works without it)
- At least one package manager

## Via sdgpkg (recommended)

```bash
sdgpkg install unipkg
```

sdgpkg clones the repository to `~/.cache/SDG-PKG/unipkg/`, runs the install script, and prompts you to choose between the **stable** and **dev** managers configuration.

## Via sdgbuild (local development)

```bash
sdgbuild build
```

This runs `build.sh` from the working directory, copies files to `~/.local/`, and creates the `/usr/bin/unipkg` symlink.

## Stable vs Dev config

| Config | Managers | Origin |
|--------|----------|--------|
| stable | 7 (pacman, yay, apt, snap, flatpak, xbps, brew) | Human-tested |
| dev | 27+ (includes dnf, zypper, emerge, nix, guix, pip, cargo, gem, etc.) | AI-generated from official docs, mostly untested |

The stable config is recommended for daily use. Switch to dev if you need broader coverage and are willing to test.
