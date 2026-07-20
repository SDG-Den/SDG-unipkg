# unipkg Overview

unipkg is a package-manager-agnostic wrapper that presents a single CLI and TUI across any Linux distribution. It delegates package operations to the native package managers on your system, so you use one consistent interface regardless of distro.

## Supported Package Managers (stable)

| Manager | Index | System |
|---------|-------|--------|
| PacMan | pacman | Arch Linux |
| AUR (yay) | yay | Arch Linux |
| APT | apt | Debian / Ubuntu |
| Snap | snap | Ubuntu / any |
| Flatpak | flathub | any |
| XBPS | xbps | Void Linux |
| Homebrew | brew | macOS / Linux |

A dev configuration is also shipped with 27+ managers (including dnf, zypper, emerge, nix, guix, etc.) — see [100-installation.md](100-installation.md).

## How it works

unipkg reads two config files:

- **`managers.csv`** — a database of command templates for each package manager (install, remove, update, list, etc.)
- **`unipkg.conf`** — a plain list of enabled indexes in priority order

When you run `unipkg install pacmon firefox`, it looks up the `InstallCommand` for `pacman` in `managers.csv` and executes it. The special indexes `omni`, `any`, and `all` iterate over every manager in `unipkg.conf`.

## CLI and TUI

unipkg offers two interfaces:

- **CLI** — `unipkg <command> <index> [args]` for scripting and quick tasks
- **TUI** — `unipkg launch-tui` for an interactive FZF-based menu
