# TUI Usage

Launch with `unipkg launch-tui`. Requires `fzf`.

The main menu has five categories:

## Maintenance

| Option | Action |
|--------|--------|
| Check | Select a manager to check if its binary is available |
| Indexes | Print all available indexes with display names |
| Versions | Print versions for unipkg and all configured managers |
| Generate | Auto-detect installed managers and regenerate `unipkg.conf` |
| Edit unipkg.conf | Open the config in `$EDITOR` |
| Help Menu | FZF browseable help for every command |

## Lists

Shows your configured managers on the right. Toggle the left panel:

- `alt+i` — installed packages
- `alt+u` — upgradable packages
- `alt+l` — available packages

## Install

1. Select a manager from `unipkg.conf`
2. Search and select packages (`tab` for multi-select)
3. Preview window shows package info

## Uninstall

1. Select a manager
2. Browse installed packages and pick one to remove

## Update

Browse upgradable packages per manager.

- `alt+u` — run cache update for the highlighted manager
- `enter` — run full upgrade for the highlighted manager

## Navigation

- `ctrl+c` — go back one level
- `ctrl+c` twice — exit
- `esc` — abort current selection
