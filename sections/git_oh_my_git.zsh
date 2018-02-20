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

# General
SPACESHIP_GIT_OMG_ALERT_COLOR="${SPACESHIP_GIT_OMG_ALERT_COLOR="yellow"}"
SPACESHIP_GIT_OMG_PREFIX="${SPACESHIP_GIT_OMG_PREFIX=""}" # enhancement to OMG
SPACESHIP_GIT_OMG_SUFFIX="${SPACESHIP_GIT_OMG_SUFFIX=""}" # enhancement to OMG
SPACESHIP_GIT_OMG_ICONS="${SPACESHIP_GIT_OMG_ICONS=true}" # enhancement to OMG
SPACESHIP_GIT_OMG_EXPANDED="${SPACESHIP_GIT_OMG_EXPANDED=true}" # enhancement to OMG

# Status
SPACESHIP_GIT_OMG_STATUS_SHOW="${SPACESHIP_GIT_OMG_STATUS_SHOW=true}" # enhancement to OMG
SPACESHIP_GIT_OMG_STATUS_COLOR="${SPACESHIP_GIT_OMG_STATUS_COLOR="red"}"
SPACESHIP_GIT_OMG_STATUS_ALERT_COLOR="${SPACESHIP_GIT_OMG_STATUS_ALERT_COLOR="$SPACESHIP_GIT_OMG_ALERT_COLOR"}"
SPACESHIP_GIT_OMG_STATUS_ALERT_COLOR_ALT="${SPACESHIP_GIT_OMG_STATUS_ALERT_COLOR_ALT="blue"}"
if [[ $SPACESHIP_GIT_OMG_ICONS == true ]]; then
  SPACESHIP_GIT_OMG_STATUS_PREFIX="${SPACESHIP_GIT_OMG_STATUS_PREFIX="  "}"
  SPACESHIP_GIT_OMG_STATUS_SUFFIX="${SPACESHIP_GIT_OMG_STATUS_SUFFIX=""}"
  SPACESHIP_GIT_OMG_STASHED="${SPACESHIP_GIT_OMG_STASHED=" "}"
  SPACESHIP_GIT_OMG_UNTRACKED="${SPACESHIP_GIT_OMG_UNTRACKED=" "}"
  SPACESHIP_GIT_OMG_MODIFIED="${SPACESHIP_GIT_OMG_MODIFIED=" "}"
  SPACESHIP_GIT_OMG_DELETED="${SPACESHIP_GIT_OMG_DELETED=" "}"
  SPACESHIP_GIT_OMG_ADDED="${SPACESHIP_GIT_OMG_ADDED=" "}"
else                                                                    # enhancement to OMG
  SPACESHIP_GIT_OMG_STATUS_PREFIX="${SPACESHIP_GIT_OMG_STATUS_PREFIX="[ "}"
  SPACESHIP_GIT_OMG_STATUS_SUFFIX="${SPACESHIP_GIT_OMG_STATUS_SUFFIX=" ] "}"
  SPACESHIP_GIT_OMG_STASHED="${SPACESHIP_GIT_OMG_STASHED="$"}"
  SPACESHIP_GIT_OMG_UNTRACKED="${SPACESHIP_GIT_OMG_UNTRACKED="?"}"
  SPACESHIP_GIT_OMG_MODIFIED="${SPACESHIP_GIT_OMG_MODIFIED="!"}"
  SPACESHIP_GIT_OMG_DELETED="${SPACESHIP_GIT_OMG_DELETED="✘ "}"
  SPACESHIP_GIT_OMG_ADDED="${SPACESHIP_GIT_OMG_ADDED="+"}"
fi
SPACESHIP_GIT_OMG_CACHED_MODIFICATIONS="${SPACESHIP_GIT_OMG_CACHED_MODIFICATIONS=" "}"
SPACESHIP_GIT_OMG_CACHED_DELETIONS="${SPACESHIP_GIT_OMG_CACHED_DELETIONS=" "}"
SPACESHIP_GIT_OMG_ALL_STAGED="${SPACESHIP_GIT_OMG_ALL_STAGED=" "}"
SPACESHIP_GIT_OMG_ACTION_PREFIX="${SPACESHIP_GIT_OMG_ACTION_PREFIX="  "}" # enhancement to OMG

