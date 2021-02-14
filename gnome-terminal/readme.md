# how-to

## preferences.dconf

```bash
# save system preferences
dconf dump /org/gnome/terminal/ > gnome-terminal/preferences.dconf

# load dotfiles preferences
dconf load /org/gnome/terminal/ < gnome-terminal/preferences.dconf
```
