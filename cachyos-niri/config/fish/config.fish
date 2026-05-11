set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx EDITOR nvim
set -gx BAT_THEME "Catppuccin Mocha"

fish_add_path ~/.local/bin

if command -q go
    set -l gobin (go env GOBIN)
    if test -n "$gobin"
        fish_add_path $gobin
    else
        fish_add_path ~/go/bin
    end
end

mise activate fish | source