# Where
SPACESHIP_GIT_OMG_WHERE_SHOW="${SPACESHIP_GIT_OMG_WHERE_SHOW=true}" # enhancement to OMG
SPACESHIP_GIT_OMG_WHERE_COLOR="${SPACESHIP_GIT_OMG_WHERE_COLOR="magenta"}"
SPACESHIP_GIT_OMG_WHERE_ALERT_COLOR="${SPACESHIP_GIT_OMG_WHERE_ALERT_COLOR="$SPACESHIP_GIT_OMG_STATUS_ALERT_COLOR"}"
SPACESHIP_GIT_OMG_WHERE_PREFIX="${SPACESHIP_GIT_OMG_WHERE_PREFIX=" "}"
SPACESHIP_GIT_OMG_WHERE_SUFFIX="${SPACESHIP_GIT_OMG_WHERE_SUFFIX=""}"
if [[ $SPACESHIP_GIT_OMG_ICONS == true ]]; then
  SPACESHIP_GIT_OMG_WHERE_BRANCH_PREFIX="${SPACESHIP_GIT_OMG_WHERE_BRANCH_PREFIX="("}"
  SPACESHIP_GIT_OMG_WHERE_BRANCH_SUFFIX="${SPACESHIP_GIT_OMG_WHERE_BRANCH_SUFFIX=")"}"
else                                                                    # enhancement to OMG
  SPACESHIP_GIT_OMG_WHERE_BRANCH_PREFIX="${SPACESHIP_GIT_OMG_WHERE_BRANCH_PREFIX=""}"
  SPACESHIP_GIT_OMG_WHERE_BRANCH_SUFFIX="${SPACESHIP_GIT_OMG_WHERE_BRANCH_SUFFIX=""}"
fi
SPACESHIP_GIT_OMG_DETACHED="${SPACESHIP_GIT_OMG_DETACHED="  "}"
SPACESHIP_GIT_OMG_NOT_TRACKED="${SPACESHIP_GIT_OMG_NOT_TRACKED="  "}"
SPACESHIP_GIT_OMG_COMMITS_PREFIX="${SPACESHIP_GIT_OMG_COMMITS_PREFIX=" "}" # enhancement to OMG
SPACESHIP_GIT_OMG_COMMITS_SUFFIX="${SPACESHIP_GIT_OMG_COMMITS_SUFFIX=" "}" # enhancement to OMG
if [[ $SPACESHIP_GIT_OMG_ICONS == true ]]; then
  SPACESHIP_GIT_OMG_DIVERGED="${SPACESHIP_GIT_OMG_DIVERGED=" "}"
  SPACESHIP_GIT_OMG_BEHIND="${SPACESHIP_GIT_OMG_BEHIND=" "}"
  SPACESHIP_GIT_OMG_AHEAD="${SPACESHIP_GIT_OMG_AHEAD="  "}"
else                                                                    # enhancement to OMG
  SPACESHIP_GIT_OMG_DIVERGED="${SPACESHIP_GIT_OMG_DIVERGED="⇕ "}"
  SPACESHIP_GIT_OMG_BEHIND="${SPACESHIP_GIT_OMG_BEHIND="⇣ "}"
  SPACESHIP_GIT_OMG_AHEAD="${SPACESHIP_GIT_OMG_AHEAD="⇡ "}"
fi
SPACESHIP_GIT_OMG_REBASE_TRACKING="${SPACESHIP_GIT_OMG_REBASE_TRACKING=" "}"
if [[ $SPACESHIP_GIT_OMG_ICONS == true ]]; then
  SPACESHIP_GIT_OMG_MERGE_TRACKING="${SPACESHIP_GIT_OMG_MERGE_TRACKING=" "}"
else                                                                    # enhancement to OMG
  SPACESHIP_GIT_OMG_MERGE_TRACKING="${SPACESHIP_GIT_OMG_MERGE_TRACKING=" "}"
