# editor
abbr -a v 'nvim'
abbr -a v. 'nvim .'
abbr -a c 'code .'

# git
abbr -a ghist 'git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
abbr -a gup 'git pull --rebase --autostash'

# docker
abbr -a dps 'docker ps'
abbr -a drit 'docker run -it'
abbr -a deit 'docker exec -it'
abbr -a dcna 'docker container ls -a'
abbr -a di 'docker images'
abbr -a drmi 'docker rmi'
abbr -a dbu 'docker build'
abbr -a duon 'docker update --restart=always'
abbr -a duoff 'docker update --restart=no'
abbr -a dcci 'docker rmi (docker images -f "dangling=true" -q) -f'
abbr -a dcvi 'docker volume rm (docker volume ls -qf dangling=true)'

# docker compose
abbr -a dcb 'docker compose build'
abbr -a dcu 'docker compose up'
abbr -a dcd 'docker compose down'
abbr -a dcr 'docker compose restart'
abbr -a dcs 'docker compose stop'

# k9s
abbr -a kdev 'k9s --context showmojo-dev'
abbr -a kstag 'k9s --context showmojo-staging'
abbr -a kprod 'k9s --context showmojo-prod'

# ruby / rails
abbr -a irbs 'irb --simple-prompt'
abbr -a rr 'bin/rails routes'
abbr -a rrg 'bin/rails routes | grep'
abbr -a rdbm 'bin/rails db:migrate'
abbr -a rdbr 'bin/rails db:drop db:create db:migrate db:seed'
abbr -a bi 'bundle install --jobs 20 --retry 5'
abbr -a bu 'bundle update --jobs 20 --retry 5'

# shell / linux
abbr -a lla 'ls -lah'
abbr -a ports 'ss -lntu'
abbr -a startup_errors 'journalctl -p err -b'
abbr -a previous_boot_errors 'journalctl --boot=-1 --priority=3 --catalog --no-pager'
abbr -a scan 'sudo nmap -sn'
abbr -a sysinfo 'sudo inxi -Fx'
abbr -a shsrv 'systemctl list-units --type=service'
abbr -a srvall 'systemctl list-unit-files --type=service'
