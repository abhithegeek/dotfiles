cd /scratch/abhshsha/idaas-console

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#export PS1="[\u@\h:\W]$ " # Command prompt format.
export PS1="\u@\h\[\033[33m\]\$(parse_git_branch) \[\033[32m\]\W\[\033[00m\]\n$ "

#source /usr/local/remote/allarch/noarch/admin/scripts/Proxy-Config-set.sh
export http_proxy=http://www-proxy.us.oracle.com:80
export https_proxy=http://www-proxy.us.oracle.com:80
export no_proxy=.us.oracle.com,.oraclecorp.com,.oracle.com
export no_proxy="idaas-webtier-1,$no_proxy"
export CDPATH=.:/scratch/abhshsha/idaas-console
export PATH=~/.vim/fzf/bin:/opt/vim/bin:/opt/nvim/bin:/opt/autoconf/bin:/scratch/abhshsha/firefox-45:/scratch/abhshsha/idaas-console/node_modules/.bin:$PATH
source /scratch/$USER/idcs/bin/setupenv.sh
# cargo for ripgrep
source $HOME/.cargo/env
# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS="--extended --layout=reverse --border"

# alias
alias ui-srv='export ADMIN_SRV_HOME=/scratch/$USER/idcs/code/idaas/admin-srv/build/install/admin-srv && cd /scratch/$USER/idaas-console/www/ && ./ui-srv /scratch/idcs/app/data/conf/boot.conf.local'

cl() {
  cd "$1" && ls -F;
}

gch() {
  git checkout `(git branch | fzf)`;
}

gchr() {
  git fetch;
  git checkout `(git branch -r | fzf)`
}

gco() {
  git commit;
}

gp() {
  git push -u origin HEAD;
}
