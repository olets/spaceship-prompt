#
# Harvest
#
# Harvest is a time-tracking tool
# Link: https://www.getharvest.com/
#
# The Harvest prompt section relies on Harvest Command Line (HCL)
# Link: https://github.com/zenhob/hcl

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# | SPACESHIP_HARVEST_SHOW | Harvest stopped | Harvest running | Harvest error |
# |------------------------+-----------------+-----------------+---------------|
# | false                  | hidden          | hidden          | hidden        |
# | always                 | shown           | shown           | shown         |
# | true                   | hidden          | shown           | shown         |
# | stopped                | shown           | hidden          | shown         |
# ------------------------------------------------------------------------------

SPACESHIP_HARVEST_SHOW="${SPACESHIP_HARVEST_SHOW:=true}"
SPACESHIP_HARVEST_PREFIX="${SPACESHIP_HARVEST_PREFFIX:=""}"
SPACESHIP_HARVEST_SUFFIX="${SPACESHIP_HARVEST_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_HARVEST_RUNNING_SYMBOL="${SPACESHIP_HARVEST_RUNNING_SYMBOL:="⏳"}"
SPACESHIP_HARVEST_STOPPED_SYMBOL="${SPACESHIP_HARVEST_STOPPED_SYMBOL:="🛑 "}"
SPACESHIP_HARVEST_DOWN_SYMBOL="${SPACESHIP_HARVEST_DOWN_SYMBOL:="⚠️ "}"
SPACESHIP_HARVEST_COLOR="${SPACESHIP_HARVEST_COLOR:="208"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show section only if one of follow is true
# - Show is always
# - Show is true and Harvest is running
# - Show is stopped and Harvest is stopped
# - Harvest API returns an error
spaceship_harvest() {
  [[ $SPACESHIP_HARVEST_SHOW == false ]] && return

  spaceship::exists hcl || return

  local harvest_symbol

  if [[ $(hcl status | grep 'All Systems Operational') ]]; then
    if [[ $(hcl show today | grep '(running)') ]]; then
      [[ $SPACESHIP_HARVEST_SHOW =~ (true|"true") ]] || return
      harvest_symbol="$SPACESHIP_HARVEST_RUNNING_SYMBOL"
    else
      [[ $SPACESHIP_HARVEST_SHOW =~ (true|"stopped") ]] || return
      harvest_symbol="$SPACESHIP_HARVEST_STOPPED_SYMBOL"
    fi
  else
    harvest_symbol="$SPACESHIP_HARVEST_DOWN_SYMBOL"
  fi

  spaceship::section \
    "$SPACESHIP_HARVEST_COLOR" \
    "$SPACESHIP_HARVEST_PREFIX" \
    "$harvest_symbol" \
    "$SPACESHIP_HARVEST_SUFFIX"
}
