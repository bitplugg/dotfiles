# Changelog

## [Unreleased]

### Added
- `launcher` — категоризированный лаунчер (Super+R/D):
  10 категорий (Terminal, Files, Scripts, System, Internet, Media, Dev, Tools, AI, Power)
  с миниатюрой обоев вверху wofi и расширенным списком приложений

### Changed
- Заменён `$menu` (wofi drun) на новый `launcher` в keybinds.conf

## [2025-06-02] — Waybar themes + scripts batch

### Added
- 30 waybar themes + `waybar-switch` (`Super+Ctrl+,`)
- `audio-switch` — переключение аудиовыхода (`Super+Ctrl+A`)
- `pomodoro-tui` — Pomodoro таймер (`Super+T`)
- `todo-tui` — todo-list через wofi (`Super+Ctrl+L`)
- `bookmarks-tui` — поиск закладок Firefox (`Super+Ctrl+B`)
- `terminal-saver` — случайная заставка (`Super+Ctrl+Z`)
- Пакеты: asciiquarium, nyancat, bonsai.sh-git

## [2025-06-02] — Waybar dropdowns + TUI scripts

### Added
- **20+ скриптов:**
  - `ai`, `ai-explain` — Mistral AI CLI
  - `bluetooth-tui` — Bluetooth manager via wofi
  - `cht` — cheat.sh wrapper
  - `colors-edit` — редактирование pywal цветов
  - `display-manager` — управление мониторами (wlr-randr)
  - `dotfiles-settings`, `dotfiles-updater`, `dotfiles-status`, `dotfiles-branch` — TUI для dotfiles
  - `font-preview` — просмотр Nerd Font иконок
  - `hyprctl-summary` — инфо о системе
  - `media-dl` — yt-dlp загрузчик
  - `mount-tui` — монтирование USB/дисков
  - `network-tui` — WiFi manager
  - `notify-me` — таймер/напоминание
  - `pacman-tui` — paru wrapper
  - `power-profile` — CPU governor switcher
  - `pywal-swatch` — отображение палитры pywal
  - `pywal-tmux` — tmux цвета из pywal
  - `qr-decode` — декодирование QR кода
  - `quicksettings-menu` — меню быстрых настроек
  - `random-wallpaper` — случайные обои
  - `screenshot-annotate` — скриншот + swappy
  - `screenshot-menu` — меню скриншотов
  - `search` — поиск через wofi
  - `systemd-tui` — управление сервисами
  - `tmux-sessionizer` — tmux project switcher
  - `update-all` — полное обновление системы
  - `waybar-quicksettings`, `waybar-screenshot`, `waybar-keyboard`, `waybar-restart`
- **Tmux config**: pywal-tmux, resurrect, continuum
- **MPD + ncmpcpp**: музыкальный демон + TUI клиент
- **Lazygit**: конфиг с git-delta
- **Git-delta**: side-by-side diff, Catppuccin-mocha
- **Fish**: aliases (eza, bat, lazygit, yazi, ncdu), git abbrevs, system abbrevs
- **30 waybar themes**: nord, dracula, catppuccin, gruvbox, tokyo-night и другие
- **Pre-commit hook**: проверка API ключей перед коммитом
- **Settings app (Tkinter)**: pywal цвета, 6 вкладок, Dotfiles page

### Changed
- **AGS полностью удалён** (app.tsx, widgets, wallpaper-picker, ags-launcher, все keybinds)
- **Waybar**: заменены AGS-виджеты на dropdown модули (quicksettings, screenshot, keyboard)
- **CPU/Memory**: клик → btop в floating Kitty
- **Wallpaper-picker**: AGS → fzf + chafa в Kitty
- **Все rofi-скрипты → wofi**: quicksettings-menu, screenshot-menu, power-profile, bluetooth-tui, display-manager
- **Hyprland exec.conf**: удалён ags-launcher, добавлен mpd
- **install.sh**: обновлены пакеты, symlinks, git hooks
- **README**: обновлён (без AGS)

### Removed
- AGS (GJS/GTK) — все виджеты и зависимости
- AGS wiki страница
- wallpaper-pick (заменён на wallpaper-picker)

## [2025-05-xx] — Initial setup

### Added
- Базовый Hyprland конфиг
- Waybar, Swaync, Kitty
- Rofi, Neovim
- AGS виджеты (впоследствии удалены)
- Pywal16 интеграция
- OpenClaw + SearXNG
