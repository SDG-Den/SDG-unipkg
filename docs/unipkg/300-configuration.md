# Configuration

unipkg uses two files in `~/.config/unipkg/`:

## unipkg.conf

A plain list of enabled manager indexes, one per line. Order determines priority.

```
pacman
flathub
snap
```

Commands run against managers in this order. The first manager in the list is the default for operations that target a single manager.

Generate this file automatically:

```bash
unipkg generate
```

Or edit it manually:

```bash
unipkg edit-config
```

## managers.csv

A comma-separated database defining commands for each manager. Fields:

| # | Field | Description | Example |
|---|-------|-------------|---------|
| 1 | IndexName | Identifier used in commands | `pacman` |
| 2 | DisplayName | Human-readable name | `PacMan` |
| 3 | VersionCommand | Check manager version | `pacman -V` |
| 4 | InfoCommand | Show package info | `pacman -Sii` |
| 5 | InstallCommand | Install packages | `sudo pacman -S` |
| 6 | ListCommand | List remote packages | `pacman -Slq` |
| 7 | ListUpgradableCommand | List packages with updates | `checkupdates` |
| 8 | UpgradeCommand | Upgrade all packages | `sudo pacman -Syu` |
| 9 | RemoveCommand | Remove a package | `sudo pacman -R` |
| 10 | UpdateCacheCommand | Refresh package cache | `sudo pacman -Sy` |
| 11 | ListInstalledCommand | List installed packages | `pacman -Q` |
| 12 | Attribution | Source of the entries | `SDG-Den [github]` |
| 13 | Test Status | Whether the entry was tested | `Tested Working` |

### Constraints

- Commands must not contain commas or double quotes
- Multi-word commands and pipes are supported (e.g., `apt list --installed | cut -d/ -f1`)

## Stable vs Dev

Two CSV files are shipped with the package:

| File | Contents | Installed as |
|------|----------|-------------|
| `managers.csv` (stable) | 7 human-tested managers | Default |
| `managers-dev.csv` (dev) | 27+ entries including AI-generated | Chosen during install |
