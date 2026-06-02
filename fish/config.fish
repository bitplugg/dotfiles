if not contains ~/.local/bin $PATH
    set -x PATH ~/.local/bin $PATH
end

set -x MISTRAL_API_KEY '***'

if status is-interactive
    if type -q zoxide
        zoxide init fish | source
    end

    if type -q fzf
        fzf --fish | source
    end

    if not set -q fastfetch_ran
        set -U fastfetch_ran true
        if type -q fastfetch-pywal
            fastfetch-pywal
        else if type -q fastfetch
            fastfetch
        end
    end
    if type -q fastfetch-pywal
        fastfetch-pywal
    else if type -q fastfetch
        fastfetch
    end
end

# ── Git abbreviations ──
if type -q git
    abbr -a gst  'git status'
    abbr -a gco  'git checkout'
    abbr -a gcb  'git checkout -b'
    abbr -a gpl  'git pull'
    abbr -a gps  'git push'
    abbr -a gpsf 'git push --force-with-lease'
    abbr -a gadd 'git add -A'
    abbr -a gcm  'git commit -m'
    abbr -a gca  'git commit --amend'
    abbr -a gdf  'git diff'
    abbr -a glg  'git log --oneline --graph --decorate -15'
    abbr -a gbr  'git branch -a'
    abbr -a grs  'git reset --soft HEAD~1'
    abbr -a grh  'git reset --hard HEAD'
    abbr -a gcl  'git clone'
end

if type -q eza
    alias ls='eza --color=always --icons'
    alias l='eza -l --color=always --icons'
    alias la='eza -la --color=always --icons'
    alias lt='eza --tree --color=always --icons'
    alias lg='eza -l --git --icons'
end

if type -q bat
    alias cat='bat'
    alias catp='bat -p'
end

if type -q yazi
    alias y='yazi'
end

if type -q lazygit
    alias lg='lazygit'
end

if type -q ncdu
    alias disk='ncdu'
end

if type -q tealdeer
    alias help='tldr'
end

# ── System abbreviations ──
if type -q systemctl
    abbr -a sc  'systemctl'
    abbr -a scu 'systemctl --user'
    abbr -a jc  'journalctl -xe'
    abbr -a jcf 'journalctl -f'
end
if type -q paru
    abbr -a upd 'paru -Syu'
    abbr -a sin 'paru -S'
    abbr -a srm 'paru -Rs'
    abbr -a srch 'paru -Ss'
end
if type -q yazi
    abbr -a y 'yazi'
end
if type -q tmux
    abbr -a tmuxs 'tmux new-session -A -s main'
end

alias getwalls='cd ~/Pictures/wallpapers && git clone --depth 1 --filter=blob:none https://github.com/JaKooLit/Wallpaper-Bank . 2>/dev/null && rm -rf .git && cd -'
