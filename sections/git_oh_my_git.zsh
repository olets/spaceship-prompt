#
# oh-my-git Git status
#
# oh-my-git, adapted for use by Spaceship Prompt
# https://github.com/arialdomartini/oh-my-git/
# Reference version: https://raw.githubusercontent.com/arialdomartini/oh-my-git/fd13327094d0ff2db3d713f21942f0419acb1dfb/prompt.sh

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

source "$SPACESHIP_ROOT/sections/git_oh_my_git_base.zsh"

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

# Spaceship git branch
SPACESHIP_GIT_BRANCH_COLOR="${SPACESHIP_GIT_BRANCH_COLOR="magenta"}"
SPACESHIP_GIT_BRANCH_PREFIX="${SPACESHIP_GIT_BRANCH_PREFIX=""}"
SPACESHIP_GIT_BRANCH_SUFFIX="${SPACESHIP_GIT_BRANCH_SUFFIX=""}"
# Spaceship git status
SPACESHIP_GIT_STATUS_SHOW="${SPACESHIP_GIT_STATUS_SHOW=true}"
SPACESHIP_GIT_STATUS_COLOR="${SPACESHIP_GIT_STATUS_COLOR="red"}"
SPACESHIP_GIT_STATUS_PREFIX="${SPACESHIP_GIT_STATUS_PREFIX="  "}"
SPACESHIP_GIT_STATUS_SUFFIX="${SPACESHIP_GIT_STATUS_SUFFIX=" "}"
SPACESHIP_GIT_STATUS_UNTRACKED="${SPACESHIP_GIT_STATUS_UNTRACKED=" "}"
SPACESHIP_GIT_STATUS_ADDED="${SPACESHIP_GIT_STATUS_ADDED=" "}"
SPACESHIP_GIT_STATUS_MODIFIED="${SPACESHIP_GIT_STATUS_MODIFIED=" "}"
SPACESHIP_GIT_STATUS_DELETED="${SPACESHIP_GIT_STATUS_DELETED=" "}"
SPACESHIP_GIT_STATUS_STASHED="${SPACESHIP_GIT_STATUS_STASHED=" "}"
SPACESHIP_GIT_STATUS_DIVERGED="${SPACESHIP_GIT_STATUS_DIVERGED=" "}"
SPACESHIP_GIT_STATUS_CAN_FAST_FORWARD="${SPACESHIP_GIT_STATUS_CAN_FAST_FORWARD=" "}"
SPACESHIP_GIT_STATUS_SHOULD_PUSH="${SPACESHIP_GIT_STATUS_SHOULD_PUSH="  "}"
# added for OMG
SPACESHIP_GIT_STATUS_HAS_CACHED_DELETIONS="${SPACESHIP_GIT_STATUS_HAS_CACHED_DELETIONS=" "}"
SPACESHIP_GIT_STATUS_HAS_CACHED_MODIFICATIONS="${SPACESHIP_GIT_STATUS_HAS_CACHED_MODIFICATIONS=" "}"
SPACESHIP_GIT_STATUS_READY_TO_COMMIT="${SPACESHIP_GIT_STATUS_READY_TO_COMMIT=" "}"
SPACESHIP_GIT_STATUS_IS_ON_A_TAG="${SPACESHIP_GIT_STATUS_IS_ON_A_TAG=" "}"
SPACESHIP_DETACHED="${SPACESHIP_DETACHED=" "}"
SPACESHIP_GIT_STATUS_NOT_TRACKED_BRANCH="${SPACESHIP_GIT_STATUS_NOT_TRACKED_BRANCH="  "}"
SPACESHIP_GIT_STATUS_REBASE_TRACKING_BRANCH="${SPACESHIP_GIT_STATUS_REBASE_TRACKING_BRANCH=" "}"
SPACESHIP_GIT_STATUS_MERGE_TRACKING_BRANCH="${SPACESHIP_GIT_STATUS_MERGE_TRACKING_BRANCH=" "}"
SPACESHIP_GIT_ALERT_COLOR="${SPACESHIP_GIT_ALERT_COLOR="yellow"}"
SPACESHIP_GIT_STATUS_ALERT_COLOR="${SPACESHIP_GIT_STATUS_ALERT_COLOR="$SPACESHIP_GIT_ALERT_COLOR"}"
SPACESHIP_GIT_BRANCH_ALERT_COLOR="${SPACESHIP_GIT_BRANCH_ALERT_COLOR="$SPACESHIP_GIT_ALERT_COLOR"}"
SPACESHIP_GIT_STASH_COLOR="${SPACESHIP_GIT_STASH_COLOR="$SPACESHIP_GIT_STATUS_COLOR"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

enrich_append() {
  [[ -z $2 ]] && return

  local flag=$1
  local symbol=$2
  local color=${3:-"$OMG_DEFAULT_COLOR"}

  [[ $flag == false ]] && symbol=' '

  echo -n "%{%B%F{$color}%}"             # set color
  echo -n "${symbol}"                    # section content
  echo -n "%{%B%F{$OMG_DEFAULT_COLOR}%}" # unset color
}

