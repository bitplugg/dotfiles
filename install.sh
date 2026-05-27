#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"
BACKUP="$HOME/dotfiles-backup-$(date +%Y%m%d_%H%M%S)"

echo "Installing bitplugg's dotfiles..."
echo "Backing up existing configs to $BACKUP"

mkdir -p "$BACKUP"

link_config() {
    local src="$1"
    local dest="$2"
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        mv "$dest" "$BACKUP/" 2>/dev/null || true
    fi
    mkdir -p "$(dirname "$dest")"
    ln -sf "$src" "$dest"
}

# Hyprland
link_config "$DOTFILES/hypr" "$HOME/.config/hypr"
link_config "$DOTFILES/hyprlock.conf" "$HOME/.config/hypr/hyprlock.conf"

# Waybar
link_config "$DOTFILES/waybar" "$HOME/.config/waybar"

# Swaync
link_config "$DOTFILES/swaync" "$HOME/.config/swaync"

# Kitty
link_config "$DOTFILES/kitty" "$HOME/.config/kitty"

# Rofi
link_config "$DOTFILES/rofi" "$HOME/.config/rofi"

# Neovim
link_config "$DOTFILES/nvim" "$HOME/.config/nvim"

# Fish
link_config "$DOTFILES/fish" "$HOME/.config/fish"

# Fastfetch
link_config "$DOTFILES/fastfetch" "$HOME/.config/fastfetch"

# Scripts
link_config "$DOTFILES/bin" "$HOME/.local/bin"

# GTK
link_config "$DOTFILES/settings.ini" "$HOME/.config/gtk-3.0/settings.ini"

# OpenClaw (if exists)
if [ -f "$DOTFILES/openclaw.json" ]; then
    mkdir -p "$HOME/.openclaw"
    link_config "$DOTFILES/openclaw.json" "$HOME/.openclaw/openclaw.json"
fi

echo "Done! Configs linked. Restart Hyprland (Super+M) to apply."
