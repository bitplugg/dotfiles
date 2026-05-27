# ┏━┳┳┳━┳━┳┳━┓
# ┃━┫┃┃┃━╋┓┃┃━┫
# ┗━┻━┻┻━┻┻━┻┻━┛

**bitplugg's Hyprland rice** — полностью автоматическая тема, подстраивающаяся под обои.
Все цвета генерируются из текущих обоев через pywal16. Модульный Neovim, AI-агенты,
аудио-визуализация, GTK-виджеты и собственный поисковик.

---

## 📦 Stack

| Компонент | Выбор | Назначение |
|-----------|-------|------------|
| **WM** | Hyprland 0.55.x | Композитор для Wayland |
| **Shell** | Fish + Tide | Оболочка с красивым промптом |
| **Terminal** | Kitty | GPU-терминал, прозрачность 0.85 |
| **Bar** | Waybar | Статус-бар с пилюлями |
| **Notifications** | Swaync 0.12.x | Центр уведомлений (заменил dunst) |
| **Launcher** | Rofi / Wofi | Переключаемый лаунчер |
| **App Drawer** | nwg-drawer | Полноэкранный поиск приложений |
| **File Manager** | Yazi | Терминальный файловый менеджер |
| **Editor** | Neovim + lazy.nvim | IDE на стероидах |
| **Browser** | Firefox + Pywalfox | Браузер, тема от обоев |
| **Search Engine** | SearXNG | Приватный мета-поиск (127.0.0.1:8888) |
| **AI Gateway** | OpenClaw | Mistral AI + Telegram бот @openpluh_bot |
| **Audio Viz** | Cava | Аудио-визуализатор в плавающем kitty |
| **Widget Suite** | AGS (Aylur's GTK Shell) | GTK4/TypeScript бары и виджеты |
| **Wallpaper Picker** | AGS (GTK4) | Выбор обоев через GUI с миниатюрами |
| **Colors** | pywal16 | Авто-генерация цветов от обоев |
| **Wallpaper** | Awww | Плавная смена обоев |
| **Screen Lock** | Hyprlock | Блокировка с информацией и погодой |
| **Idle** | Hypridle | Управление питанием |
| **Screenshots** | Hyprshot + slurp | Скриншоты областей/мониторов |
| **Screen Recording** | wf-recorder | Запись экрана |
| **Clipboard** | Cliphist | История буфера обмена |
| **Color Picker** | Hyprpicker | Пипетка цвета |
| **GTK Theme** | pywal-gtk-theme | Авто-тема GTK от обоев |
| **Cursor** | Bibata-Modern-Ice | Ледяной курсор |
| **Font** | JetBrainsMono Nerd Font | Моноширинный шрифт с иконками |
| **Fetch** | Fastfetch | Информация о системе (10 пресетов) |
| **Bluetooth** | Blueman | GUI для Bluetooth |
| **Network** | NetworkManager + nm-applet | Сеть |
| **Audio** | PipeWire + WirePlumber | Звук |
| **Backup** | Git + скрипт backup-configs | Авто-бэкап dotfiles |

---

## ✨ Возможности

### 🎨 Theming (pywal)
- Все конфиги (waybar, rofi, swaync, hyprlock, kitty, GTK, neovim) обновляются из цветов pywal
- Один скрипт `pywal-update-all` перезагружает всё сразу
- pywal-gtk-theme генерирует GTK тему
- pywal-rofi генерирует тему лаунчера
- pywal-swaync генерирует тему уведомлений
- pywalfox синхронизирует браузер с обоями
- pywal-cava обновляет цвета аудио-визуализатора

### 🪟 Hyprland
- Конфиги разбиты на модули (`source=`): **animations**, **decoration**, **exec**, **general**, **input**, **keybinds**, **monitors**, **settings**
- Анимации с custom bezier-кривыми
- Окна с скруглениями 10px
- Прозрачность 0.85 для Kitty
- Scale 1.00 на 1920×1080@60

### 📊 Waybar
- Все модули в виде пилюль (`border-radius: 8px`, `alpha(@background, 0.75)`)
- **Left**: launcher, workspaces, idle-inhibitor, color-picker, cava-toggle, ags-status, updates, cpu, memory, weather
- **Center**: window, media (playerctl)
- **Right**: pulseaudio, mic-toggle, night-mode, network, bluetooth, battery, clock, tray, power
- Workspaces с slide-анимацией
- Цвета от pywal через `@import colors-waybar.css`

### ⌨️ Neovim
- **Менеджер**: lazy.nvim (авто-установка плагинов)
- **Лидер**: `l` (вместо Space)
- **Цвета**: pywal через `pywal_theme.lua`
- **Статус-бар**: lualine.nvim с pywal-цветами и разделителями /
- **LSP**: через mason + mason-lspconfig, серверы: lua_ls, pyright, rust_analyzer, ts_ls, html, cssls, jsonls, yamlls, bashls, dockerls, marksman, sqlls, tailwindcss, eslint, graphql, emmet_ls, prismals
- **Автокомплит**: nvim-cmp с luasnip
- **Treesitter**: парсинг для всех языков
- **Файловое дерево**: neo-tree.nvim (`<leader>e`)
- **Быстрый доступ**: oil.nvim (`<leader>o`)
- **Поиск**: telescope.nvim
- **Git**: gitsigns.nvim
- **Диагностика**: trouble.nvim (`<leader>xx`)
- **Форматтер**: conform.nvim (автоформат на save)
- **Линтер**: nvim-lint
- **Хлебные крошки**: barbecue.nvim + nvim-navic
- **Сессии**: auto-session.nvim
- **Hex-цвета**: mini.hipatterns
- **Markdown**: markdown-preview.nvim (открывает в Firefox)
- **AI**: copilot.lua
- **Приветствие**: alpha-nvim
- **Уведомления**: noice.nvim
- **Подсказки**: which-key.nvim
- **Буферы**: bufferline.nvim

### 🔒 Hyprlock
- Часы 96pt, дата, иконка Arch
- Input-field с fade-эффектом
- Blur фона
- Системная информация: load, RAM, WiFi, громкость, погода, текущий трек
- Цвета от pywal, обновляются через pywal-update-all

### 🔔 Swaync
- Центр уведомлений вместо dunst
- Виджеты: заголовок, DND, уведомления, MPRIS, громкость, кнопки (2×4)
- Кнопки: mic-toggle, night-mode, calculator, clipboard
- Notification sounds отключены, `hide-on-action: false`

### 🖼️ Rofi
- Полностью заменил wofi (переключаемо через `launcher.txt`)
- Тема `pywal.rasi` — тёмная, полупрозрачная, скругления
- `drun.rasi` — список приложений в 2 колонки, иконки 28px
- Все скрипты используют враппер `~/.local/bin/dmenu`

### 🎵 Cava (Audio Visualizer)
- Работает через PipeWire
- 24 бара, градиент от pywal
- Запускается в плавающем Kitty с прозрачностью 0.7
- Хоткей `Super+C`, виджет в waybar
- Цвета от pywal через `pywal-cava`

### 🧩 AGS (Aylur's Widget Suite)
- Собран из исходников v3.1.0
- Бар: часы, дата, логотип 
- Wallpaper Picker: сетка миниатюр, Random, Close
- Хоткей `Super+A` для бара, `Super+W` для пикера

### 🤖 OpenClaw (AI Gateway)
- Mistral AI (mistral-large-latest) через API ключ
- Telegram бот @openpluh_bot для диалогов
- SearXNG как поисковый провайдер
- Система разрешений: `exec.security=full`, `exec.ask=off`
- Gateway как systemd user service (ws://127.0.0.1:18789)
- Лаунчер `Super+O` (Chat/Status/Restart/Stop)

### 🔎 SearXNG
- Мета-поиск на 127.0.0.1:8888
- Valkey на TCP localhost
- Limiter включён

### 📸 Screenshots & Recording
- `Print` — монитор
- `Shift+Print` — регион
- `Super+Shift+Print` — окно (wf-recorder)
- Галерея скриншотов через rofi (`Super+Shift+Z`)
- OCR скриншотов через tesseract (`Super+Shift+O`)

### 🛠️ Утилиты
- **Emoji Picker** (`Super+Shift+E`) — выбор эмодзи
- **Clipboard History** (`Super+Shift+V`) — cliphist через rofi
- **Quick Notes** (`Super+Shift+N`) — быстрые заметки
- **Calculator** (`Super+Shift+=`) — калькулятор
- **WiFi QR** (`Super+Shift+W`) — QR-код WiFi
- **Nerd Font Viewer** (`Super+Shift+F`) — просмотр иконок
- **Power Menu** (`Super+Escape`) — rofi: выключение/перезагрузка/блокировка
- **Keybind Help** (`Super+F1`) — список хоткеев
- **Window Killer** (`Super+Shift+K`) — интерактивное закрытие окон
- **Break Timer** (`Super+Shift+B`) — таймер отдыха
- **Night Mode** (`Super+Shift+L`) — wlsunset (тёплые цвета)
- **Mic Toggle** (`Super+Shift+U`) — mute/unmute микрофона
- **Idle Inhibit** (`Super+Shift+I`) — отключение автоблокировки

### 🖥️ Settings App
Python + tkinter приложение с 5 вкладками:
- **Theme**: pywal wallpaper picker, переключатель wofi/rofi
- **Display**: яркость, night mode
- **Audio**: громкость, mic toggle
- **Power**: idle inhibit, power profiles
- **Info**: системная информация

### ⚡ Auto-updates
- Systemd user timer (еженедельно)
- Уведомление через `notify-send` о количестве обновлений
- Клик на виджете waybar → `kitty paru -Syu`

### 📁 Backup
- Скрипт `backup-configs` (`Super+Shift+D`)
- Авто-git init при отсутствии репозитория
- Авто-коммит при наличии
- Пушит в GitHub

---

## 🚀 Installation

### Требования
- Arch Linux (или дистрибутив с pacman)
- Git, curl
- Paru (AUR helper)

### Установка

```bash
git clone https://github.com/bitplugg/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

Скрипт:
1. Устанавливает все зависимости (system + AUR)
2. Собирает AGS из исходников
3. Ставит Fisher + Tide
4. Создаёт симлинки всех конфигов
5. Применяет текущие pywal-цвета (если есть)

### После установки
```bash
# Перезагрузить Hyprland
Super + M

# Если обои не установлены:
~/.local/bin/wallpaper ~/Pictures/wallpapers/ваш_файл.jpg

# Если pywal не применяется:
pywal-update-all
```

---

## 📂 Структура

```
~/.config/
├── hypr/
│   ├── hyprland.conf      # Главный конфиг (source= модулей)
│   ├── monitors.conf      # Монитор: eDP-1 1920×1080@60
│   ├── keybinds.conf       # Все хоткеи (~75 binds)
│   ├── exec.conf           # Автозапуск (waybar, ags, пиксель)
│   ├── animations.conf     # Анимации окон
│   ├── general.conf        # Общие настройки
│   ├── decoration.conf     # Скругления, прозрачность
│   ├── input.conf          # Клавиатура, тачпад
│   ├── settings.conf       # Переменные (mainMod, terminal, etc.)
│   ├── hypridle.conf       # Управление питанием
│   └── hyprlock.conf       # Экран блокировки
├── waybar/
│   ├── config              # Модули и их настройки
│   └── style.css           # Стили с @import pywal
├── swaync/
│   ├── config.json         # Виджеты и поведение
│   └── style.css           # Стили от pywal
├── rofi/
│   ├── pywal.rasi          # Тема от pywal
│   └── drun.rasi           # Лаунчер приложений
├── kitty/kitty.conf        # Терминал, прозрачность, шрифт
├── nvim/                   # Neovim (lazy.nvim)
├── fish/                   # Fish + Tide конфиги
├── fastfetch/              # 10 пресетов
├── cava/config             # Аудио-визуализатор
├── ags/
│   ├── app.tsx             # Бар AGS (часы/дата)
│   └── wallpaper-picker.tsx # Выбор обоев
├── gtk-3.0/settings.ini    # GTK настройки
├── autostart/blueman.desktop
└── launcher.txt            # "wofi" или "rofi"

~/.local/bin/               # Все скрипты
├── dmenu                   # Враппер для wofi/rofi
├── appmenu                 # Враппер лаунчера
├── wallpaper               # Установка обоев + pywal
├── wallpaper-picker        # AGS GUI для обоев
├── pywal-update-all        # Обновление всех тем
├── pywal-rofi              # Генератор темы rofi
├── pywal-gtk-theme         # Генератор GTK темы
├── pywal-swaync            # Генератор swaync
├── pywal-cava              # Генератор cava
├── cava-toggle             # Запуск cava в kitty
├── ags-launcher            # Управление AGS баром
├── backup-configs          # Бэкап в ~/dotfiles
├── powermenu               # rofi: выключение
├── idle-inhibit            # Тоггл гибернации
├── mic-toggle              # Тоггл микрофона
├── night-mode              # Тоггл wlsunset
├── keybind-help            # Список хоткеев
├── emoji-picker            # Выбор эмодзи
├── cliphist-wl             # История буфера
├── quick-notes             # Быстрые заметки
├── calculator              # Калькулятор
├── wifi-qr                 # QR-код WiFi
├── nerd-font-viewer        # Просмотр NF иконок
├── screenshot-gallery      # Галерея скриншотов
├── screenshot-ocr           # OCR скриншота
├── audio-recorder          # Запись звука
├── translate               # Перевод текста
├── git-status              # Git статус
├── window-killer           # Закрытие окон
├── workspace-overview      # Обзор рабочих столов
├── project-launcher        # Запуск проектов
├── openclaw-launcher       # Управление OpenClaw
├── break-timer             # Таймер отдыха
├── settings                # GUI приложение
├── fastfetch-pywal         # Fastfetch с цветами
├── fastfetch-switch        # Смена пресета
└── sddm-theme-install      # Установка темы SDDM

~/.openclaw/openclaw.json   # Конфиг OpenClaw (Mistral, Telegram)
~/.config/systemd/user/
├── openclaw-gateway.service # Systemd сервис OpenClaw
└── auto-update.timer        # Еженедельные обновления
```

---

## ⌨️ Keybinds

### Окна и Рабочие столы

| Клавиша | Действие |
|---------|----------|
| `Super+Return` | Открыть терминал (Kitty) |
| `Super+Q` | Закрыть окно |
| `Super+M` | Выход из Hyprland |
| `Super+F` | Полный экран |
| `Super+V` | Переключить плавающий режим |
| `Super+arrows` | Переместить фокус |
| `Super+Shift+arrows` | Переместить окно |
| `Super+1-9` | Переключить рабочий стол |
| `Super+Shift+1-9` | Переместить окно на рабочий стол |
| `Super+mouse_down` | Следующий рабочий стол |
| `Super+mouse_up` | Предыдущий рабочий стол |
| `Super+Tab` | Hyprswitch (Super+Tab) |
| `Alt+Tab` | Hyprswitch (Alt+Tab) |
| `Super+Space` | nwg-drawer (поиск приложений) |

### Лаунчеры и Утилиты

| Клавиша | Действие |
|---------|----------|
| `Super+R` или `Super+D` | App launcher (rofi/wofi) |
| `Super+E` | Neo-tree (файловое дерево) |
| `Super+W` | Wallpaper picker (AGS) |
| `Super+A` | AGS bar toggle |
| `Super+S` | Settings app |
| `Super+O` | OpenClaw лаунчер |
| `Super+F1` | Keybind help |
| `Super+Escape` | Power menu |
| `Super+Shift+Escape` | btop (монитор системы) |

### Мультимедиа

| Клавиша | Действие |
|---------|----------|
| `XF86AudioRaiseVolume` | Громче |
| `XF86AudioLowerVolume` | Тише |
| `XF86AudioMute` | Mute |
| `XF86AudioPlay` | Play/Pause |
| `XF86AudioNext` | Следующий трек |
| `XF86AudioPrev` | Предыдущий трек |
| `XF86MonBrightnessUp` | Ярче |
| `XF86MonBrightnessDown` | Темнее |
| `Super+C` | Cava audio visualizer |

### Скриншоты и Запись

| Клавиша | Действие |
|---------|----------|
| `Print` | Скриншот монитора |
| `Shift+Print` | Скриншот области |
| `Super+Shift+Print` | Запись области (wf-recorder) |
| `Super+Shift+Z` | Галерея скриншотов |
| `Super+Shift+O` | OCR скриншота |

### Тогглы

| Клавиша | Действие |
|---------|----------|
| `Super+L` | Блокировка (hyprlock) |
| `Super+N` | Центр уведомлений (swaync) |
| `Super+Shift+I` | Idle inhibit |
| `Super+Shift+L` | Night mode (wlsunset) |
| `Super+Shift+U` | Микрофон mute/unmute |
| `Super+Shift+M` | Запись аудио |

### Инструменты

| Клавиша | Действие |
|---------|----------|
| `Super+Shift+C` | Color picker (hyprpicker) |
| `Super+Shift+V` | История буфера обмена |
| `Super+Shift+E` | Emoji picker |
| `Super+Shift+N` | Quick notes |
| `Super+Shift+F` | Nerd Font viewer |
| `Super+Shift+W` | WiFi QR code |
| `Super+Shift+=` | Calculator |
| `Super+Shift+T` | Translate |
| `Super+Shift+S` | Settings |
| `Super+Shift+B` | Break timer |
| `Super+Shift+K` | Window killer |
| `Super+Shift+A` | Workspace overview |
| `Super+Shift+P` | Project launcher |
| `Super+Shift+G` | Git status |
| `Super+Shift+D` | Backup configs |
| `Super+Shift+H` | Cliphist (wl) |
| `Super+Shift+R` | Screen recording region |
| `Super+Shift+Escape` | btop |

---

## 🎨 Theming System

### Как это работает

```
Смена обоев (Super+W или wallpaper-picker)
  → awww img (плавная смена)
  → wal -i (генерация pywal цветов)
  → pywal-update-all:
      ├─ pywal-cava     → cava/config (градиент)
      ├─ pywal-gtk-theme → ~/.config/gtk-4.0/gtk.css
      ├─ pywal-rofi     → rofi/pywal.rasi + drun.rasi
      ├─ pywal-swaync   → swaync/style.css
      ├─ hyprlock.conf  → цвета фона/текста/акцента
      ├─ killall -SIGUSR1 kitty → цвета терминала
      └─ pkill waybar   → перезапуск с новыми цветами
```

### pywal colors.json структура

```json
{
  "special": {
    "background": "#1e1e2e",
    "foreground": "#cdd6f4"
  },
  "colors": {
    "color0":  "#45475a",  // black
    "color1":  "#f38ba8",  // red
    "color2":  "#a6e3a1",  // green
    "color3":  "#f9e2af",  // yellow
    "color4":  "#89b4fa",  // blue
    "color5":  "#f5c2e7",  // magenta
    "color6":  "#94e2d5",  // cyan
    "color7":  "#bac2de",  // white
    "color8":  "#585b70",  // bright black
    ...
  }
}
```

### Map цветов по компонентам

| Компонент | color0 | color1 | color2 | color3 | color4 | color5 | color6 | color7 |
|-----------|--------|--------|--------|--------|--------|--------|--------|--------|
| Waybar | — | power, mic.muted | battery.charging, mic | idle-inhib.disabled | launcher, network, bluetooth | cpu, colorpicker | media, weather, ags | idle-inhib.enabled |
| Swaync | фон | заголовки | — | — | акцент | — | — | текст |
| Rofi | фон | — | — | — | акцент | — | — | текст |
| Hyprlock | surface | error | — | — | accent | — | — | muted |
| Cava | — | color1 | color2 | color3 | color4 | color5 | color6 | color7 |

---

## 🧩 Neovim Подробно

### Структура конфига

```
~/.config/nvim/
├── init.lua               # Главный файл
├── lazy-lock.json         # lock-файл плагинов
└── lua/
    ├── core/
    │   ├── options.lua     # Настройки редактора
    │   ├── keymaps.lua     # Глобальные хоткеи
    │   ├── autocmds.lua    # Автокоманды
    │   └── pywal_theme.lua # Цвета от pywal
    └── plugins/
        ├── alpha.lua       # Приветственный экран
        ├── completion.lua  # nvim-cmp + luasnip
        ├── lsp.lua         # Mason + LSP серверы
        ├── markdown.lua    # Markdown preview
        ├── misc.lua        # bufferline, which-key, gitsigns
        ├── noice.lua       # Уведомления
        ├── statusline.lua  # lualine с pywal
        ├── telescope.lua   # Поиск
        ├── tools.lua       # trouble, neo-tree, conform, lint
        └── treesitter.lua  # Парсеры
```

### Лидер клавиша: `l`

```
<leader> = l

<leader>e     → Neo-tree toggle
<leader>o     → Oil (быстрый файловый менеджер)
<leader>xx    → Trouble diagnostics
<leader>rn    → Rename (LSP)
<leader>ca    → Code action (LSP)
<leader>D     → Diagnostic float
<leader>ff    → Telescope find files
<leader>fg    → Telescope live grep
<leader>fb    → Telescope buffers
<leader>fh    → Telescope help tags
<leader>qq    → Quit all
<leader>ww    → Save
<leader>wq    → Save and quit

gd            → Goto definition
K             → Hover
gi            → Goto implementation
gr            → References
[d            → Prev diagnostic
]d            → Next diagnostic
```

### Установленные Mason пакеты

```
lua_ls, pyright, rust_analyzer,
ts_ls, html, cssls, jsonls, yamlls,
bashls, dockerls, marksman,
sqlls, tailwindcss, eslint,
graphql, emmet_ls, prismals
```

---

## 🐟 Fish Shell

- **Промпт**: Tide (Lean стиль)
- **Плагины**: через Fisher
- **Автозапуск**: fastfetch при входе
- **Переменные**: `MISTRAL_API_KEY` для OpenClaw
- **Aliases**: нет глобальных алиасов

---

## 🔧 Troubleshooting

### sudo пароль
Пароль "zxc" работает нестабильно через pipe. Рекомендуется:
```bash
# Отключить пароль для определённых команд
echo "$USER ALL=(ALL) NOPASSWD: /usr/bin/pacman" | sudo tee /etc/sudoers.d/pacman
```

### Waybar battery
Батарея: `BAT0`. Если не отображается, проверь:
```bash
ls /sys/class/power_supply/
```

### Swaync hide-on-action
В swaync 0.12.6 `hide-on-action` по умолчанию `true`. В конфиге стоит явный `false`.

### Hyprlock deprecated keys
В версии 0.9.5 не существуют: `no_fade_in`, `no_fade_out`, `grace`, `disable_loading_bar`, `fail_transition`, `line_spacing`.

### Hyprland windowrules
Новый синтаксис: `float on`, `center on`, `match:class`.

### Rofi 2.0.0
- В rasi без `px` после чисел
- `element selected` → `element selected.normal`
- `+` для цветовых операций

### AGS
- Требует `libastal-git` и `libastal-4-git` из AUR
- Запуск: `cd ~/.config/ags && ags run app.tsx`
- Если не видит Astal 4.0: проверь установку `libastal-4-git`

### SearXNG
- Слушает на `127.0.0.1:8888`
- Valkey на TCP `127.0.0.1:6379`
- OpenClaw: `plugins.entries.searxng.config.webSearch.baseUrl`

### OpenClaw
- Gateway: `ws://127.0.0.1:18789`
- Systemd user service: `systemctl --user restart openclaw-gateway`
- Token в `~/.openclaw/openclaw.json`

---

## 📜 Scripts Reference

| Скрипт | Назначение | Хоткей |
|--------|-----------|--------|
| `wallpaper <file>` | Установить обои + pywal | — |
| `wallpaper --random` | Случайные обои | — |
| `wallpaper-picker` | GUI выбор обоев (AGS) | `Super+W` |
| `pywal-update-all` | Обновить все темы | — |
| `cava-toggle` | Cava в плавающем kitty | `Super+C` |
| `ags-launcher` | Управление AGS баром | `Super+A` |
| `openclaw-launcher` | Chat/Status/Restart/Stop | `Super+O` |
| `powermenu` | Выключение/перезагрузка | `Super+Escape` |
| `idle-inhibit` | Отключить автоблокировку | `Super+Shift+I` |
| `mic-toggle` | Mute/unmute микрофона | `Super+Shift+U` |
| `night-mode` | Тёплые цвета экрана | `Super+Shift+L` |
| `backup-configs` | Git бэкап dotfiles | `Super+Shift+D` |
| `settings` | GUI приложение | `Super+Shift+S` |
| `keybind-help` | Список хоткеев | `Super+F1` |
| `dmenu` | Враппер wofi/rofi | — |
| `appmenu` | Лаунчер приложений | `Super+R/D` |

---

## 📦 Dependencies

### System (pacman)

```
hyprland hyprlock hypridle hyprshot hyprpicker
waybar swaync rofi-wayland wofi nwg-drawer
kitty fish brightnessctl
pipewire wireplumber pipewire-pulse pipewire-jack
playerctl pavucontrol helvum
bluez bluez-utils blueman
networkmanager nm-connection-editor
ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji
swayosd libnotify
wl-clipboard cliphist grim slurp wf-recorder
gtk3 gtk4 gtk-engine-murrine
yazi trash-cli udiskie
git lazygit
python-pywal16 imagemagick
qt5ct qt6ct kvantum nwg-look
wlsunset autotiling
neovim nodejs npm
tesseract tesseract-data-rus
```

### AUR (paru)

```
hyprswitch cliphist nwg-displays
cava pywalfox
libastal-git libastal-4-git libastal-meta
openclaw searxng-git
```

---

## 🧠 Система автоматизации

```
Смена обоев
  → pywal (генерация цветов)
  → pywal-update-all (применение ко всем компонентам)
  → pkill waybar + waybar (перезапуск)
  → killall -SIGUSR1 kitty (перезагрузка цветов)
  → notify-send "Theme updated"

Auto-update timer (еженедельно)
  → checkupdates + paru -Qum
  → notify-send с количеством обновлений
  → Клик на waybar → kitty paru -Syu

Backup configs (Super+Shift+D)
  → Копирование конфигов в ~/dotfiles
  → git add + git commit
  → git push (на GitHub)
```

---

## 🔗 Credits

- [Hyprland](https://hyprland.org) — Wayland compositor
- [pywal16](https://github.com/eylles/pywal16) — Color generation
- [JaKooLit](https://github.com/JaKooLit/Wallpaper-Bank) — Wallpaper collection
- [Aylur's AGS](https://github.com/Aylur/ags) — GTK widget system
- [OpenClaw](https://opencode.ai) — AI gateway
- [SearXNG](https://docs.searxng.org) — Private search engine
- [Catppuccin](https://github.com/catppuccin) — SDDM theme
- [Bibata](https://github.com/ful1e5/Bibata_Cursor) — Cursor theme

---

*Сгенерировано с ❤️ и sudo*
