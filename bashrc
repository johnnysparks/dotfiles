# .bashrc

export HISTFILESIZE=5000
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
export EDITOR=vim
export TERM=xterm-color
export HISTSIZE=5000
export HISTCONTROL=ignoreboth

# shortcuts
alias flushdns='sudo /etc/init.d/nscd restart; sudo /etc/init.d/dnsmasq restart'
#alias rm='rm_safe'

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
  alias mysql=/usr/local/mysql/bin/mysql
  alias mysqladmin=/usr/local/mysql/bin/mysqladmin
  alias mysqldump=/usr/local/mysql/bin/mysqldump
  alias flushdns='dscacheutil -flushcache;sudo killall -HUP mDNSResponder'

fi


# FUNCTIONS
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

function git-time {
    for k in `git branch|perl -pe s/^..//`;
    do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;
    done
}

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

# TERMINAL PROMPT SETUP
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

# ADD PYTH0N PATH
unset PATH
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/home/johnny/bin
PATH=$PATH:$HOME/.rvm/bin 

unset PYTHONPATH

# GO PATH
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin


# Add RVM to PATH for version swapping
if [[ -s $HOME/.rvm/scripts/rvm ]]; then
  source $HOME/.rvm/scripts/rvm;
fi

# CLI Git completion installation
. $HOME/dotfiles/git-completion.bash




# added by travis gem
[ -f /Users/johnny/.travis/travis.sh ] && source /Users/johnny/.travis/travis.sh
