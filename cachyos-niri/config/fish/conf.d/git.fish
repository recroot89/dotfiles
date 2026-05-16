function git_current_branch
    git branch --show-current 2>/dev/null
end

function current_branch
    git_current_branch
end

function git_main_branch
    if git show-ref --verify --quiet refs/heads/main
        echo main
    else if git show-ref --verify --quiet refs/heads/master
        echo master
    else
        echo main
    end
end

function git_develop_branch
    if git show-ref --verify --quiet refs/heads/develop
        echo develop
    else if git show-ref --verify --quiet refs/heads/dev
        echo dev
    else
        echo develop
    end
end

function gbda
    git branch --no-color --merged \
        | grep -vE '^[+*]' \
        | grep -vE '^[[:space:]]*'(git_main_branch)'[[:space:]]*$' \
        | grep -vE '^[[:space:]]*'(git_develop_branch)'[[:space:]]*$' \
        | xargs -r git branch -d 2>/dev/null
end

function gcm
    git checkout (git_main_branch)
end

function gcd
    git checkout (git_develop_branch)
end

function gccd
    git clone --recurse-submodules $argv
    and cd (basename $argv[-1] .git)
end

function gdnolock
    git diff $argv ":(exclude)package-lock.json" ":(exclude)*.lock"
end

function gdv
    git diff -w $argv | view -
end

function ggf
    git push --force origin (current_branch)
end

function ggfl
    git push --force-with-lease origin (current_branch)
end

function ggl
    git pull origin (current_branch)
end

function ggp
    git push origin (current_branch)
end

function ggpnp
    ggl
    and ggp
end

function ggpull
    git pull origin (git_current_branch)
end

function ggpur
    ggu
end

function ggpush
    git push origin (git_current_branch)
end

function ggsup
    git branch --set-upstream-to=origin/(git_current_branch)
end

function ggu
    git pull --rebase origin (current_branch)
end

function gpsup
    git push --set-upstream origin (git_current_branch)
end

function gmom
    git merge origin/(git_main_branch)
end

function gmum
    git merge upstream/(git_main_branch)
end

function grbd
    git rebase (git_develop_branch)
end

function grbm
    git rebase (git_main_branch)
end

function grbom
    git rebase origin/(git_main_branch)
end

function groh
    git reset origin/(git_current_branch) --hard
end

function grt
    cd (git rev-parse --show-toplevel 2>/dev/null; or echo .)
end

function gswm
    git switch (git_main_branch)
end

function gswd
    git switch (git_develop_branch)
end

function gtl
    git tag --sort=-v:refname -n -l "$argv[1]*"
end

function gunwip
    git log -n 1 | grep -q -c -- "--wip--"
    and git reset HEAD~1
end

function gupom
    git pull --rebase origin (git_main_branch)
end

function gupomi
    git pull --rebase=interactive origin (git_main_branch)
end

function glum
    git pull upstream (git_main_branch)
end

function gluc
    git pull upstream (git_current_branch)
end

function gwip
    git add -A
    git rm (git ls-files --deleted) 2>/dev/null
    git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"
end

# Basic
alias g 'git'
alias ga 'git add'
alias gaa 'git add --all'
alias gapa 'git add --patch'
alias gau 'git add --update'
alias gav 'git add --verbose'
alias gap 'git apply'
alias gapt 'git apply --3way'

# Branch
alias gb 'git branch'
alias gba 'git branch -a'
alias gbd 'git branch -d'
alias 'gbD' 'git branch -D'
alias gbl 'git blame -b -w'
alias gbnm 'git branch --no-merged'
alias gbr 'git branch --remote'

# Bisect
alias gbs 'git bisect'
alias gbsb 'git bisect bad'
alias gbsg 'git bisect good'
alias gbsr 'git bisect reset'
alias gbss 'git bisect start'

# Commit
alias gc 'git commit -v'
alias 'gc!' 'git commit -v --amend'
alias 'gcn!' 'git commit -v --no-edit --amend'
alias gca 'git commit -v -a'
alias 'gca!' 'git commit -v -a --amend'
alias 'gcan!' 'git commit -v -a --no-edit --amend'
alias 'gcans!' 'git commit -v -a -s --no-edit --amend'
alias gcam 'git commit -a -m'
alias gcas 'git commit -a -s'
alias gcasm 'git commit -a -s -m'
alias gcsm 'git commit -s -m'
alias gcmsg 'git commit -m'
alias gcs 'git commit -S'

