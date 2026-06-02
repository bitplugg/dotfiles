#  bitplugg's Hyprland Rice

Полностью автоматическая тема под обои через **pywal16**.  
Всё в терминале — никаких GTK-виджетов, только TUI и Waybar.

> **OS:** Arch Linux · **WM:** Hyprland · **Shell:** Fish + Tide · **Terminal:** Kitty

---

##  Stack

| Компонент | Выбор |
|-----------|-------|
| **WM** | Hyprland (Wayland) |
| **Shell** | Fish + Tide |
| **Terminal** | Kitty |
| **Bar** | Waybar (30 тем, переключение `Super+Ctrl+,`) |
| **Notifications** | Swaync |
| **Launcher** | Wofi |
| **Editor** | Neovim + lazy.nvim |
| **AI** | Mistral (CLI: `Super+.`, `Super+Shift+.`) |
| **Search** | SearXNG (`Super+/`) |
| **Music** | MPD + ncmpcpp |
| **Multiplexer** | Tmux + resurrect/continuum |
| **Colors** | pywal16 → все конфиги |
| **Wallpaper** | Awww (плавная), fzf+chafa (выбор `Super+W`) |
| **Screen Lock** | Hyprlock |
| **Git** | Lazygit + git-delta |

##  Скрипты (86 шт)

Все в `~/.local/bin/` (симлинк на `dotfiles/bin/`).

### Основные keybinds

| Key | Команда |
|-----|---------|
| `Super+Return` | Kitty |
| `Super+D` / `Super+R` | Wofi (приложения) |
| `Super+Q` | Закрыть окно |
| `Super+W` | Выбор обоев |
| `Super+S` | Pywal swatch |
| `Super+T` | Pomodoro таймер |
| `Super+G` | Lazygit |
| `Super+U` | Update all |
| `Super+.` | AI prompt |
| `Super+,` | Dotfiles settings TUI |
| `Super+/` | Web search |
| `Super+Escape` | Power menu |
| `Super+F1` | Keybind help |
| `Super+Ctrl+N` | WiFi manager |
| `Super+Ctrl+K` | Package manager (paru) |
| `Super+Ctrl+L` | Todo list |
| `Super+Ctrl+,` | Waybar theme switcher |
| `Super+Ctrl+Z` | Terminal screensaver |
| `Print` | Screenshot монитор |
| `Shift+Print` | Screenshot регион |
| `Super+Print` | Screenshot окно |

Полный список → `Super+F1`

### 30 waybar тем

`nord`, `dracula`, `catppuccin-mocha/latte`, `gruvbox-dark/light`, `tokyo-night`, `everforest`, `synthwave`, `cyberpunk`, `rose-pine`, `amoled`, `minimal`, `compact`, `glass`, `modern`, `retro` и другие.

Переключение: `Super+Ctrl+,`

---

##  Установка

```bash
git clone https://github.com/bitplugg/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

После установки:
- `pywal-update-all` — применить цвета
- `Super+Super` — релоад Hyprland (если не применились бинды)

---

##  Структура

```
dotfiles/
├── hypr/          — Hyprland (keybinds, settings, exec, monitors)
├── waybar/        — Waybar config + style.css
├── waybar-themes/ — 30 тем для waybar-switch
├── kitty/         — Kitty terminal
├── fish/          — Fish shell (config, aliases, abbrevs)
├── nvim/          — Neovim
├── tmux/          — Tmux (resurrect, continuum)
├── mpd/           — MPD (музыкальный демон)
├── ncmpcpp/       — Ncmpcpp (клиент mpd)
├── lazygit/       — Lazygit config
├── swaync/        — Swaync (уведомления)
├── rofi/          — Rofi (на случай переключения)
├── cava/          — Cava (аудио-визуализатор)
├── fastfetch/     — Fastfetch
├── bin/           — Все скрипты (86 шт)
├── install.sh     — Установщик
└── .githooks/     — Pre-commit хук (проверка секретов)
```

---

##  API ключи

Хранятся в `~/.config/fish/config.fish`:
```fish
set -x MISTRAL_API_KEY 'реальный_ключ'
```

В dotfiles — заглушка `'***'`.  
Pre-commit хук блокирует коммит реальных ключей.

---

##  License

MIT
