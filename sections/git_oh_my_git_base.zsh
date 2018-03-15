#
# oh-my-git Git status
#
# oh-my-git, adapted for use by Spaceship Prompt
# https://github.com/arialdomartini/oh-my-git/
# Reference version: https://raw.githubusercontent.com/arialdomartini/oh-my-git/fd13327094d0ff2db3d713f21942f0419acb1dfb/base.sh

enrich() {
  local flag=$1
  local symbol=$2

  local color_on=${3:-$omg_default_color_on}

  if [[ $flag != true && $omg_use_color_off == false ]]; then symbol=' '; fi
  if [[ $flag == true ]]; then local color=$color_on; else local color=$omg_default_color_off; fi

  echo -n "${prompt}${color}${symbol}${reset} "
}

get_current_action() {
  local info="$(git rev-parse --git-dir 2>/dev/null)"
  if [ -n "$info" ]; then
    local action
    if [ -f "$info/rebase-merge/interactive" ]
    then
      action=${is_rebasing_interactively:-"rebase -i"}
    elif [ -d "$info/rebase-merge" ]
    then
      action=${is_rebasing_merge:-"rebase -m"}
    else
      if [ -d "$info/rebase-apply" ]
      then
        if [ -f "$info/rebase-apply/rebasing" ]
        then
          action=${is_rebasing:-"rebase"}
        elif [ -f "$info/rebase-apply/applying" ]
        then
          action=${is_applying_mailbox_patches:-"am"}
        else
          action=${is_rebasing_mailbox_patches:-"am/rebase"}
        fi
      elif [ -f "$info/MERGE_HEAD" ]
      then
        action=${is_merging:-"merge"}
      elif [ -f "$info/CHERRY_PICK_HEAD" ]
      then
        action=${is_cherry_picking:-"cherry-pick"}
      elif [ -f "$info/BISECT_LOG" ]
      then
        action=${is_bisecting:-"bisect"}
      fi
    fi

    if [[ -n $action ]]; then printf "%s" "${1-}$action${2-}"; fi
  fi
}

build_prompt() {
  local prompt=""

  # Git info
  local current_commit_hash=$(git rev-parse HEAD 2> /dev/null)
  if [[ -n $current_commit_hash ]]; then local is_a_git_repo=true; fi

  if [[ $is_a_git_repo == true ]]; then
    local current_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    if [[ $current_branch == 'HEAD' ]]; then local detached=true; fi

    local number_of_logs="$(git log --pretty=oneline -n1 2> /dev/null | wc -l)"
    if [[ $number_of_logs -eq 0 ]]; then
      local just_init=true
    else
      local upstream=$(git rev-parse --symbolic-full-name --abbrev-ref @{upstream} 2> /dev/null)
      if [[ -n "${upstream}" && "${upstream}" != "@{upstream}" ]]; then local has_upstream=true; fi

      local git_status="$(git status --porcelain 2> /dev/null)"
      local action="$(get_current_action)"

      local number_of_modified_files=$(\grep -c "$\n.M" <<< "${git_status}")
      local number_of_modified_files=$(( ${number_of_modified_files} + $(\grep -c "^.M" <<< "${git_status}") ))
      if [[ $number_of_modified_files -gt 0 ]]; then local has_modifications=true; fi

      local number_of_modified_cached_files=$(\grep -c "$\nM" <<< "${git_status}")
      local number_of_modified_cached_files=$(( ${number_of_modified_cached_files} + $(\grep -c "^M" <<< "${git_status}") ))
      if [[ $number_of_modified_cached_files -gt 0 ]]; then local has_modifications_cached=true; fi

      local number_of_added_files=$(\grep -c "$\nA" <<< "${git_status}")
      local number_of_added_files=$(( ${number_of_added_files} + $(\grep -c "^A" <<< "${git_status}") ))
      if [[ $number_of_added_files -gt 0 ]]; then local has_adds=true; fi

      local number_of_deleted_files=$(\grep -c "$\n.D" <<< "${git_status}")
      local number_of_deleted_files=$(( ${number_of_deleted_files} + $(\grep -c "^.D" <<< "${git_status}") ))
      if [[ $number_of_deleted_files -gt 0 ]]; then local has_deletions=true; fi

      local number_of_deleted_cached_files=$(\grep -c "$\nD" <<< "${git_status}")
      local number_of_deleted_cached_files=$(( ${number_of_deleted_cached_files} + $(\grep -c "^D" <<< "${git_status}") ))
      if [[ $number_of_deleted_cached_files -gt 0 ]]; then local has_deletions=true; fi

      local number_of_ready_to_commit_files=$(\grep -c "$\n.[MAD\?]" <<< "${git_status}")
      local number_of_ready_to_commit_files=$(( ${number_of_ready_to_commit_files} + $(\grep -c "^.[MAD\?]" <<< "${git_status}") ))
      if [[ $number_of_ready_to_commit_files -gt 0 ]]; then local ready_to_commit=true; fi

      local number_of_untracked_files=$(\grep -c "^??" <<< "${git_status}")
      if [[ $number_of_untracked_files -gt 0 ]]; then local has_untracked_files=true; fi

      local tag_at_current_commit=$(git describe --exact-match --tags $current_commit_hash 2> /dev/null)
      if [[ -n $tag_at_current_commit ]]; then local is_on_a_tag=true; fi

      if [[ $has_upstream == true ]]; then
        local commits_diff="$(git log --pretty=oneline --topo-order --left-right ${current_commit_hash}...${upstream} 2> /dev/null)"
        local commits_ahead=$(\grep -c "^<" <<< "$commits_diff")
        local commits_behind=$(\grep -c "^>" <<< "$commits_diff")
      fi

      if [[ $commits_ahead -gt 0 && $commits_behind -gt 0 ]]; then local has_diverged=true; fi
      if [[ $has_diverged == false && $commits_ahead -gt 0 ]]; then local should_push=true; fi

      local will_rebase=$(git config --get branch.${current_branch}.rebase 2> /dev/null)

      local number_of_stashes="$(git stash list -n1 2> /dev/null | wc -l)"
      if [[ $number_of_stashes -gt 0 ]]; then local has_stashes=true; fi
    fi
  fi

  echo "$(custom_build_prompt ${enabled:-true} ${current_commit_hash:-""} ${is_a_git_repo:-false} ${current_branch:-""} ${detached:-false} ${just_init:-false} ${has_modifications:-false} ${has_modifications_cached:-false} ${has_adds:-false} ${has_deletions:-false} ${has_deletions_cached:-false} ${has_untracked_files:-false} ${ready_to_commit:-false} ${tag_at_current_commit:-""} ${is_on_a_tag:-false} ${has_upstream:-false} ${commits_ahead:-false} ${commits_behind:-false} ${has_diverged:-false} ${should_push:-false} ${will_rebase:-false} ${has_stashes:-false} ${action:-false} ${number_of_modified_files} ${number_of_modified_cached_files} ${number_of_added_files} ${number_of_deleted_files} ${number_of_deleted_cached_files} ${number_of_ready_to_commit_files} ${number_of_untracked_files} ${number_of_stashes})"
}

function_exists() {
  declare -f -F $1 > /dev/null
  return $?
}

eval_prompt_callback_if_present() {
  function_exists omg_prompt_callback && echo "$(omg_prompt_callback)"
}
