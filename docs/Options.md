## Options

You have ability to customize or disable specific elements of Spaceship. All options must be overridden in your `.zshrc` file **after** the theme.

Colors for sections can be [basic colors](https://wiki.archlinux.org/index.php/zsh#Colors) or [color codes](https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg).

**Note:** the symbol `·` in this document represents a regular space character ` `, it is used to clearly indicate when an option default value starts or ends with a space.

### Order

You can specify the order of prompt section using `SPACESHIP_PROMPT_ORDER` option. Use Zsh array syntax to define your own prompt order.

The order also defines which sections that Spaceship loads. If you're struggling with slow prompt, you can just omit the sections that you don't use, and they won't be loaded.

The default order is:

```zsh
SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubecontext   # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
```

You can also add items to the right prompt by specifying them in the `SPACESHIP_RPROMPT_ORDER` option. By default `SPACESHIP_RPROMPT_ORDER` is empty.

### Prompt

This group of options defines a behaviour of prompt and standard parameters for sections displaying.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_PROMPT_ADD_NEWLINE` | `true` | Adds a newline character before each prompt line |
| `SPACESHIP_PROMPT_SEPARATE_LINE` | `true` | Make the prompt span across two lines |
| `SPACESHIP_PROMPT_FIRST_PREFIX_SHOW` | `false` | Shows a prefix of the first section in prompt  |
| `SPACESHIP_PROMPT_PREFIXES_SHOW` | `true` | Show prefixes before prompt sections or not |
| `SPACESHIP_PROMPT_SUFFIXES_SHOW` | `true` | Show suffixes before prompt sections or not |
| `SPACESHIP_PROMPT_DEFAULT_PREFIX` | `via ` | Default prefix for prompt sections |
| `SPACESHIP_PROMPT_DEFAULT_SUFFIX` | ` ` | Default suffix for prompt section |

### Char

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_CHAR_PREFIX` | ` ` | Prefix before prompt character |
| `SPACESHIP_CHAR_SUFFIX` | ` ` | Suffix after prompt character |
| `SPACESHIP_CHAR_SYMBOL` | `➜ ` | Prompt character to be shown before any command |
| `SPACESHIP_CHAR_COLOR_SUCCESS` | `green` | Color of prompt character if last command completes successfully |
| `SPACESHIP_CHAR_COLOR_FAILURE` | `red` | Color of prompt character if last command returns non-zero exit-code |
| `SPACESHIP_CHAR_COLOR_SECONDARY` | `yellow` | Color of secondary prompt character |

### Time (`time`)

Disabled by default. Set `SPACESHIP_TIME_SHOW` to `true` in your `.zshrc`, if you need to show time stamps.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_TIME_SHOW` | `false` | Show time (set to `true` for enabling) |
| `SPACESHIP_TIME_PREFIX` | `at·` | Prefix before time section |
| `SPACESHIP_TIME_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after time section |
| `SPACESHIP_TIME_COLOR` | `yellow` | Color of time section |
| `SPACESHIP_TIME_FORMAT` | `false` | Custom date formatting [ZSH date formats](http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Date-and-time) |
| `SPACESHIP_TIME_12HR` | `false` | Format time using 12-hour clock (am/pm) |

### Username (`user`)

By default, a username is shown only when it's not the same as `$LOGNAME`, when you're connected via SSH or when you're root. Root user is highlighted in `SPACESHIP_USER_COLOR_ROOT` color (red as default).

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_USER_SHOW` | `true` | Show user section (`true`, `false`, `always` or `needed`) |
| `SPACESHIP_USER_PREFIX` | `with·` | Prefix before user section |
| `SPACESHIP_USER_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after user section |
| `SPACESHIP_USER_COLOR` | `yellow` | Color of user section |
| `SPACESHIP_USER_COLOR_ROOT` | `red` | Color of user section when it's root |

`SPACESHIP_USER_SHOW` defines when to show username section. Here are possible values:

| `SPACESHIP_USER_SHOW` | Show on local  | Show on remote  |
| :-------------------: | :------------- | :-------------- |
| `false`               | Never          | Never           |
| `always`              | Always         | Always          |
| `true`                | If needed      | Always          |
| `needed`              | If needed      | If needed       |

### Hostname (`host`)

Hostname is shown only when you're connected via SSH unless you change this behavior.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_HOST_SHOW` | `true` | Show host section (`true`, `false` or `always`) |
| `SPACESHIP_HOST_SHOW_FULL` | `false` | Show full hostname section (`true`, `false`) |
| `SPACESHIP_HOST_PREFIX` | `at·` | Prefix before the connected SSH machine name |
| `SPACESHIP_HOST_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the connected SSH machine name |
| `SPACESHIP_HOST_COLOR` | `blue` | Color of host section |
| `SPACESHIP_HOST_COLOR_SSH` | `green` | Color of host in SSH connection |

### Directory (`dir`)

Directory is always shown and truncated to the value of `SPACESHIP_DIR_TRUNC`. While you are in repository, it shows only root directory and folders inside it.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_DIR_SHOW` | `true` | Show directory section |
| `SPACESHIP_DIR_PREFIX` | `in·` | Prefix before current directory |
| `SPACESHIP_DIR_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after current directory |
| `SPACESHIP_DIR_TRUNC` | `3` | Number of folders of cwd to show in prompt, 0 to show all |
| `SPACESHIP_DIR_TRUNC_REPO` | `true` | While in `git` repo, show only root directory and folders inside it |
| `SPACESHIP_DIR_COLOR` | `cyan` | Color of directory section |

### Git (`git`)

Git section is shown only in Git repositories.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_GIT_SHOW` | `true` | Show Git section |
| `SPACESHIP_GIT_PREFIX` | `on·` | Prefix before Git section |
| `SPACESHIP_GIT_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Git section |

#### Git subsections

The Git section consists of several subsections. You can specify the order of the Git subsections using `SPACESHIP_PROMPT_ORDER` option. Use Zsh array syntax to define your own prompt order.

The default order is:

```zsh
SPACESHIP_GIT_ORDER=(
  branch
  status
)
```

The other Git subsections shipped with Spaceship are

| Subsection | Meaning |
| :--------- | ------- |
| `status_oh_my_zsh` | Ported from [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh), this is the Git status Spaceship used prior to v3.0. |
| `status_actionable` | A Git status where icons show changes that are not in the index yet. See below for details. |
| `oh_my_git` | Ported from [oh-my-git](https://github.com/arialdomartini/oh-my-git), a complete Git prompt including status and branch info. |
| `index` | Indicators related to `git-update-index`. |

#### Git branch (`git_branch`)

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_GIT_BRANCH_SHOW` | `true` | Show Git branch subsection |
| `SPACESHIP_GIT_BRANCH_PREFIX` | ![·](https://user-images.githubusercontent.com/3459374/34947621-4f324a92-fa13-11e7-9b99-cdba2cdda6b9.png) | Prefix before Git branch subsection (default requires [powerline patched font](https://github.com/powerline/fonts)
| `SPACESHIP_GIT_BRANCH_SUFFIX` | ` ` | Suffix after Git branch subsection |
| `SPACESHIP_GIT_BRANCH_COLOR` | `magenta` | Color of Git branch subsection |

#### Git status (`git_status`)

Git status indicators is shown only when you have dirty repository.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_GIT_STATUS_SHOW` | `true` | Show Git status subsection |
| `SPACESHIP_GIT_STATUS_PREFIX` | `·[` | Prefix before Git status subsection |
| `SPACESHIP_GIT_STATUS_SUFFIX` | `]` | Suffix after Git status subsection |
| `SPACESHIP_GIT_STATUS_COLOR` | `red` | Color of Git status subsection |
| `SPACESHIP_GIT_STATUS_UNTRACKED` | `?` | Indicator for untracked changes |
| `SPACESHIP_GIT_STATUS_ADDED` | `+` | Indicator for added changes |
| `SPACESHIP_GIT_STATUS_MODIFIED` | `!` | Indicator for unstaged files |
| `SPACESHIP_GIT_STATUS_RENAMED` | `»` | Indicator for renamed files |
| `SPACESHIP_GIT_STATUS_DELETED` | `✘` | Indicator for deleted files |
| `SPACESHIP_GIT_STATUS_STASHED` | `$` | Indicator for stashed changes |
| `SPACESHIP_GIT_STATUS_UNMERGED` | `=` | Indicator for unmerged changes |
| `SPACESHIP_GIT_STATUS_AHEAD` | `⇡` | Indicator for unpushed changes (ahead of remote branch) |
| `SPACESHIP_GIT_STATUS_BEHIND` | `⇣` | Indicator for unpulled changes (behind of remote branch) |
| `SPACESHIP_GIT_STATUS_DIVERGED` | `⇕` | Indicator for diverged changes (diverged with remote branch) |

#### Git status, oh-my-zsh flavor (`git_status_oh_my_zsh`)

Ported from [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)'s [`git_prompt_status`](https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh), this is the Git status Spaceship used prior to v3.0.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_GIT_STATUS_OMZ_SHOW` | `$SPACESHIP_GIT_STATUS_SHOW` | Show Git status subsection |
| `SPACESHIP_GIT_STATUS_OMZ_PREFIX` | `$SPACESHIP_GIT_STATUS_PREFIX` | Prefix before Git status subsection |
| `SPACESHIP_GIT_STATUS_OMZ_SUFFIX` | `$SPACESHIP_GIT_STATUS_SUFFIX` | Suffix after Git status subsection |
| `SPACESHIP_GIT_STATUS_OMZ_COLOR` | `$SPACESHIP_GIT_STATUS_COLOR` | Color of Git status subsection |
| `SPACESHIP_GIT_STATUS_OMZ_UNTRACKED` | `$SPACESHIP_GIT_STATUS_UNTRACKED` | Indicator for untracked changes |
| `SPACESHIP_GIT_STATUS_OMZ_ADDED` | `$SPACESHIP_GIT_STATUS_ADDED` | Indicator for added changes |
| `SPACESHIP_GIT_STATUS_OMZ_MODIFIED` | `$SPACESHIP_GIT_STATUS_MODIFIED` | Indicator for unstaged files |
| `SPACESHIP_GIT_STATUS_OMZ_RENAMED` | `$SPACESHIP_GIT_STATUS_RENAMED` | Indicator for renamed files |
| `SPACESHIP_GIT_STATUS_OMZ_DELETED` | `$SPACESHIP_GIT_STATUS_DELETED` | Indicator for deleted files |
| `SPACESHIP_GIT_STATUS_OMZ_STASHED` | `$SPACESHIP_GIT_STATUS_STASHED` | Indicator for stashed changes |
| `SPACESHIP_GIT_STATUS_OMZ_UNMERGED` | `$SPACESHIP_GIT_STATUS_UNMERGED` | Indicator for unmerged changes |
| `SPACESHIP_GIT_STATUS_OMZ_AHEAD` | `$SPACESHIP_GIT_STATUS_AHEAD` | Indicator for unpushed changes (ahead of remote branch) |
| `SPACESHIP_GIT_STATUS_OMZ_BEHIND` | `$SPACESHIP_GIT_STATUS_BEHIND` | Indicator for unpulled changes (behind of remote branch) |
| `SPACESHIP_GIT_STATUS_OMZ_DIVERGED` | `$SPACESHIP_GIT_STATUS_DIVERGED` | Indicator for diverged chages (diverged with remote branch) |

#### Git status, actionable (`git_status_actionable`)

Unlike `git_status`, `git_status_actionable` shows untracked, modified, and deleted indicators for unstaged files only. All staged changes are indicated with the same "staged" indicator. `git_status_actionable` does not support an indicator for renamed files.

Demonstrated in [PR #359](https://git.io/vACxq)

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_GIT_STATUS_ACTIONABLE_SHOW` | `$SPACESHIP_GIT_STATUS_SHOW` | Show Git status subsection |
| `SPACESHIP_GIT_STATUS_ACTIONABLE_PREFIX` | `$SPACESHIP_GIT_STATUS_PREFIX` | Prefix before Git status subsection |
| `SPACESHIP_GIT_STATUS_ACTIONABLE_SUFFIX` | `$SPACESHIP_GIT_STATUS_SUFFIX` | Suffix after Git status subsection |
| `SPACESHIP_GIT_STATUS_ACTIONABLE_COLOR` | `$SPACESHIP_GIT_STATUS_COLOR` | Color of Git status subsection |
| `SPACESHIP_GIT_STATUS_ACTIONABLE_UNTRACKED` | `$SPACESHIP_GIT_STATUS_UNTRACKED` | Indicator for untracked changes |
| `SPACESHIP_GIT_STATUS_ACTIONABLE_STAGED` | `$SPACESHIP_GIT_STATUS_ADDED` | Indicator for staged changes |
| `SPACESHIP_GIT_STATUS_ACTIONABLE_MODIFIED` | `$SPACESHIP_GIT_STATUS_MODIFIED` | Indicator for modified files in the working tree |
| `SPACESHIP_GIT_STATUS_ACTIONABLE_DELETED` | `$SPACESHIP_GIT_STATUS_DELETED` | Indicator for deleted files |
| `SPACESHIP_GIT_STATUS_ACTIONABLE_STASHED` | `$SPACESHIP_GIT_STATUS_STASHED` | Indicator for stashed changes |
| `SPACESHIP_GIT_STATUS_ACTIONABLE_UNMERGED` | `$SPACESHIP_GIT_STATUS_UNMERGED` | Indicator for unmerged changes |
| `SPACESHIP_GIT_STATUS_ACTIONABLE_AHEAD` | `$SPACESHIP_GIT_STATUS_AHEAD` | Indicator for unpushed changes (ahead of remote branch) |
| `SPACESHIP_GIT_STATUS_ACTIONABLE_BEHIND` | `$SPACESHIP_GIT_STATUS_BEHIND` | Indicator for unpulled changes (behind of remote branch) |
| `SPACESHIP_GIT_STATUS_ACTIONABLE_DIVERGED` | `$SPACESHIP_GIT_STATUS_DIVERGED` | Indicator for diverged changes (diverged with remote branch) |

#### oh-my-git (`oh_my_git`)

##### General

| Variable | Default | Meaning |
| :------- | :-----: | :-----: | ------- |
| `SPACESHIP_GIT_ALERT_COLOR` | `yellow` | Color of oh-my-git Git section alerts |
| `SPACESHIP_GIT_OMG_PREFIX` | `` | Prefix before oh-my-git subsection |
| `SPACESHIP_GIT_OMG_SUFFIX` | `` | Suffix after oh-my-git subsection |
| `SPACESHIP_GIT_OMG_ICONS` | `true` | When possible, use [oh-my-git](https://github.com/arialdomartini/oh-my-git) flavored icons instead of Spaceship flavored icons |
| `SPACESHIP_GIT_OMG_EXPANDED` | `true` | Leave a gap for inactive indicators, and display `—` for non-zero behind/ahead counts |
| `SPACESHIP_GIT_OMG_HIDE_INACTIVE` | `true` | When `true`, inactive indicators are show, greyed out (overrides `SPACESHIP_GIT_OMG_EXPANDED=false`) |
| `SPACESHIP_GIT_OMG_STATUS_FIRST` | `true` | Put the "status" part before the "where" part |

##### Status

| Variable | Default | If OMG icons `false` | Meaning |
| :------- | :-----: | :-----: | ------- |
| `SPACESHIP_GIT_OMG_STATUS_SHOW` | `true` | no change | Show Git status part of oh-my-git |
| `SPACESHIP_GIT_OMG_STATUS_COLOR` | `red` | no change | Color of status part of oh-my-git |
| `SPACESHIP_GIT_OMG_STATUS_ALERT_COLOR` | `$SPACESHIP_GIT_ALERT_COLOR` | no change | Color of alerts in status part of oh-my-git |
| `SPACESHIP_GIT_OMG_STATUS_ALERT_COLOR_ALT` | `blue` | no change | Color of stash indicator |
| `SPACESHIP_GIT_OMG_STATUS_PREFIX` |`··` | `[` | Prefix before status part of oh-my-git (requires [Fontawesome-patched font](https://github.com/arialdomartini/oh-my-git#the-font) |
| `SPACESHIP_GIT_OMG_STATUS_SUFFIX` | `` | `·]·` | Suffix after status part of oh-my-git |
| `SPACESHIP_GIT_OMG_STASHED` | `·` | `$` | Indicator for stashed changes (OMG icon requires [Fontawesome-patched font](https://github.com/arialdomartini/oh-my-git#the-font) |
| `SPACESHIP_GIT_OMG_UNTRACKED` | `·` | `?` | Indicator for untracked changes (OMG icon requires [Fontawesome-patched font](https://github.com/arialdomartini/oh-my-git#the-font) |
| `SPACESHIP_GIT_OMG_MODIFIED` | `·` | `!` | Indicator for unstaged modifications (OMG icon requires [Fontawesome-patched font](https://github.com/arialdomartini/oh-my-git#the-font) |
| `SPACESHIP_GIT_OMG_DELETED` | `·` | `✘·` | Indicator for deleted files (OMG icon requires [Fontawesome-patched font](https://github.com/arialdomartini/oh-my-git#the-font) |
| `SPACESHIP_GIT_OMG_ADDED` | `·` | `+` | Indicator for added changes (OMG icon requires [Fontawesome-patched font](https://github.com/arialdomartini/oh-my-git#the-font) |
| `SPACESHIP_GIT_OMG_CACHED_MODIFICATIONS` | `·` | no change | Indicator for staged modifications (requires [Fontawesome-patched font](https://github.com/arialdomartini/oh-my-git#the-font) |
| `SPACESHIP_GIT_OMG_CACHED_DELETIONS` | `·` | no change | Indicator for staged deletions (requires [Fontawesome-patched font](https://github.com/arialdomartini/oh-my-git#the-font) |
| `SPACESHIP_GIT_OMG_ALL_STAGED` | `·` | no change | Indicator that all changes have been staged (requires [Fontawesome-patched font](https://github.com/arialdomartini/oh-my-git#the-font) |
| `SPACESHIP_GIT_OMG_ACTION_PREFIX` | `··` | no change | Prefix before the current Git action (requires [Fontawesome-patched font](https://github.com/arialdomartini/oh-my-git#the-font) |

##### Where

| Variable | Default | If OMG icons `false` | Meaning |
| :------- | :-----: | :-----: | ------- |
| `SPACESHIP_GIT_OMG_WHERE_SHOW` | `true` | no change | Show branch part of oh-my-git |
| `SPACESHIP_GIT_OMG_WHERE_COLOR` | `magenta` | no change | Color of branch part of oh-my-git |
| `SPACESHIP_GIT_OMG_WHERE_ALERT_COLOR` | `$SPACESHIP_GIT_ALERT_COLOR` | no change | Color of alerts in branch part of oh-my-git |
| `SPACESHIP_GIT_OMG_WHERE_PREFIX` | `(` | ``  | Prefix before branch part of oh-my-git |
| `SPACESHIP_GIT_OMG_WHERE_SUFFIX` | `)` | `` | Suffix after branch part of oh-my-git |
| `SPACESHIP_GIT_OMG_DETACHED` | `···` | no change | Indicator for a detached HEAD (requires [Fontawesome-patched font](https://github.com/arialdomartini/oh-my-git#the-font) |
| `SPACESHIP_GIT_OMG_BRANCH_NOT_TRACKED` | `··` | no change | Indicator for no remote branch (requires [Fontawesome-patched font](https://github.com/arialdomartini/oh-my-git#the-font) |
| `SPACESHIP_GIT_OMG_COMMITS_PREFIX` | `·` | no change | Prefix before the local v. remote commit counts |
| `SPACESHIP_GIT_OMG_COMMITS_SUFFIX` | `·` | no change | Suffix after the local v. remote commit counts |
| `SPACESHIP_GIT_OMG_DIVERGED` | `·` | `⇕·` | Indicator for diverged changes (diverged with remote branch) (OMG icon requires [Fontawesome-patched font](https://github.com/arialdomartini/oh-my-git#the-font) |
| `SPACESHIP_GIT_OMG_BEHIND` | `·` | `⇣·` | Indicator for unpulled changes (behind of remote branch) (OMG icon requires [Fontawesome-patched font](https://github.com/arialdomartini/oh-my-git#the-font) |
| `SPACESHIP_GIT_OMG_AHEAD` | `··` | `⇡·` | Indicator for unpushed changes (ahead of remote branch) (OMG icon requires [Fontawesome-patched font](https://github.com/arialdomartini/oh-my-git#the-font) |
| `SPACESHIP_GIT_OMG_BRANCH_PREFIX` | `(` | ``  | Prefix before branch part of oh-my-git |
| `SPACESHIP_GIT_OMG_BRANCH_SUFFIX` | `)` | `` | Suffix after branch part of oh-my-git |
| `SPACESHIP_GIT_OMG_REBASE_TRACKING` | `·` | no change | Indicator for branch.<name>.rebase is true (requires [Fontawesome-patched font](https://github.com/arialdomartini/oh-my-git#the-font) |
| `SPACESHIP_GIT_OMG_MERGE_TRACKING` | `·` | `·`| Indicator for branch.<name>.rebase is not true (requires [Fontawesome-patched font](https://github.com/arialdomartini/oh-my-git#the-font) |
| `SPACESHIP_GIT_OMG_BRANCH_FULL_NAME` | `false` | no change | When `false`, tag names longer than the sum of `SPACESHIP_GIT_OMG_BRANCH_HEAD_LENGTH` and `SPACESHIP_GIT_OMG_BRANCH_TAIL_LENGTH` are truncated |
| `SPACESHIP_GIT_OMG_BRANCH_MAX_LENGTH` | 10 | no change | If `SPACESHIP_GIT_OMG_BRANCH_FULL_NAME` is `false`, truncate branch names longer than this many characters |
| `SPACESHIP_GIT_OMG_BRANCH_HEAD_LENGTH` | 4 | no change | If `SPACESHIP_GIT_OMG_BRANCH_FULL_NAME` is `false`, show this many characters from the start of branch names longer than `SPACESHIP_GIT_OMG_BRANCH_MAX_LENGTH` characters |
| `SPACESHIP_GIT_OMG_BRANCH_TAIL_LENGTH` | 3 | no change | If `SPACESHIP_GIT_OMG_BRANCH_FULL_NAME` is `false`, show this many characters from the end of branch names longer than `SPACESHIP_GIT_OMG_BRANCH_MAX_LENGTH` characters |
| `SPACESHIP_GIT_OMG_SHOW_UPSTREAM` | `true` | no change | Show the name of the upstream. If the upstream and local branch have the same name, only the remote's name will be shown |
| `SPACESHIP_GIT_OMG_DEFAULT_REMOTE` | `origin` | no change | Used by `SPACESHIP_GIT_OMG_SHOW_UPSTREAM_DEFAULTSAME` |
| `SPACESHIP_GIT_OMG_SHOW_UPSTREAM_DEFAULTSAME` | `true` | no change | Show the name of the upstream when it is `SPACESHIP_GIT_OMG_DEFAULT_REMOTE/<local-branch-name>`. Overridden by `SPACESHIP_GIT_OMG_SHOW_UPSTREAM=false` |
| `SPACESHIP_GIT_OMG_TAG` | `···` | no change | Indicator for a tag at the checked out commit (requires [Fontawesome-patched font](https://github.com/arialdomartini/oh-my-git#the-font) |
| `SPACESHIP_GIT_OMG_TAG_FULL_NAME` | `$SPACESHIP_GIT_OMG_BRANCH_FULL_NAME` | no change | When `false`, tag names longer than the sum of `SPACESHIP_GIT_OMG_TAG_HEAD_LENGTH` and `SPACESHIP_GIT_OMG_TAG_TAIL_LENGTH` are truncated |
| `SPACESHIP_GIT_OMG_TAG_MAX_LENGTH` | `$SPACESHIP_GIT_OMG_BRANCH_MAX_LENGTH` | no change | If `SPACESHIP_GIT_OMG_TAG_FULL_NAME` is `false`, truncate tag names longer than this many characters |
| `SPACESHIP_GIT_OMG_TAG_HEAD_LENGTH` | `$SPACESHIP_GIT_OMG_BRANCH_HEAD_LENGTH` | no change | If `SPACESHIP_GIT_OMG_TAG_FULL_NAME` is `false`, show this many characters from the start of tag names longer than `SPACESHIP_GIT_OMG_TAG_MAX_LENGTH` characters |
| `SPACESHIP_GIT_OMG_TAG_TAIL_LENGTH` | `$SPACESHIP_GIT_OMG_BRANCH_TAIL_LENGTH` | no change | If `SPACESHIP_GIT_OMG_TAG_FULL_NAME` is `false`, show this many characters from the end of tag names longer than `SPACESHIP_GIT_OMG_TAG_MAX_LENGTH` characters |

#### Git index (`git_index`)

Git index indicators are shown only at least one file is flagged as assumed unchanged or skip worktree.

| `SPACESHIP_GIT_STATUS_ASSUME_UNCHANGED` | `⤒` | Indicator for the presence of an `--assume-unchanged` file |
| `SPACESHIP_GIT_STATUS_SKIP_WORKTREE` | `↧` | Indicator for the presence of a `--skip-worktree` file |

### Mercurial (`hg`)

Mercurial section is consists with `hg_branch` and `hg_status` subsections. It is shown only in Mercurial repositories.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_HG_SHOW` | `true` | Show Mercurial section |
| `SPACESHIP_HG_PREFIX` | `on·` | Prefix before Mercurial section |
| `SPACESHIP_HG_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Mercurial section |
| `SPACESHIP_HG_SYMBOL` | `☿·` | Character to be shown before Mercurial section |

#### Mercurial branch (`hg_branch`)

Shows Mercurial bookmarks when available, otherwise shows Mercurial branch information.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_HG_BRANCH_SHOW` | `true` | Show Mercurial branch subsection |
| `SPACESHIP_HG_BRANCH_PREFIX` | `$SPACESHIP_HG_SYMBOL` | Prefix before Mercurial branch subsection |
| `SPACESHIP_HG_BRANCH_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Mercurial branch subsection |
| `SPACESHIP_HG_BRANCH_COLOR` | `magenta` | Color of Mercurial branch subsection |

#### Mercurial status (`hg_status`)

Mercurial status indicators is shown only when you have dirty repository.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_HG_STATUS_SHOW` | `true` | Show Mercurial status subsection |
| `SPACESHIP_HG_STATUS_PREFIX` | `[` | Prefix before Mercurial status subsection |
| `SPACESHIP_HG_STATUS_SUFFIX` | `]` | Suffix after Mercurial status subsection |
| `SPACESHIP_HG_STATUS_COLOR` | `red` | Color of Mercurial status subsection |
| `SPACESHIP_HG_STATUS_UNTRACKED` | `?` | Indicator for untracked changes |
| `SPACESHIP_HG_STATUS_ADDED` | `+` | Indicator for added changes |
| `SPACESHIP_HG_STATUS_MODIFIED` | `!` | Indicator for unstaged files |
| `SPACESHIP_HG_STATUS_DELETED` | `✘` | Indicator for deleted files |

### Package version (`package`)

> Works only for [npm](https://www.npmjs.com/) at the moment. Please, help us improve this section!

Package version is shown when repository is a package (e.g. contains a `package.json` file).

> **Note:** This is the version of the package you are working on, not the version of package manager itself.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_PACKAGE_SHOW` | `true` | Show package version |
| `SPACESHIP_PACKAGE_PREFIX` | `is·` | Prefix before package version section |
| `SPACESHIP_PACKAGE_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after package version section |
| `SPACESHIP_PACKAGE_SYMBOL` | `📦·` | Character to be shown before package version |
| `SPACESHIP_PACKAGE_COLOR` | `red` | Color of package version section |

### Node.js (`node`)

Node.js section is shown only in directories that contain `package.json` file, or `node_modules` folder, or any other file with `.js` extension.

If you set `SPACESHIP_NODE_DEFAULT_VERSION` to the default Node.js version and your current version is the same as `SPACESHIP_NODE_DEFAULT_VERSION`, then Node.js section will be hidden.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_NODE_SHOW` | `true` | Current Node.js section |
| `SPACESHIP_NODE_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before Node.js section |
| `SPACESHIP_NODE_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Node.js section |
| `SPACESHIP_NODE_SYMBOL` | `⬢·` | Character to be shown before Node.js version |
| `SPACESHIP_NODE_DEFAULT_VERSION` | ` ` | Node.js version to be treated as default |
| `SPACESHIP_NODE_COLOR` | `green` | Color of Node.js section |

### Ruby (`ruby`)

Ruby section is shown only in directories that contain `Gemfile`, or `Rakefile`, or any other file with `.rb` extension.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_RUBY_SHOW` | `true` | Show Ruby section |
| `SPACESHIP_RUBY_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before Ruby section |
| `SPACESHIP_RUBY_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Ruby section |
| `SPACESHIP_RUBY_SYMBOL` | `💎·` | Character to be shown before Ruby version |
| `SPACESHIP_RUBY_COLOR` | `red` | Color of Ruby section |

### Elixir (`elixir`)

Elixir section is shown only in directories that contain `mix.exs`, or any other file with `.ex` or `.exs` extension. If the current elixir version is the same as the version set in `SPACESHIP_ELIXIR_DEFAULT_VERSION`, the elixir section will be hidden.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_ELIXIR_SHOW` | `true` | Show Elixir section |
| `SPACESHIP_ELIXIR_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before Elixir section |
| `SPACESHIP_ELIXIR_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Elixir section |
| `SPACESHIP_ELIXIR_DEFAULT_VERSION` | ` ` | Elixir version to be treated as default |
| `SPACESHIP_ELIXIR_SYMBOL` | `💧·` | Character to be shown before Elixir version |
| `SPACESHIP_ELIXIR_COLOR` | `magenta` | Color of Elixir section |

### Xcode (`xcode`)

Shows current version of Xcode. Local version has more priority than global.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_XCODE_SHOW_LOCAL` | `true` | Current local Xcode version based on [xcenv] |
| `SPACESHIP_XCODE_SHOW_GLOBAL` | `true` | Global Xcode version based on [xcenv] |
| `SPACESHIP_XCODE_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before Xcode section |
| `SPACESHIP_XCODE_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Xcode section |
| `SPACESHIP_XCODE_SYMBOL` | `🛠·` | Character to be shown before Xcode version |
| `SPACESHIP_XCODE_COLOR` | `blue` | Color of Xcode section |

### Swift (`swift`)

Shows current version of Swift. Local version has more priority than global.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_SWIFT_SHOW_LOCAL` | `true` | Current local Swift version based on [swiftenv] |
| `SPACESHIP_SWIFT_SHOW_GLOBAL` | `false` | Global Swift version based on [swiftenv] |
| `SPACESHIP_SWIFT_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before the Swift section |
| `SPACESHIP_SWIFT_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix to be shown before the Swift section |
| `SPACESHIP_SWIFT_SYMBOL` | `🐦·` | Character to be shown before Swift version |
| `SPACESHIP_SWIFT_COLOR` | `yellow` | Color of Swift section |

### Go (`golang`)

Go section is shown only in directories that contain `Godeps`, `glide.yaml`, any other file with `.go` extension, or when current directory is in the Go workspace defined in `$GOPATH`.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_GOLANG_SHOW` | `true` | Shown current Go version or not |
| `SPACESHIP_GOLANG_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before the Go section |
| `SPACESHIP_GOLANG_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the Go section |
| `SPACESHIP_GOLANG_SYMBOL` | `🐹·` | Character to be shown before Go version |
| `SPACESHIP_GOLANG_COLOR` | `cyan` | Color of Go section |

### PHP (`php`)

PHP section is shown only in directories that contain `composer.json` file, or any other file with `.php` extension.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_PHP_SHOW` | true | Show PHP section |
| `SPACESHIP_PHP_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before the PHP section |
| `SPACESHIP_PHP_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the PHP section |
| `SPACESHIP_PHP_SYMBOL` | `🐘·` | Character to be shown before PHP version |
| `SPACESHIP_PHP_COLOR` | `blue` | Color of PHP section |

### Rust (`rust`)

Rust section is shown only in directories that contain `Cargo.toml` or any other file with `.rs` extension.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_RUST_SHOW` | `true` | Shown current Rust version or not |
| `SPACESHIP_RUST_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before the Rust section |
| `SPACESHIP_RUST_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the Rust section |
| `SPACESHIP_RUST_SYMBOL` | `𝗥·` | Character to be shown before Rust version |
| `SPACESHIP_RUST_COLOR` | `red` | Color of Rust section |

### Haskell (`haskell`)

Haskell section is shown only in directories that contain `stack.yaml` file.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_HASKELL_SHOW` | `true` | Shown current Haskell Tool Stack version or not |
| `SPACESHIP_HASKELL_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before the Haskell section |
| `SPACESHIP_HASKELL_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the Haskell section |
| `SPACESHIP_HASKELL_SYMBOL` | `λ·` | Character to be shown before Haskell Tool Stack version |
| `SPACESHIP_HASKELL_COLOR` | `red` | Color of Haskell section |

### Julia (`julia`)

Julia section is shown only in directories that contain file with `.jl` extension.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_JULIA_SHOW` | `true` | Shown current Julia version or not |
| `SPACESHIP_JULIA_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before the Julia section |
| `SPACESHIP_JULIA_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the Julia section |
| `SPACESHIP_JULIA_SYMBOL` | `ஃ·` | Character to be shown before Julia version |
| `SPACESHIP_JULIA_COLOR` | `green` | Color of Julia section |

### Docker (`docker`)

Docker section is shown only in directories that contain `Dockerfile` or `docker-compose.yml` file.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_DOCKER_SHOW` | `true` | Show current Docker version and connected docker-machine or not |
| `SPACESHIP_DOCKER_PREFIX` | `on ` | Prefix before the Docker section |
| `SPACESHIP_DOCKER_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the Docker section |
| `SPACESHIP_DOCKER_SYMBOL` | `🐳·` | Character to be shown before Docker version |
| `SPACESHIP_DOCKER_COLOR` | `cyan` | Color of Docker section |

### Amazon Web Services (AWS) (`aws`)

Shows selected Amazon Web Services profile using '[named profiles](http://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html)'.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_AWS_SHOW` | `true` | Show current selected AWS-cli profile or not |
| `SPACESHIP_AWS_PREFIX` | `using·` | Prefix before the AWS section |
| `SPACESHIP_AWS_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the AWS section |
| `SPACESHIP_AWS_SYMBOL` | `☁️·` | Character to be shown before AWS profile |
| `SPACESHIP_AWS_COLOR` | `208` | Color of AWS section |

### Virtualenv (`venv`)

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_VENV_SHOW` | `true` | Show current Python virtualenv or not |
| `SPACESHIP_VENV_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before the virtualenv section |
| `SPACESHIP_VENV_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the virtualenv section |
| `SPACESHIP_VENV_GENERIC_NAMES` | `(virtualenv venv .venv)` | If the virtualenv folder is in this *array*, than use its parent directory as its name instead |
| `SPACESHIP_VENV_COLOR` | `blue` | Color of virtualenv environment section |

### Conda virtualenv (`conda`)

Show activated conda virtual environment. Disable native conda prompt by `conda config --set changeps1 False`.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_CONDA_SHOW` | `true` | Show current Python conda virtualenv or not |
| `SPACESHIP_CONDA_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before the conda virtualenv section |
| `SPACESHIP_CONDA_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the conda virtualenv section |
| `SPACESHIP_CONDA_SYMBOL` | `🅒·` | Character to be shown before conda virtualenv section |
| `SPACESHIP_CONDA_COLOR` | `blue` | Color of conda virtualenv environment section |

### Pyenv (`pyenv`)

pyenv section is shown only in directories that contain `requirements.txt` or any other file with `.py` extension.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_PYENV_SHOW` | `true` | Show current Pyenv version or not |
| `SPACESHIP_PYENV_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before the pyenv section |
| `SPACESHIP_PYENV_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the pyenv section |
| `SPACESHIP_PYENV_SYMBOL` | `🐍·` | Character to be shown before Pyenv version |
| `SPACESHIP_PYENV_COLOR` | `yellow` | Color of Pyenv section |

### .NET (`dotnet`)

.NET section is shown only in directories that contains a `project.json` or `global.json` file, or a file with one of these extensions: `.csproj`, `.xproj` or `.sln`.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_DOTNET_SHOW` | `true` | Current .NET section |
| `SPACESHIP_DOTNET_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before .NET section |
| `SPACESHIP_DOTNET_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after .NET section |
| `SPACESHIP_DOTNET_SYMBOL` | `.NET·` | Character to be shown before .NET version |
| `SPACESHIP_DOTNET_COLOR` | `128` | Color of .NET section |

### Ember.js (`ember`)

Ember.js section is shown only in directories that contain a `ember-cli-build.js` file.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_EMBER_SHOW` | `true` | Current Ember.js section |
| `SPACESHIP_EMBER_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before Ember.js section |
| `SPACESHIP_EMBER_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Ember.js section |
| `SPACESHIP_EMBER_SYMBOL` | `🐹·` | Character to be shown before Ember.js version |
| `SPACESHIP_EMBER_COLOR` | `210` | Color of Ember.js section |

### Kubectl context (`kubecontext`)

Shows the active kubectl context.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_KUBECONTEXT_SHOW` | `true` | Current Kubectl context section |
| `SPACESHIP_KUBECONTEXT_PREFIX` | `at·` | Prefix before Kubectl context section |
| `SPACESHIP_KUBECONTEXT_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Kubectl context section |
| `SPACESHIP_KUBECONTEXT_SYMBOL` | `☸️·` | Character to be shown before Kubectl context |
| `SPACESHIP_KUBECONTEXT_COLOR` | `cyan` | Color of Kubectl context section |

### Execution time (`exec_time`)

Execution time of the last command. Will be displayed if it exceeds the set threshold of time.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_EXEC_TIME_SHOW` | `true` | Show execution time |
| `SPACESHIP_EXEC_TIME_PREFIX` | `took·` | Prefix before execution time section |
| `SPACESHIP_EXEC_TIME_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after execution time section |
| `SPACESHIP_EXEC_TIME_COLOR` | `yellow` | Color of execution time section |
| `SPACESHIP_EXEC_TIME_ELAPSED` | `2` | The minimum number of seconds for showing execution time section |

### Battery (`battery`)

By default, Battery section is shown only if battery level is below `SPACESHIP_BATTERY_THRESHOLD` (default: 10%).

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_BATTERY_SHOW` | `true` | Show battery section or not (`true`, `false`, `always` or `charged`) |
| `SPACESHIP_BATTERY_PREFIX` | ` ` | Prefix before battery section |
| `SPACESHIP_BATTERY_SUFFIX` | `SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after battery section |
| `SPACESHIP_BATTERY_SYMBOL_CHARGING` | `⇡` | Character to be shown if battery is charging |
| `SPACESHIP_BATTERY_SYMBOL_DISCHARGING` | `⇣` | Character to be shown if battery is discharging |
| `SPACESHIP_BATTERY_SYMBOL_FULL` | `•` | Character to be shown if battery is full |
| `SPACESHIP_BATTERY_THRESHOLD` | 10 | Battery level below which battery section will be shown |

`SPACESHIP_BATTERY_SHOW` defines when to show battery section. Here are possible values:

| `SPACESHIP_BATTERY_SHOW` | Below threshold | Above threshold | Fully charged |
| :----------------------: | :-------------- | :-------------- | :------------ |
| `false`                  | Hidden          | Hidden          | Hidden        |
| `always`                 | Shown           | Shown           | Shown         |
| `true`                   | Shown           | Hidden          | Hidden        |
| `charged`                | Shown           | Hidden          | Shown         |

### Vi-mode (`vi_mode`)

This section shows mode indicator only when Vi-mode is enabled.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_VI_MODE_SHOW` | `true` | Shown current Vi-mode or not |
| `SPACESHIP_VI_MODE_PREFIX` | ` ` | Prefix before Vi-mode section |
| `SPACESHIP_VI_MODE_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Vi-mode section |
| `SPACESHIP_VI_MODE_INSERT` | `[I]` | Text to be shown when in insert mode |
| `SPACESHIP_VI_MODE_NORMAL` | `[N]` | Text to be shown when in normal mode |
| `SPACESHIP_VI_MODE_COLOR` | `white` | Color of Vi-mode section |

You can temporarily enable or disable vi-mode with handy functions (just execute them in terminal as any other regular command):

| Function | Meaning |
| :------- | ------- |
| `spaceship_vi_mode_enable` | Enable vi-mode for current terminal session |
| `spaceship_vi_mode_disable` | Disable vi-mode for current terminal session |

**Note:** For oh-my-zsh users with vi-mode plugin enabled: Add `export RPS1="%{$reset_color%}"` before `source $ZSH/oh-my-zsh.sh` in `.zshrc` to disable default `<<<` NORMAL mode indicator in right prompt.

### Jobs (`jobs`)

This section show only when there are active jobs in the background.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_JOBS_SHOW` | `true` | Show background jobs indicator  |
| `SPACESHIP_JOBS_PREFIX` | ` ` | Prefix before the jobs indicator |
| `SPACESHIP_JOBS_SUFFIX` | ` ` | Suffix after the jobs indicator |
| `SPACESHIP_JOBS_SYMBOL` | `✦` | Character to be shown when jobs are hiding |
| `SPACESHIP_JOBS_COLOR` | `blue` | Color of background jobs section |

### Exit code (`exit_code`)

Disabled by default. Set `SPACESHIP_EXIT_CODE_SHOW` to `true` in your `.zshrc`, if you need to show exit code of last command.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_EXIT_CODE_SHOW` | `false` | Show exit code of last command |
| `SPACESHIP_EXIT_CODE_PREFIX` | ` ` | Prefix before exit code section |
| `SPACESHIP_EXIT_CODE_SUFFIX` | ` ` | Suffix after exit code section |
| `SPACESHIP_EXIT_CODE_SYMBOL` | `✘` | Character to be shown before exit code |
| `SPACESHIP_EXIT_CODE_COLOR` | `red` | Color of exit code section |

## Need more?

If these options are not enough to do what you want, read more about Spaceship's API on [API page](./API.md) of the documentation.
