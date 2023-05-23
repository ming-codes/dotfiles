
_fzf_complete_gh() {
  local ARGS="$@"

  if [[ $ARGS == 'gh pr checkout'* ]]; then
    local pull_requests=$(gh pr list --repo thousandeyes/cea-frontend-service | cat -t | sed "s/\^I/|/g" | column -t -s "|")

    _fzf_complete --reverse --multi -- "$@" < <(
        echo $pull_requests
    )
  else
      eval "zle ${fzf_default_completion:-expand-or-complete}"
  fi
}

_fzf_complete_gh_post() {
  awk '{print $1}'
}

