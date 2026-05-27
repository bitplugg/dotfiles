## Contributing

Рад, что хочешь помочь! Вот несколько правил:

### Before committing

1. **Не коммить секреты** — API-ключи, токены, пароли. Используй `'***'` вместо реальных значений.
2. **Проверь синтаксис**:
   ```bash
   bash -n script.sh      # bash скрипты
   hyprctl reload          # hyprland конфиг
   ags run app.tsx         # AGS виджеты
   ```
3. **Обнови README** если меняешь функциональность.

### Code style

- Bash: `set -e`, поясняющие комментарии
- Конфиги: однострочные, с отступами где нужно
- AGS: TypeScript, camelCase, без лишних зависимостей

### Pull Requests

- Один PR — одно изменение
- Описывай что и зачем
- Ссылайся на issue если есть

### Структура

```
dotfiles/
├── hypr/           # Hyprland конфиги (модульно)
├── waybar/         # Статус-бар
├── ags/            # AGS виджеты
├── bin/            # Скрипты (~/.local/bin)
├── fish/           # Fish shell
├── nvim/           # Neovim
├── kitty/          # Kitty терминал
└── install.sh      # Установщик
```
