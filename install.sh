#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"
BACKUP="$HOME/dotfiles-backup-$(date +%Y%m%d_%H%M%S)"
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

info()  { echo -e "${BLUE}[INFO]${NC} $1"; }
ok()    { echo -e "${GREEN}[OK]${NC} $1"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERR]${NC} $1"; }
header(){ echo -e "\n${CYAN}━━━ $1 ━━━${NC}"; }

banner() {
    echo -e "${CYAN}"
    echo "  ╔══════════════════════════════════╗"
    echo "  ║     bitplugg's dotfiles           ║"
    echo "  ║     Hyprland Rice Installer       ║"
    echo "  ╚══════════════════════════════════╝"
    echo -e "${NC}"
}

install_packages() {
    local desc="$1"; shift
    local packages=("$@")
    local missing=()

    for pkg in "${packages[@]}"; do
        if ! pacman -Qi "$pkg" &>/dev/null && ! paru -Qi "$pkg" &>/dev/null; then
            missing+=("$pkg")
        fi
    done

    if [ ${#missing[@]} -eq 0 ]; then
        ok "$desc — already installed"
        return 0
    fi

    info "Installing $desc: ${missing[*]}"
    if paru -S --noconfirm "${missing[@]}" 2>&1 | tail -3; then
        ok "$desc installed"
    else
        warn "Some packages in $desc failed to install"
    fi
}

link_config() {
    local src="$1"
    local dest="$2"
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        mkdir -p "$BACKUP/$(dirname "${dest#$HOME/}")"
        mv "$dest" "$BACKUP/$(dirname "${dest#$HOME/}")/" 2>/dev/null || true
    fi
    mkdir -p "$(dirname "$dest")"
    ln -sf "$src" "$dest"
}

# ──────────────────────────────────────────────
banner
info "Starting installation..."
echo "Backup: $BACKUP"

# ── System ────────────────────────────────────
header "System Packages"
install_packages "System" \
    hyprland hyprlock hypridle hyprshot hyprpicker \
    waybar swaync rofi-wayland wofi nwg-drawer \
    kitty fish brightnessctl \
    pipewire wireplumber pipewire-pulse pipewire-jack \
    playerctl pavucontrol helvum \
    bluez bluez-utils blueman \
    networkmanager nm-connection-editor \
    ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji \
    swayosd libnotify \
    wl-clipboard cliphist grim slurp wf-recorder \
    gtk3 gtk4 gtk-engine-murrine \
    yazi trash-cli udiskie \
    git lazygit \
    python-pywal16 imagemagick \
    qt5ct qt6ct kvantum nwg-look \
    wlsunset autotiling \
    neovim nodejs npm \
    tesseract tesseract-data-rus

# ── AUR ────────────────────────────────────────
header "AUR Packages"
install_packages "AUR" \
    hyprswitch cliphist nwg-displays \
    cava pywalfox \
    libastal-git libastal-4-git libastal-meta \
    openclaw searxng-git

# ── AGS (Aylur's Widget Suite) ────────────────
header "AGS (Aylur's Widget Suite)"
if command -v ags &>/dev/null; then
    ok "AGS already installed ($(ags --version))"
else
    info "Building AGS from source..."
    cd /tmp
    git clone --depth=1 https://github.com/Aylur/ags.git
    cd ags
    npm install
    meson setup build
    meson compile -C build
    sudo meson install -C build
    cd /tmp && rm -rf ags
    ok "AGS installed"
fi

# ── Fisher + Tide ──────────────────────────────
header "Fish Shell"
if ! fish -c "fisher list" &>/dev/null; then
    info "Installing fisher..."
    fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher" 2>&1 | tail -1
fi
if ! fish -c "fisher list" 2>/dev/null | grep -q tide; then
    info "Installing tide..."
    fish -c "fisher install IlanCosman/tide@v6" 2>&1 | tail -1
fi
ok "Fish/Tide ready"

# ── SDDM Theme ─────────────────────────────────
header "SDDM"
if [ -f /etc/sddm.conf.d/theme.conf ]; then
    ok "SDDM theme configured"
else
    warn "SDDM theme not found — run sddm-theme-install"
fi

# ── Symlink Configs ────────────────────────────
header "Symlinking Configs"
link_config "$DOTFILES/hypr"           "$HOME/.config/hypr"
link_config "$DOTFILES/hyprlock.conf"  "$HOME/.config/hypr/hyprlock.conf"
link_config "$DOTFILES/waybar"         "$HOME/.config/waybar"
link_config "$DOTFILES/swaync"         "$HOME/.config/swaync"
link_config "$DOTFILES/kitty"          "$HOME/.config/kitty"
link_config "$DOTFILES/rofi"           "$HOME/.config/rofi"
link_config "$DOTFILES/nvim"           "$HOME/.config/nvim"
link_config "$DOTFILES/fish"           "$HOME/.config/fish"
link_config "$DOTFILES/fastfetch"      "$HOME/.config/fastfetch"
link_config "$DOTFILES/bin"            "$HOME/.local/bin"
link_config "$DOTFILES/settings.ini"   "$HOME/.config/gtk-3.0/settings.ini"
link_config "$DOTFILES/ags"            "$HOME/.config/ags"
link_config "$DOTFILES/cava"           "$HOME/.config/cava"

if [ -f "$DOTFILES/openclaw.json" ]; then
    mkdir -p "$HOME/.openclaw"
    link_config "$DOTFILES/openclaw.json" "$HOME/.openclaw/openclaw.json"
fi

ok "Configs linked"

# ── Final ──────────────────────────────────────
header "Summary"
echo -e "  ${GREEN}✓${NC} Configs installed"
echo -e "  ${GREEN}✓${NC} Backup: $BACKUP"
echo -e "  ${YELLOW}→${NC} Restart Hyprland (${BLUE}Super+M${NC})"
echo -e "  ${YELLOW}→${NC} Run ${BLUE}pywal-update-all${NC} after wallpaper change"
echo -e "  ${YELLOW}→${NC} AGS bar: ${BLUE}Super+A${NC} to toggle"

if [ -f "$HOME/.cache/wal/colors.json" ]; then
    pywal-update-all
    ok "Applied current pywal colors"
fi

echo ""
echo -e "${GREEN}Done! Enjoy your Hyprland rice.${NC}"
