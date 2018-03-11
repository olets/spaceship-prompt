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
SPACESHIP_GIT_OMG_HIDE_INACTIVE="${SPACESHIP_GIT_OMG_HIDE_INACTIVE=true}" # enhancement to OMG
SPACESHIP_GIT_OMG_STATUS_FIRST="${SPACESHIP_GIT_OMG_STATUS_FIRST=true}" # enhancement to OMG

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
SPACESHIP_GIT_OMG_BRANCH_FULL_NAME="${SPACESHIP_GIT_OMG_BRANCH_FULL_NAME=true}" # enhancement to OMG
SPACESHIP_GIT_OMG_BRANCH_TRUNCATE_AFTER="${SPACESHIP_GIT_OMG_BRANCH_TRUNCATE_AFTER=10}" # enhancement to OMG
SPACESHIP_GIT_OMG_BRANCH_HEAD_LENGTH="${SPACESHIP_GIT_OMG_BRANCH_HEAD_LENGTH=4}" # enhancement to OMG
SPACESHIP_GIT_OMG_BRANCH_TAIL_LENGTH="${SPACESHIP_GIT_OMG_BRANCH_TAIL_LENGTH=3}" # enhancement to OMG
SPACESHIP_GIT_OMG_SHOW_UPSTREAM="${SPACESHIP_GIT_OMG_SHOW_UPSTREAM=true}" # enhancement to OMG
SPACESHIP_GIT_OMG_SHOW_UPSTREAM_ORIGINSAME="${SPACESHIP_GIT_OMG_SHOW_UPSTREAM_ORIGINSAME=true}" # enhancement to OMG
SPACESHIP_GIT_OMG_TAG="${SPACESHIP_GIT_OMG_TAG="   "}"
SPACESHIP_GIT_OMG_TAG_FULL_NAME="${SPACESHIP_GIT_OMG_TAG_FULL_NAME="$SPACESHIP_GIT_OMG_BRANCH_FULL_NAME"}" # enhancement to OMG
SPACESHIP_GIT_OMG_TAG_TRUCATE_AFTER="${SPACESHIP_GIT_OMG_TAG_TRUCATE_AFTER="$SPACESHIP_GIT_OMG_BRANCH_TRUNCATE_AFTER"}" # enhancement to OMG
SPACESHIP_GIT_OMG_TAG_HEAD_LENGTH="${SPACESHIP_GIT_OMG_TAG_HEAD_LENGTH="$SPACESHIP_GIT_OMG_BRANCH_HEAD_LENGTH"}" # enhancement to OMG
SPACESHIP_GIT_OMG_TAG_TAIL_LENGTH="${SPACESHIP_GIT_OMG_TAG_TAIL_LENGTH="$SPACESHIP_GIT_OMG_BRANCH_TAIL_LENGTH"}" # enhancement to OMG
# SPACESHIP_GIT_OMG_TRIM_BRANCH_NAME="${SPACESHIP_GIT_OMG_TRIM_BRANCH_NAME=false}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

enrich_append() {
  local flag=$1
  local indicator=$2
  local color=$3
  local override_hide_inactive=${4:-false}

  if [[ $flag == false ]]; then
    if [[ $override_hide_inactive == false && $SPACESHIP_GIT_OMG_HIDE_INACTIVE == false ]]; then
      color="''"
    else
      [[ $SPACESHIP_GIT_OMG_EXPANDED == false ]] && return
      indicator=' '
    fi
  fi

  if [[ -n "$color" ]]; then
    echo -n "%{%B%F{$color}%}"
    echo -n "${indicator}"
    echo -n "%{%B%F{$omg_color}%}"
  else
    echo -n "${indicator}"
  fi
}

