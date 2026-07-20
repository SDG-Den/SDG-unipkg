# Adding Custom Managers

You can add any command-line package manager to unipkg by adding a line to `managers.csv`.

## Field Reference

See [300-configuration.md](300-configuration.md) for the full field table.

## Step-by-step

1. Open `~/.config/unipkg/managers.csv` in an editor
2. Add a new line with the 13 comma-separated fields
3. Run `unipkg generate` to add the index to `unipkg.conf` (if the manager is installed)
4. Or manually add the index name to `~/.config/unipkg/unipkg.conf`

## Example: Adding pip

```csv
pip,PIP (Python),pip --version,pip show,pip install,pip list,pip list --outdated,pip install --upgrade --break-system-packages,pip uninstall,pip install --upgrade pip,pip list,Manual,Tested
```

## Unsupported features

If a manager doesn't support a particular operation, use `echo 'not supported'` as the command. For example, snap has no cache update command:

```csv
snap,...,...,echo 'snap has no cache update',...
```

## Limitations

- Commands must be a single line
- No commas or double quotes inside commands
- Piping is supported (e.g., `pacman -Q | awk '{print $1}'`)
- The command will have package names appended to it at runtime
