#
# Actionable Git status
#

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

source "$SPACESHIP_ROOT/sections/git_status_options.zsh"

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GIT_STATUS_ACTIONABLE_SHOW="${SPACESHIP_GIT_STATUS_ACTIONABLE_SHOW="$SPACESHIP_GIT_STATUS_SHOW"}"
SPACESHIP_GIT_STATUS_ACTIONABLE_PREFIX="${SPACESHIP_GIT_STATUS_ACTIONABLE_PREFIX="$SPACESHIP_GIT_STATUS_PREFIX"}"
SPACESHIP_GIT_STATUS_ACTIONABLE_SUFFIX="${SPACESHIP_GIT_STATUS_ACTIONABLE_SUFFIX="$SPACESHIP_GIT_STATUS_SUFFIX"}"
SPACESHIP_GIT_STATUS_ACTIONABLE_COLOR="${SPACESHIP_GIT_STATUS_ACTIONABLE_COLOR="$SPACESHIP_GIT_STATUS_COLOR"}"
SPACESHIP_GIT_STATUS_ACTIONABLE_UNTRACKED="${SPACESHIP_GIT_STATUS_ACTIONABLE_UNTRACKED="$SPACESHIP_GIT_STATUS_UNTRACKED"}"
SPACESHIP_GIT_STATUS_ACTIONABLE_STAGED="${SPACESHIP_GIT_STATUS_ACTIONABLE_STAGED="$SPACESHIP_GIT_STATUS_ADDED"}"
SPACESHIP_GIT_STATUS_ACTIONABLE_MODIFIED="${SPACESHIP_GIT_STATUS_ACTIONABLE_MODIFIED="$SPACESHIP_GIT_STATUS_MODIFIED"}"
SPACESHIP_GIT_STATUS_ACTIONABLE_DELETED="${SPACESHIP_GIT_STATUS_ACTIONABLE_DELETED="$SPACESHIP_GIT_STATUS_DELETED"}"
SPACESHIP_GIT_STATUS_ACTIONABLE_STASHED="${SPACESHIP_GIT_STATUS_ACTIONABLE_STASHED="$SPACESHIP_GIT_STATUS_STASHED"}"
SPACESHIP_GIT_STATUS_ACTIONABLE_UNMERGED="${SPACESHIP_GIT_STATUS_ACTIONABLE_UNMERGED="$SPACESHIP_GIT_STATUS_UNMERGED"}"
SPACESHIP_GIT_STATUS_ACTIONABLE_AHEAD="${SPACESHIP_GIT_STATUS_ACTIONABLE_AHEAD="$SPACESHIP_GIT_STATUS_AHEAD"}"
SPACESHIP_GIT_STATUS_ACTIONABLE_BEHIND="${SPACESHIP_GIT_STATUS_ACTIONABLE_BEHIND="$SPACESHIP_GIT_STATUS_BEHIND"}"
SPACESHIP_GIT_STATUS_ACTIONABLE_DIVERGED="${SPACESHIP_GIT_STATUS_ACTIONABLE_DIVERGED="$SPACESHIP_GIT_STATUS_DIVERGED"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# A Git status where icons show changes that are not in the index yet.
# This way, your icons are like a TODO list, "your job" (kinda) is to replace
# all of the icons with + and then commit.
# See PR #359 at https://git.io/vACxq
# See git help status to know more about status formats
spaceship_git_status_actionable() {
  [[ $SPACESHIP_GIT_STATUS_ACTIONABLE_SHOW == false ]] && return

  spaceship::is_git || return

  local INDEX git_status=""

  INDEX=$(command git status --porcelain -b 2> /dev/null)

  # Check for untracked files
  if $(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_ACTIONABLE_UNTRACKED$git_status"
  fi

  # Check for staged files
  if $(echo "$INDEX" | command grep '^[MARC][ MD] ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_ACTIONABLE_STAGED$git_status"
  elif $(echo "$INDEX" | command grep '^D[ M] ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_ACTIONABLE_STAGED$git_status"
  fi

  # Check for modified files
  if $(echo "$INDEX" | command grep '^[ MARC]M ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_ACTIONABLE_MODIFIED$git_status"
  fi

  # Check for deleted files
  if $(echo "$INDEX" | command grep '^[ MARC]D ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_ACTIONABLE_DELETED$git_status"
  fi

  # Check for unmerged files
  if $(echo "$INDEX" | command grep '^U[DAU] ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_ACTIONABLE_UNMERGED$git_status"
  elif $(echo "$INDEX" | command grep '^A[UA] ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_ACTIONABLE_UNMERGED$git_status"
  elif $(echo "$INDEX" | command grep '^D[DU] ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_ACTIONABLE_UNMERGED$git_status"
  fi

  # Check for stashes
  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    git_status="$SPACESHIP_GIT_STATUS_ACTIONABLE_STASHED$git_status"
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
    git_status="$SPACESHIP_GIT_STATUS_ACTIONABLE_DIVERGED$git_status"
  else
    [[ "$is_ahead" == true ]] && git_status="$SPACESHIP_GIT_STATUS_ACTIONABLE_AHEAD$git_status"
    [[ "$is_behind" == true ]] && git_status="$SPACESHIP_GIT_STATUS_ACTIONABLE_BEHIND$git_status"
  fi

  if [[ -n $git_status ]]; then
    # Status prefixes are colorized
    spaceship::section \
      "$SPACESHIP_GIT_STATUS_ACTIONABLE_COLOR" \
      "$SPACESHIP_GIT_STATUS_ACTIONABLE_PREFIX$git_status$SPACESHIP_GIT_STATUS_ACTIONABLE_SUFFIX"
  fi
}
