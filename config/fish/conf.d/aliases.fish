# editor
alias v 'nvim'
alias v. 'nvim .'
alias c 'code .'

# docker
alias dps 'docker ps'
alias drit 'docker run -it'
alias deit 'docker exec -it'
alias dcna 'docker container ls -a'
alias di 'docker images'
alias drmi 'docker rmi'
alias dbu 'docker build'
alias duon 'docker update --restart=always'
alias duoff 'docker update --restart=no'
alias dcci 'docker rmi (docker images -f "dangling=true" -q) -f'
alias dcvi 'docker volume rm (docker volume ls -qf dangling=true)'

# docker compose
alias dcb 'docker compose build'
alias dcu 'docker compose up'
alias dcd 'docker compose down'
alias dcr 'docker compose restart'
alias dcs 'docker compose stop'

# k9s
alias kdev 'k9s --context showmojo-dev'
alias kstag 'k9s --context showmojo-staging'
alias kprod 'k9s --context showmojo-prod'

# ruby / rails
alias irbs 'irb --simple-prompt'
alias rr 'bin/rails routes'
alias rrg 'bin/rails routes | grep'
alias rdbm 'bin/rails db:migrate'
alias rdbr 'bin/rails db:drop db:create db:migrate db:seed'
alias bi 'bundle install --jobs 20 --retry 5'
alias bu 'bundle update --jobs 20 --retry 5'

# shell / linux
alias lla 'ls -lah'
alias ports 'ss -lntu'
alias startup_errors 'journalctl -p err -b'
alias previous_boot_errors 'journalctl --boot=-1 --priority=3 --catalog --no-pager'
alias scan 'sudo nmap -sn'
alias sysinfo 'sudo inxi -Fx'
alias shsrv 'systemctl list-units --type=service'
alias srvall 'systemctl list-unit-files --type=service'

alias ll 'eza -lah --git --icons'
alias la 'eza -lah --git --icons'
alias lt 'eza --tree --level=2 --icons'
alias lta 'eza --tree --level=2 --icons -a'

# projects
alias dotfiles 'cd ~/Projects/dotfiles/'
