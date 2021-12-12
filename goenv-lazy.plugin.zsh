# Try to find goenv, if it's not on the path
export GOENV_ROOT="${GOENV_ROOT:=${HOME}/.goenv}"
if ! type goenv > /dev/null && [ -f "${GOENV_ROOT}/bin/goenv" ]; then
    export PATH="${GOENV_ROOT}/bin:${PATH}"
fi

# Lazy load goenv
if type goenv > /dev/null; then
    export PATH="${GOENV_ROOT}/bin:${GOENV_ROOT}/shims:${PATH}"
    source ~/.goenv/completions/goenv.zsh
    function goenv() {
        unset -f goenv
        eval "$(command goenv init -)"
        goenv $@
    }
fi
