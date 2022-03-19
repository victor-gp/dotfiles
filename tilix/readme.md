# how-to

## preferences.dconf

```bash
# save system preferences
dconf dump /com/gexperts/Tilix/ > tilix/preferences.dconf

# load dotfiles preferences
dconf load /com/gexperts/Tilix/ < tilix/preferences.dconf
# `dconf reset /com/gexperts/Tilix/` may be necessary before load
```

## gtk.css

link on `~/.config/gtk-3.0/gtk.css`
