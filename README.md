# bitplugg's dotfiles

My Hyprland rice with pywal theming.

## Stack

| Component | Choice |
|-----------|--------|
| WM | Hyprland |
| Shell | Fish + Tide |
| Bar | Waybar |
| Notifications | Swaync |
| Launcher | Rofi / Wofi |
| File Manager | Yazi |
| Editor | Neovim (LazyVim-style) |
| Browser | Firefox + Pywalfox |
| Search | SearXNG (127.0.0.1:8888) |
| AI Gateway | OpenClaw + Mistral AI + Telegram |
| Colors | pywal16 (generated from wallpaper) |
| Wallpaper | Awww + custom picker |

## Features

- All colors auto-generated from wallpaper via pywal
- Modular Hyprland config (source= includes)
- Neovim with LSP, Copilot, Trouble, Neo-tree, Telescope
- Telegram bot for OpenClaw AI
- Screenshot tools (hyprshot + gallery)
- Power menu, emoji picker, clipboard manager
- Wallpaper picker GUI (Python/tkinter)
- Auto-update checks + git backup

## Install

```bash
cd ~/dotfiles
./install.sh
```

## Keybinds

| Key | Action |
|-----|--------|
| Super+Return | Terminal |
| Super+O | OpenClaw launcher |
| Super+E | Neo-tree toggle |
| Super+Space | App launcher |
| Super+Shift+C | Color picker |
| Super+Shift+D | Backup configs |
| Print | Screenshot monitor |
| Shift+Print | Screenshot region |

## Credits

- [JaKooLit](https://github.com/JaKooLit/Wallpaper-Bank) — wallpapers
- [Hyprland](https://hyprland.org) — WM
- [pywal16](https://github.com/eylles/pywal16) — color generation
