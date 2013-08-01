# .bashrc

export HISTFILESIZE=5000
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
export EDITOR=vim
export TERM=xterm-color

alias pu="phpunit --verbose --colors --debug --no-globals-backup --process-isolation"

if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
  alias mysql=/usr/local/mysql/bin/mysql
  alias mysqladmin=/usr/local/mysql/bin/mysqladmin
  alias mysqldump=/usr/local/mysql/bin/mysqldump
  alias flushdns='dscacheutil -flushcache;sudo killall -HUP mDNSResponder'
fi



function rm_safe () {
  local path
  for path in "$@"; do
    # ignore any arguments
    if [[ "$path" = -* ]]; then :
    else
      local dst=${path##*/}
      # append the time if necessary
      while [ -e ~/.trash/"$dst" ]; do
        dst="$dst "$(date +%H-%M-%S)
      done
      mv "$path" ~/.trash/"$dst"
    fi
  done
}

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

#PS1="\w \$(parse_git_branch)\$ 


if [[ $TERM != "xterm" && $TERM != "xterm-color" ]]; then
  echo "TERM=vim"
  PS1='
\w
$ '
else
  PS1="
\[\033[34m\u@\h\033[0m\]
\[\033[32m\w\033[0m\]
\$(parse_git_branch)\$ "
fi
export PS1


alias grep='grep -i'
alias rm='rm_safe'
alias ls='ls'
alias settitle='set t=$cwd:h;echo -n "^[]2;${HOSTNAME}^G"'
alias pp='python -c "import sys, json; print json.dumps(json.load(sys.stdin), sort_keys=True, indent=4)"'
alias diffsvn='svn diff --diff-cmd diff -x -uw'


export HISTSIZE=5000
export HISTCONTROL=ignoreboth

alias gitbranch="git name-rev --name-only HEAD"

# ADD PYTHIN PATH
export PATH=$PATH:$home/bin:/usr/local/python/bin/
export PYTHONPATH=$PYTHONPATH:/home/johnny/sandbox/app/bin/

source ~/.git-completion.sh

function git-time {
    for k in `git branch|perl -pe s/^..//`;
    do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;
    done|sort -r
}

function fucking_weather {
    curl -s http://thefuckingweather.com/?zipcode=$(curl -sA Mozilla http://whatismyipaddress.com/ip/$(curl -sA Mozilla http://whatismyipaddress.com | sed 's/<[^>]*>//g;s/^['$'\t'']*//g;/[A-Z]/d' | grep "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}") | grep "Postal Code:" | sed 's/<[^>]*>//g;s/Postal Code\://') | grep '"content\|"remark\|"flavor\|span' | sed 's/<[^>]*>//g;s/&\#176\;/°/;s/^['$'\t'']*//g;/^[[:space:]]/d'
}
alias weather='fucking_weather'

