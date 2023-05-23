
_fzf_complete_git() {
  local args="$@"

  if [[ $args == *'--'* || $args == 'git rm'* ]]; then
    _fzf_complete --reverse --multi --prompt="refs> " -- "$@" < <(
      _fzf_compgen_dir .
    )
    
  elif [[ $args == 'git co'* || $args == 'git br'* ]]; then
    _fzf_complete --reverse --multi --prompt="refs> " -- "$@" < <(
      git show-ref  | cut -d '/' -f 3- | sed  '/^$/d'
    )
  else
      eval "zle ${fzf_default_completion:-expand-or-complete}"
  fi
}
