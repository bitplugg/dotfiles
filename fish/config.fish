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

if type -q lsd
    alias ls='lsd'
    alias l='lsd -l'
    alias la='lsd -la'
    alias lt='lsd --tree'
end

if type -q bat
    alias cat='bat'
end

if type -q yazi
    alias y='yazi'
end

alias getwalls='cd ~/Pictures/wallpapers && git clone --depth 1 --filter=blob:none https://github.com/JaKooLit/Wallpaper-Bank . 2>/dev/null && rm -rf .git && cd -'