fi
SPACESHIP_GIT_OMG_SHOW_REMOTE="${SPACESHIP_GIT_OMG_SHOW_REMOTE=true}" # enhancement to OMG
SPACESHIP_GIT_OMG_TAG="${SPACESHIP_GIT_OMG_TAG="   "}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

enrich_append() {
  local flag=$1
  local indicator=$2
  local color=$3

  if [[ $flag == false ]]; then
    [[ $SPACESHIP_GIT_OMG_EXPANDED == false ]] && return
    indicator=' '
  fi

  if [[ -n "$color" ]]; then
    echo -n "%{%B%F{$color}%}"
    echo -n "${indicator}"
    echo -n "%{%B%F{$omg_color}%}"
  else
    echo -n "${indicator}"
  fi
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
  local action=${23}

  local omg_status omg_where omg_color omg_color_alert

  if [[ $SPACESHIP_GIT_OMG_STATUS_SHOW == true ]]; then
    omg_color="$SPACESHIP_GIT_OMG_STATUS_COLOR"
    omg_color_alert="$SPACESHIP_GIT_OMG_STATUS_ALERT_COLOR"

    # on filesystem
    omg_status+=$(enrich_append $has_stashes "$SPACESHIP_GIT_OMG_STASHED" "$SPACESHIP_GIT_OMG_STATUS_ALERT_COLOR_ALT")

    omg_status+=$(enrich_append $has_untracked_files "$SPACESHIP_GIT_OMG_UNTRACKED" "$omg_color_alert")
    omg_status+=$(enrich_append $has_modifications "$SPACESHIP_GIT_OMG_MODIFIED" "$omg_color_alert")
    omg_status+=$(enrich_append $has_deletions "$SPACESHIP_GIT_OMG_DELETED" "$omg_color_alert")

    # ready
    omg_status+=$(enrich_append $has_adds "$SPACESHIP_GIT_OMG_ADDED")
    omg_status+=$(enrich_append $has_modifications_cached "$SPACESHIP_GIT_OMG_CACHED_MODIFICATIONS")
    omg_status+=$(enrich_append $has_deletions_cached "$SPACESHIP_GIT_OMG_CACHED_DELETIONS")

    # next operation
    omg_status+=$(enrich_append $ready_to_commit "$SPACESHIP_GIT_OMG_ALL_STAGED" "$omg_color_alert")

    # current action
    omg_status+=$(enrich_append $action "${SPACESHIP_GIT_OMG_ACTION_PREFIX} $(get_current_action)" "$omg_color_alert")
  fi

  if [[ $SPACESHIP_GIT_OMG_WHERE_SHOW == true ]]; then
    omg_color="$SPACESHIP_GIT_OMG_WHERE_COLOR"
    omg_color_alert="$SPACESHIP_GIT_OMG_WHERE_ALERT_COLOR"

    # where
    if [[ $detached == true ]]; then
      omg_where+=$(enrich_append $detached "$SPACESHIP_GIT_OMG_DETACHED" "$omg_color_alert")
      omg_where+=$(enrich_append $detached "${SPACESHIP_GIT_OMG_WHERE_BRANCH_PREFIX}${current_commit_hash:0:7}${SPACESHIP_GIT_OMG_WHERE_BRANCH_SUFFIX}")
    else
      if [[ $has_upstream == false ]]; then
        if [[ $SPACESHIP_GIT_OMG_EXPANDED == true ]]; then
          omg_where+=$(enrich_append true "${SPACESHIP_GIT_OMG_COMMITS_PREFIX}—${SPACESHIP_GIT_OMG_NOT_TRACKED}—${SPACESHIP_GIT_OMG_COMMITS_SUFFIX}${SPACESHIP_GIT_OMG_WHERE_BRANCH_PREFIX}${current_branch}${SPACESHIP_GIT_OMG_WHERE_BRANCH_SUFFIX}")
        else
          omg_where+=$(enrich_append true "${SPACESHIP_GIT_OMG_NOT_TRACKED}${SPACESHIP_GIT_OMG_WHERE_BRANCH_PREFIX}${current_branch}${SPACESHIP_GIT_OMG_WHERE_BRANCH_SUFFIX}")
        fi
      else
        if [[ $will_rebase == true ]]; then
          local type_of_upstream=$SPACESHIP_GIT_OMG_REBASE_TRACKING
        else
          local type_of_upstream=$SPACESHIP_GIT_OMG_MERGE_TRACKING
        fi

        if [[ $has_diverged == true ]]; then
          omg_where+=""
          omg_where+=$(enrich_append true "${SPACESHIP_GIT_OMG_COMMITS_PREFIX}-${commits_behind}${SPACESHIP_GIT_OMG_DIVERGED}+${commits_ahead}${SPACESHIP_GIT_OMG_COMMITS_SUFFIX}" "$omg_color_alert")
        else
          if [[ $commits_behind -gt 0 ]]; then
            omg_where+=$(enrich_append true "${SPACESHIP_GIT_OMG_COMMITS_PREFIX}-${commits_behind}")
            omg_where+=$(enrich_append true "${SPACESHIP_GIT_OMG_BEHIND}" "$omg_color_alert")
            [[ "$SPACESHIP_GIT_OMG_EXPANDED" == true ]] && omg_where+=$(enrich_append true "—")
            omg_where+="$SPACESHIP_GIT_OMG_COMMITS_SUFFIX"
          fi
          if [[ $commits_ahead -gt 0 ]]; then
            omg_where+="$SPACESHIP_GIT_OMG_COMMITS_PREFIX"
            [[ $SPACESHIP_GIT_OMG_EXPANDED == true ]] && omg_where+=$(enrich_append true "${SPACESHIP_GIT_OMG_COMMITS_PREFIX}—")
            omg_where+=$(enrich_append true "${SPACESHIP_GIT_OMG_AHEAD}" "$omg_color_alert")
            omg_where+=$(enrich_append true "+${commits_ahead}${SPACESHIP_GIT_OMG_COMMITS_SUFFIX}")
          fi
          if [[ $SPACESHIP_GIT_OMG_EXPANDED == true && $commits_ahead == 0 && $commits_behind == 0 ]]; then
            omg_where+=$(enrich_append true "${SPACESHIP_GIT_OMG_COMMITS_PREFIX}— —${SPACESHIP_GIT_OMG_COMMITS_SUFFIX}")
          fi
        fi

        if [[ $SPACESHIP_GIT_OMG_SHOW_REMOTE == true ]]; then
          omg_where+=$(enrich_append true "${SPACESHIP_GIT_OMG_WHERE_BRANCH_PREFIX}${current_branch} ${type_of_upstream}${upstream//\/$current_branch/}${SPACESHIP_GIT_OMG_WHERE_BRANCH_SUFFIX}")
        else
          omg_where+=$(enrich_append true "${SPACESHIP_GIT_OMG_WHERE_BRANCH_PREFIX}${type_of_upstream}${current_branch}${SPACESHIP_GIT_OMG_WHERE_BRANCH_SUFFIX}")
        fi
      fi
    fi
    [[ $is_on_a_tag == true ]] && omg_where+=$(enrich_append true "${SPACESHIP_GIT_OMG_TAG}${tag_at_current_commit}")
  fi

  if [[ -n "$omg_status" ]]; then
    # Status prefixes are colorized
    spaceship::section \
      "$SPACESHIP_GIT_OMG_STATUS_COLOR" \
      "$SPACESHIP_GIT_OMG_PREFIX$SPACESHIP_GIT_OMG_STATUS_PREFIX${omg_status}$SPACESHIP_GIT_OMG_STATUS_SUFFIX"
  fi

  if [[ -n "$omg_where" && "$omg_where" != ' ' ]]; then
    # Status prefixes are colorized
    spaceship::section \
      "$SPACESHIP_GIT_OMG_WHERE_COLOR" \
      "$SPACESHIP_GIT_OMG_WHERE_PREFIX${omg_where}$SPACESHIP_GIT_OMG_WHERE_SUFFIX$SPACESHIP_GIT_OMG_SUFFIX"
  fi
}

spaceship_git_oh_my_git() {
  [[ $SPACESHIP_GIT_SHOW == false ]] && return

  build_prompt
}
