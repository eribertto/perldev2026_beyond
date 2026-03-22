# .bashrc for Fedora Linux 44 
# Linux fedora 6.19.8-300.fc44.x86_64 
# Sat Mar 21 05:05:31 PM +03 2026

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export BROWSER=vivaldi
export EDITOR=vim
export VISUAL=vim

bind "set completion-ignore-case on"

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
export SYSTEMD_PAGER=bat

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# perlbrew
source ~/perl5/perlbrew/etc/bashrc
alias grep='grep -i --color=auto'
alias c=clear
alias ls='lsd -t --color=auto'
alias ll='lsd -lt --color=auto'
cdls() { \cd "$@" && lsd; }
alias cd=cdls
echo "Hello there $USER, welcome to $(hostnamectl | uname -a | awk '{ print $1, $2, $3 }')"
echo "You have *$(task | tail -n1)* pending. Please complete them asap."