custom_build_prompt() {
  local enabled=${1}
  local current_commit_hash=${2}
  local is_a_git_repo=${3}
  local current_branch=$4
  local detached=${5}
  local just_init=${6}
  local has_modifications=${7}
  local has_modifications_cached=${8}
  local has_adds=${9}
  local has_deletions=${10}
  local has_deletions_cached=${11}
  local has_untracked_files=${12}
  local ready_to_commit=${13}
  local tag_at_current_commit=${14}
  local is_on_a_tag=${15}
  local has_upstream=${16}
  local commits_ahead=${17}
  local commits_behind=${18}
  local has_diverged=${19}
  local should_push=${20}
  local will_rebase=${21}
  local has_stashes=${22}

  local omg_status omg_branch OMG_DEFAULT_COLOR="$SPACESHIP_GIT_STATUS_COLOR"

  # on filesystem
  omg_status+=$(enrich_append $has_stashes $SPACESHIP_GIT_STATUS_STASHED "$SPACESHIP_GIT_STASH_COLOR")

  omg_status+=$(enrich_append $has_untracked_files $SPACESHIP_GIT_STATUS_UNTRACKED "$SPACESHIP_GIT_STATUS_ALERT_COLOR")
  omg_status+=$(enrich_append $has_modifications $SPACESHIP_GIT_STATUS_MODIFIED "$SPACESHIP_GIT_STATUS_ALERT_COLOR")
  omg_status+=$(enrich_append $has_deletions $SPACESHIP_GIT_STATUS_DELETED "$SPACESHIP_GIT_STATUS_ALERT_COLOR")

  # ready
  omg_status+=$(enrich_append $has_adds $SPACESHIP_GIT_STATUS_ADDED)
  omg_status+=$(enrich_append $has_modifications_cached $SPACESHIP_GIT_STATUS_HAS_CACHED_MODIFICATIONS)
  omg_status+=$(enrich_append $has_deletions_cached $SPACESHIP_GIT_STATUS_HAS_CACHED_DELETIONS)

  # next operation
  omg_status+=$(enrich_append $ready_to_commit $SPACESHIP_GIT_STATUS_READY_TO_COMMIT "$SPACESHIP_GIT_STATUS_ALERT_COLOR")

  OMG_DEFAULT_COLOR="$SPACESHIP_GIT_BRANCH_COLOR"

  # where
  if [[ $detached == true ]]; then
    omg_branch+=$(enrich_append $detached $SPACESHIP_DETACHED "$SPACESHIP_GIT_BRANCH_ALERT_COLOR")
    omg_branch+=$(enrich_append $detached " ${SPACESHIP_GIT_BRANCH_PREFIX}${current_commit_hash:0:7}${SPACESHIP_GIT_BRANCH_SUFFIX}")
  else
    if [[ $has_upstream == false ]]; then
      omg_branch+=$(enrich_append true "—${SPACESHIP_GIT_STATUS_NOT_TRACKED_BRANCH}— ${SPACESHIP_GIT_BRANCH_PREFIX}${current_branch}${SPACESHIP_GIT_BRANCH_SUFFIX}")
    else
      if [[ $will_rebase == true ]]; then
        local type_of_upstream=$SPACESHIP_GIT_STATUS_REBASE_TRACKING_BRANCH
      else
        local type_of_upstream=$SPACESHIP_GIT_STATUS_MERGE_TRACKING_BRANCH
      fi

      if [[ $has_diverged == true ]]; then
        omg_branch+=$(enrich_append true "-${commits_behind} ${SPACESHIP_GIT_STATUS_DIVERGED}+${commits_ahead}" "$SPACESHIP_GIT_BRANCH_ALERT_COLOR")
      else
        if [[ $commits_behind -gt 0 ]]; then
          omg_branch+=$(enrich_append true "-${commits_behind}")
          omg_branch+=$(enrich_append true "${SPACESHIP_GIT_STATUS_BEHIND}" "$SPACESHIP_GIT_BRANCH_ALERT_COLOR")
          omg_branch+=$(enrich_append true " —")
        fi
        if [[ $commits_ahead -gt 0 ]]; then
          omg_branch+=$(enrich_append true "—")
          omg_branch+=$(enrich_append true "${SPACESHIP_GIT_STATUS_AHEAD}" "$SPACESHIP_GIT_BRANCH_ALERT_COLOR")
          omg_branch+=$(enrich_append true "+${commits_ahead}")
        fi
        if [[ $commits_ahead == 0 && $commits_behind == 0 ]]; then
          omg_branch+=$(enrich_append true "— —")
        fi

      fi
      omg_branch+=$(enrich_append true " ${SPACESHIP_GIT_BRANCH_PREFIX}${current_branch}${type_of_upstream}${upstream//\/$current_branch/}${SPACESHIP_GIT_BRANCH_SUFFIX}")
    fi
  fi
  omg_branch+=$(enrich_append ${is_on_a_tag} "${SPACESHIP_GIT_STATUS_IS_ON_A_TAG} ${tag_at_current_commit}")

  if [[ -n $omg_status ]]; then
    # Status prefixes are colorized
    spaceship::section \
    "$SPACESHIP_GIT_STATUS_COLOR" \
    "$SPACESHIP_GIT_STATUS_PREFIX${omg_status}$SPACESHIP_GIT_STATUS_SUFFIX"
  fi

  if [[ -n $omg_branch ]]; then
    # Status prefixes are colorized
    spaceship::section \
    "$SPACESHIP_GIT_BRANCH_COLOR" \
    "${omg_branch}"
  fi
}

spaceship_git_oh_my_git() {
  [[ $SPACESHIP_GIT_SHOW == false ]] && return

  build_prompt
}
