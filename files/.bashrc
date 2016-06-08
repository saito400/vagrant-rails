# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export RBENV_ROOT=/usr/local/rbenv
export PATH="${RBENV_ROOT}/bin:${PATH}"
eval "$(rbenv init -)"
