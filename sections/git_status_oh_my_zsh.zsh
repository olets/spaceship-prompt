#
# oh-my-zsh Git status
#

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

source "$SPACESHIP_ROOT/sections/git_status_options.zsh"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# oh-my-zsh's `git_prompt_status`, adapted for use by Spaceship prompt
# https://github.com/robbyrussell/oh-my-zsh
# See git help status to know more about status formats
spaceship_git_status_oh_my_zsh() {
  [[ $SPACESHIP_GIT_STATUS_SHOW == false ]] && return

  local INDEX git_status=""

  INDEX=$(command git status --porcelain -b 2> /dev/null)

  # Check for untracked files
  if $(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_UNTRACKED$git_status"
  fi

  # Check for added files
  if $(echo "$INDEX" | command grep '^A  ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_ADDED$git_status"
  elif $(echo "$INDEX" | command grep '^M  ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_ADDED$git_status"
  elif $(echo "$INDEX" | command grep '^MM ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_ADDED$git_status"
  fi

  # Check for modified files
  if $(echo "$INDEX" | command grep '^ M ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_MODIFIED$git_status"
  elif $(echo "$INDEX" | command grep '^AM ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_MODIFIED$git_status"
  elif $(echo "$INDEX" | command grep '^MM ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_MODIFIED$git_status"
  elif $(echo "$INDEX" | command grep '^ T ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_MODIFIED$git_status"
  fi

  # Check for renamed files
  if $(echo "$INDEX" | command grep '^R  ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_RENAMED$git_status"
  fi

  # Check for deleted files
  if $(echo "$INDEX" | command grep '^ D ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_DELETED$git_status"
  elif $(echo "$INDEX" | command grep '^D  ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_DELETED$git_status"
  elif $(echo "$INDEX" | command grep '^AD ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_DELETED$git_status"
  fi

  # Check for stashes
  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    git_status="$SPACESHIP_GIT_STATUS_STASHED$git_status"
  fi

  # Check for unmerged files
  if $(echo "$INDEX" | command grep '^UU ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_UNMERGED$git_status"
  fi

  # Check whether branch is ahead
  local is_ahead=false
  if $(echo "$INDEX" | command grep '^## [^ ]\+ .*ahead' &> /dev/null); then
    is_ahead=true
  fi

  # Check whether branch is behind
  local is_behind=false
  if $(echo "$INDEX" | command grep '^## [^ ]\+ .*behind' &> /dev/null); then
    is_behind=true
  fi

  # Check wheather branch has diverged
  if [[ "$is_ahead" == true && "$is_behind" == true ]]; then
    git_status="$SPACESHIP_GIT_STATUS_DIVERGED$git_status"
  else
    [[ "$is_ahead" == true ]] && git_status="$SPACESHIP_GIT_STATUS_AHEAD$git_status"
    [[ "$is_behind" == true ]] && git_status="$SPACESHIP_GIT_STATUS_BEHIND$git_status"
  fi

  if [[ -n $git_status ]]; then
    # Status prefixes are colorized
    spaceship::section \
      "$SPACESHIP_GIT_STATUS_COLOR" \
      "$SPACESHIP_GIT_STATUS_PREFIX$git_status$SPACESHIP_GIT_STATUS_SUFFIX"
  fi
}
