# CLI Usage

```
unipkg [COMMAND] <index> [args]
```

## General Commands

| Command | Description | Example |
|---------|-------------|---------|
| `check <index>` | Check if a package manager is installed | `unipkg check apt` |
| `indexes` | List all available manager indexes and display names | `unipkg indexes` |
| `generate` | Auto-detect installed managers and write `unipkg.conf` | `unipkg generate` |
| `versions` | Show version for unipkg and every configured manager | `unipkg versions` |
| `edit-config` | Open `~/.config/unipkg/unipkg.conf` in `$EDITOR` | `unipkg edit-config` |
| `list-config <index>` | Show raw command config for a manager | `unipkg list-config pacman` |
| `help <command>` | Show detailed help for a command | `unipkg help install` |
| `launch-tui` | Open the interactive FZF TUI | `unipkg launch-tui` |
| `help-tui` | FZF-based help browser | `unipkg help-tui` |

## Information Commands

| Command | Description | Example |
|---------|-------------|---------|
| `info <index> <package>` | Show package details | `unipkg info pacman sl` |
| `list available <index>` | List available remote packages | `unipkg list available apt` |
| `list installed <index>` | List installed packages | `unipkg list installed all` |
| `list upgradable <index>` | List packages with updates | `unipkg list upgradable all` |

## Package Management Commands

| Command | Description | Example |
|---------|-------------|---------|
| `install <index> <pkg> [pkgs...]` | Install packages | `unipkg install pacman firefox vim` |
| `uninstall <index> <pkg>` | Remove a package | `unipkg uninstall apt neofetch` |
| `update <index>` | Refresh package cache | `unipkg update all` |
| `upgrade <index>` | Upgrade all packages | `unipkg upgrade flathub` |

## Special Indexes

`omni`, `any`, and `all` are interchangeable. When used:

- **install / uninstall**: tries each configured manager in order until one succeeds
- **update / upgrade / list installed / list upgradable**: runs the command for every configured manager

## Full system update

```bash
unipkg update all && unipkg upgrade all
```