truncate_string() {
  local string=$1
  local max_length=$2

  if [[ ${#string} -gt $max_length ]]; then
    local char_count_head=$3
    local char_count_tail=$4

    if [[ ${#string} -gt (( $char_count_head + $char_count_tail )) ]]; then
      string="${string:0:$char_count_head}…${string:(-$char_count_tail)}"
    fi
  fi

  echo -n $string
}

spaceship_git_oh_my_git_status() {
  if [[ -n "$omg_status" ]]; then
    spaceship_omg_status="$SPACESHIP_GIT_OMG_STATUS_PREFIX$omg_status$SPACESHIP_GIT_OMG_STATUS_SUFFIX"
    if [[ $SPACESHIP_GIT_OMG_STATUS_FIRST == true ]]; then
      spaceship_omg_status="$SPACESHIP_GIT_OMG_PREFIX$spaceship_omg_status"
    else
      spaceship_omg_status+="$SPACESHIP_GIT_OMG_SUFFIX"
    fi
    # Status prefixes are colorized
    spaceship::section \
      "$SPACESHIP_GIT_OMG_STATUS_COLOR" "$spaceship_omg_status"
  fi
}

spaceship_git_oh_my_git_where() {
  if [[ -n "$omg_where" && "$omg_where" != ' ' ]]; then
    spaceship_omg_where="$SPACESHIP_GIT_OMG_WHERE_PREFIX$omg_where$SPACESHIP_GIT_OMG_WHERE_SUFFIX"
    if [[ $SPACESHIP_GIT_OMG_STATUS_FIRST == true ]]; then
      spaceship_omg_where+="$SPACESHIP_GIT_OMG_SUFFIX"
    else
      spaceship_omg_where="$SPACESHIP_GIT_OMG_PREFIX$spaceship_omg_where"
    fi

    # Status prefixes are colorized
    spaceship::section \
      "$SPACESHIP_GIT_OMG_WHERE_COLOR" "$spaceship_omg_where"
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
    omg_status+=$(enrich_append $action "${SPACESHIP_GIT_OMG_ACTION_PREFIX} $(get_current_action)" "$omg_color_alert" true)
  fi

  if [[ $SPACESHIP_GIT_OMG_WHERE_SHOW == true ]]; then

    omg_color="$SPACESHIP_GIT_OMG_WHERE_COLOR"
    omg_color_alert="$SPACESHIP_GIT_OMG_WHERE_ALERT_COLOR"

    # where
    if [[ $detached == true ]]; then
      omg_where+=$(enrich_append $detached "$SPACESHIP_GIT_OMG_DETACHED" "$omg_color_alert")
      omg_where+=$(enrich_append $detached "${SPACESHIP_GIT_OMG_WHERE_BRANCH_PREFIX}${current_commit_hash:0:7}${SPACESHIP_GIT_OMG_WHERE_BRANCH_SUFFIX}")
    else
      local display_branch
      if [[ $SPACESHIP_GIT_OMG_BRANCH_FULL_NAME == false ]]; then
        display_branch=$(truncate_string $current_branch $SPACESHIP_GIT_OMG_BRANCH_TRUNCATE_AFTER $SPACESHIP_GIT_OMG_BRANCH_HEAD_LENGTH $SPACESHIP_GIT_OMG_BRANCH_TAIL_LENGTH)
      fi
      display_branch=${display_branch:=$current_branch}

      if [[ $has_upstream == false ]]; then
        if [[ $SPACESHIP_GIT_OMG_EXPANDED == true ]]; then
          omg_where+=$(enrich_append true "${SPACESHIP_GIT_OMG_COMMITS_PREFIX}—${SPACESHIP_GIT_OMG_NOT_TRACKED}—${SPACESHIP_GIT_OMG_COMMITS_SUFFIX}${SPACESHIP_GIT_OMG_WHERE_BRANCH_PREFIX}${display_branch}${SPACESHIP_GIT_OMG_WHERE_BRANCH_SUFFIX}")
        else
          omg_where+=$(enrich_append true "${SPACESHIP_GIT_OMG_NOT_TRACKED}${SPACESHIP_GIT_OMG_WHERE_BRANCH_PREFIX}${display_branch}${SPACESHIP_GIT_OMG_WHERE_BRANCH_SUFFIX}")
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

        local omg_branch="${SPACESHIP_GIT_OMG_WHERE_BRANCH_PREFIX}${type_of_upstream}${display_branch}${SPACESHIP_GIT_OMG_WHERE_BRANCH_SUFFIX}"
        if [[ $SPACESHIP_GIT_OMG_SHOW_UPSTREAM == true ]]; then
          if [[ $SPACESHIP_GIT_OMG_SHOW_UPSTREAM_ORIGINSAME == true && "$upstream" == "origin/${current_branch}" ]]; then
            omg_branch="${SPACESHIP_GIT_OMG_WHERE_BRANCH_PREFIX}${display_branch} ${type_of_upstream}origin${SPACESHIP_GIT_OMG_WHERE_BRANCH_SUFFIX}"
          elif [[ "$upstream" != "origin/${current_branch}" ]]; then
            omg_branch="${SPACESHIP_GIT_OMG_WHERE_BRANCH_PREFIX}${display_branch} ${type_of_upstream}${upstream}${SPACESHIP_GIT_OMG_WHERE_BRANCH_SUFFIX}"
          fi
        fi
        omg_where+=$(enrich_append true $omg_branch)
      fi
    fi
    if [[ $is_on_a_tag == true ]]; then
      if [[ $SPACESHIP_GIT_OMG_TAG_FULL_NAME == false ]]; then
        tag_at_current_commit=$(truncate_string $tag_at_current_commit $SPACESHIP_GIT_OMG_TAG_TRUCATE_AFTER $SPACESHIP_GIT_OMG_TAG_HEAD_LENGTH $SPACESHIP_GIT_OMG_TAG_TAIL_LENGTH)
      fi
      omg_where+=$(enrich_append true "${SPACESHIP_GIT_OMG_TAG}${tag_at_current_commit}")
    fi
  fi

  if [[ $SPACESHIP_GIT_OMG_STATUS_FIRST == true ]]; then
    spaceship_git_oh_my_git_status spaceship_omg_status
    spaceship_git_oh_my_git_where spaceship_omg_where
  else
    spaceship_git_oh_my_git_where spaceship_omg_where
    spaceship_git_oh_my_git_status spaceship_omg_status
  fi
}

spaceship_git_oh_my_git() {
  [[ $SPACESHIP_GIT_SHOW == false ]] && return

  build_prompt
}
