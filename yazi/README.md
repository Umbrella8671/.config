# Yazi config

Local Yazi configuration for version 26.5.6.

## Use this directory directly

```sh
YAZI_CONFIG_HOME=~/yazi yazi
```

## Install as the default config

Copy or symlink these files into:

```text
~/.config/yazi/
```

Yazi loads `yazi.toml`, `keymap.toml`, and `theme.toml` from that directory on macOS and other Unix-like systems.

## Notes

- No plugins or flavors are installed by this config.
- Current key additions are prepended to the defaults instead of replacing them.
- Press `~` inside Yazi to open the built-in help and see the full active keymap.

## Custom shortcuts

These shortcuts are defined in `keymap.toml`.

### Visibility

| Key | Action |
| --- | --- |
| `.` | Toggle hidden files |

### Go to folders

| Key | Action |
| --- | --- |
| `g h` | Go to home |
| `g d` | Go to `~/Downloads` |
| `g c` | Go to `~/.config` |
| `g y` | Go to `~/.config/yazi` |

### Line mode

| Key | Action |
| --- | --- |
| `l n` | Hide extra line info |
| `l m` | Show modified time |
| `l s` | Show file size |

### Search and jump

| Key | Action | Dependency |
| --- | --- | --- |
| `s z` | Fuzzy jump with fzf | `fzf` |
| `s r` | Search file contents with ripgrep | `rg` |
| `s f` | Search file names with fd | `fd` |
| `s g` | Search file contents with ripgrep | `rg` |
| `F f` | Fuzzy jump with fzf | `fzf` |
| `F r` | Search file contents with ripgrep | `rg` |
| `F n` | Search file names with fd | `fd` |

`F` means uppercase `F`, so press `Shift+f`, then the next key.

### Sorting

| Key | Action |
| --- | --- |
| `s n` | Sort naturally, directories first |
| `s m` | Sort by modified time, newest first |
| `s s` | Sort by size, largest first |

## Common default shortcuts

These are Yazi defaults kept by this config.

| Key | Action |
| --- | --- |
| `j` / `k` | Move down / up |
| `h` / `l` | Leave folder / enter folder |
| `H` / `L` | Back / forward in history |
| `g g` / `G` | Go to top / bottom |
| `<Space>` | Select or unselect hovered item |
| `v` / `V` | Visual select / visual unset |
| `o` / `<Enter>` | Open selected or hovered item |
| `O` | Open with interactive picker |
| `a` | Create file or directory |
| `r` | Rename |
| `y` | Yank/copy |
| `x` | Cut |
| `p` | Paste |
| `d` | Move to trash |
| `D` | Delete permanently |
| `/` / `?` | Find next / previous in current list |
| `n` / `N` | Jump to next / previous find match |
| `f` | Filter current list |
| `S` | Search file contents with ripgrep |
| `z` | Fuzzy jump with fzf |
| `w` | Show task manager |
| `q` | Quit |
