# how-to

## preferences.dconf

```bash
# save system preferences
dconf dump /org/gnome/terminal/ > gnome-terminal/preferences.dconf

# load dotfiles preferences
dconf load /org/gnome/terminal/ < gnome-terminal/preferences.dconf
```

## gtk.css

original location at `~/.config/gtk-3.0/gtk.css`

## gnome-terminal.desktop

original location at `~/.local/share/applications/gnome-terminal.desktop`
