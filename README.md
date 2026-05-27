# ┏━┳┳┳━┳━┳┳━┓
# ┃━┫┃┃┃━╋┓┃┃━┫
# ┗━┻━┻┻━┻┻━┻┻━┛

**bitplugg's Hyprland rice** — полностью автоматическая тема под обои через pywal16.
Neovim, AI-агенты, аудио-визуализация, GTK-виджеты, приватный поисковик.

> 📖 **Полная документация** → [GitHub Wiki](https://github.com/bitplugg/dotfiles/wiki)

---

## 📦 Stack

| Компонент | Выбор | Назначение |
|-----------|-------|------------|
| **WM** | Hyprland | Композитор Wayland |
| **Shell** | Fish + Tide | Оболочка |
| **Terminal** | Kitty | GPU-терминал |
| **Bar** | Waybar | Статус-бар |
| **Notifications** | Swaync | Центр уведомлений |
| **Launcher** | Rofi / Wofi | Меню приложений |
| **Editor** | Neovim + lazy.nvim | IDE |
| **AI Gateway** | OpenClaw | Mistral AI + Telegram |
| **Search** | SearXNG | Приватный мета-поиск |
| **Audio Viz** | Cava | Визуализатор |
| **Widgets** | AGS | GTK4/TS бары |
| **Wallpaper Picker** | fzf + chafa | Выбор обоев в терминале |
| **Colors** | pywal16 | Авто-цвета от обоев |
| **Wallpaper** | Awww | Плавная смена |
| **Screen Lock** | Hyprlock | Блокировка |
| **Clipboard** | Cliphist | История буфера |

## 🚀 Installation

**Требования:** Arch Linux, git, curl, paru

```bash
git clone https://github.com/bitplugg/dotfiles.git ~/dotfiles
cd ~/dotfiles && chmod +x install.sh && ./install.sh
```

Установщик: пакеты (system + AUR), AGS из исходников, Fisher + Tide, симлинки, pywal.

После установки: `Super + M` (перезагрузка), `Super+W` (выбор обоев).

## ⌨️ Keybinds

| Клавиша | Действие |
|---------|----------|
| `Super+Return` | Терминал |
| `Super+Q` | Закрыть окно |
| `Super+F` | Fullscreen |
| `Super+V` | Float toggle |
| `Super+R/D` | App launcher |
| `Super+W` | Wallpaper picker |
| `Super+A` | AGS bar toggle |
| `Super+E` | Файловый менеджер |
| `Super+O` | OpenClaw launcher |
| `Super+L` | Блокировка |
| `Super+N` | Уведомления |
| `Super+Escape` | Power menu |
| `Super+F1` | Keybind help |
| `Print` | Скриншот |
| `Super+arrows` | Фокус / перемещение |
| `Super+1-9` | Рабочие столы |
| `Super+Space` | Поиск приложений |

Полный список → [Keybinds](https://github.com/bitplugg/dotfiles/wiki/Keybinds)

## 🔗 Pages

- **[Theming](https://github.com/bitplugg/dotfiles/wiki/Theming)** — pywal, цвета по компонентам
- **[Components](https://github.com/bitplugg/dotfiles/wiki/Components)** — Hyprland, Waybar, Neovim, OpenClaw, SearXNG...
- **[Scripts](https://github.com/bitplugg/dotfiles/wiki/Scripts)** — все 40+ скриптов
- **[Customization](https://github.com/bitplugg/dotfiles/wiki/Customization)** — кастомизация
- **[Troubleshooting](https://github.com/bitplugg/dotfiles/wiki/Troubleshooting)** — известные проблемы

## 📁 Структура

```
~/.config/
├── hypr/           # Hyprland (8 модулей)
├── waybar/         # Статус-бар
├── swaync/         # Уведомления
├── rofi/           # Лаунчер
├── kitty/          # Терминал
├── nvim/           # Neovim (lazy.nvim)
├── fish/           # Fish shell
├── ags/            # AGS бар
├── fastfetch/      # 10 пресетов
├── cava/           # Аудио-визуализатор
~/.local/bin/       # 40+ скриптов
```

## 🔗 Credits

[Hyprland](https://hyprland.org) · [pywal16](https://github.com/eylles/pywal16) · [AGS](https://github.com/Aylur/ags) · [OpenClaw](https://opencode.ai) · [SearXNG](https://docs.searxng.org) · [Catppuccin](https://github.com/catppuccin) · [Bibata](https://github.com/ful1e5/Bibata_Cursor)

---

*Сгенерировано с ❤️ и sudo*
