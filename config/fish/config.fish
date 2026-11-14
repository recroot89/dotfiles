fish_add_path ~/.local/bin

if command -q go
    set -l gobin (go env GOBIN)
    if test -n "$gobin"
        fish_add_path $gobin
    else
        fish_add_path ~/go/bin
    end
end

if command -q mise
    mise activate fish | source
end
if command -q zoxide
    zoxide init fish | source
end