# Checkout / clone / config
alias gcb 'git checkout -b'
alias gcf 'git config --list'
alias gcl 'git clone --recurse-submodules'
alias gclean 'git clean -id'
alias gpristine 'git reset --hard && git clean -dffx'
alias gco 'git checkout'
alias gcor 'git checkout --recurse-submodules'
alias gcount 'git shortlog -sn'

# Cherry-pick
alias gcp 'git cherry-pick'
alias gcpa 'git cherry-pick --abort'
alias gcpc 'git cherry-pick --continue'

# Diff
alias gd 'git diff'
alias gdca 'git diff --cached'
alias gdcw 'git diff --cached --word-diff'
alias gdct 'git describe --tags (git rev-list --tags --max-count=1)'
alias gds 'git diff --staged'
alias gdt 'git diff-tree --no-commit-id --name-only -r'
alias gdup 'git diff @{upstream}'
alias gdw 'git diff --word-diff'

# Fetch
alias gf 'git fetch'
alias gfa 'git fetch --all --prune'
alias gfg 'git ls-files | grep'
alias gfo 'git fetch origin'

# Help / ignore
alias ghh 'git help'
alias gignore 'git update-index --assume-unchanged'
alias gunignore 'git update-index --no-assume-unchanged'
alias gignored 'git ls-files -v | grep "^[[:lower:]]"'

# Pull / push
alias gl 'git pull'
alias gp 'git push'
alias gpd 'git push --dry-run'
alias gpf 'git push --force-with-lease'
alias 'gpf!' 'git push --force'
alias gpoat 'git push origin --all && git push origin --tags'
alias gpr 'git pull --rebase'
alias gpu 'git push upstream'
alias gpv 'git push -v'

# Log
alias glg 'git log --stat'
alias glgp 'git log --stat -p'
alias glgg 'git log --graph'
alias glgga 'git log --graph --decorate --all'
alias glgm 'git log --graph --max-count=10'
alias glo 'git log --oneline --decorate'
alias glog 'git log --oneline --decorate --graph'
alias gloga 'git log --oneline --decorate --graph --all'
alias glol "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
alias glols "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat"
alias glod "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias glods "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias glola "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
alias ghist 'git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'

# Merge
alias gm 'git merge'
alias gma 'git merge --abort'
alias gmtl 'git mergetool --no-prompt'
alias gmtlvim 'git mergetool --no-prompt --tool=vimdiff'

# Rebase
alias grb 'git rebase'
alias grba 'git rebase --abort'
alias grbc 'git rebase --continue'
alias grbi 'git rebase -i'
alias grbo 'git rebase --onto'
alias grbs 'git rebase --skip'

# Remote / reset / restore
alias gr 'git remote'
alias gra 'git remote add'
alias grev 'git revert'
alias grh 'git reset'
alias grhh 'git reset --hard'
alias grm 'git rm'
alias grmc 'git rm --cached'
alias grmv 'git remote rename'
alias grrm 'git remote remove'
alias grs 'git restore'
alias grset 'git remote set-url'
alias grss 'git restore --source'
alias grst 'git restore --staged'
alias gru 'git reset --'
alias grup 'git remote update'
alias grv 'git remote -v'

# Show / status / stash
alias gsb 'git status -sb'
alias gsh 'git show'
alias gsps 'git show --pretty=short --show-signature'
alias gss 'git status -s'
alias gst 'git status'
alias gsta 'git stash push'
alias gstaa 'git stash apply'
alias gstc 'git stash clear'
alias gstd 'git stash drop'
alias gstl 'git stash list'
alias gstp 'git stash pop'
alias gsts 'git stash show --text'
alias gstu 'git stash --include-untracked'
alias gstall 'git stash --all'

# Submodule / switch / tags
alias gsi 'git submodule init'
alias gsu 'git submodule update'
alias gsw 'git switch'
alias gswc 'git switch -c'
alias gts 'git tag -s'
alias gtv 'git tag | sort -V'

# Updates
alias gup 'git pull --rebase'
alias gupv 'git pull --rebase -v'
alias gupa 'git pull --rebase --autostash'
alias gupav 'git pull --rebase --autostash -v'

# Watch / patch
alias gwch 'git whatchanged -p --abbrev-commit --pretty=medium'
alias gam 'git am'
alias gamc 'git am --continue'
alias gams 'git am --skip'
alias gama 'git am --abort'
alias gamscp 'git am --show-current-patch'
