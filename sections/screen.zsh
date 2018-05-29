#
# Screen
#
# Screen is a full-screen window manager that multiplexes a physical terminal between several processes, typically interactive shells.
# Link: https://www.gnu.org/software/screen/manual/screen.html

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_SCREEN_SHOW="${SPACESHIP_SCREEN_SHOW=true}"
SPACESHIP_SCREEN_PREFIX="${SPACESHIP_SCREEN_PREFIX=""}"
SPACESHIP_SCREEN_SUFFIX="${SPACESHIP_SCREEN_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_SCREEN_SYMBOL="${SPACESHIP_SCREEN_SYMBOL="[screen]"}"
SPACESHIP_SCREEN_COLOR="${SPACESHIP_SCREEN_COLOR="cyan"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show that a virtual terminal is running
spaceship_screen() {
  [[ $SPACESHIP_SCREEN_SHOW == false ]] && return

  [[ -z $(echo "$TERM" | grep screen) ]] && return

  spaceship::section \
    "$SPACESHIP_SCREEN_COLOR" \
    "$SPACESHIP_SCREEN_PREFIX" \
    "${SPACESHIP_SCREEN_SYMBOL}" \
    "$SPACESHIP_SCREEN_SUFFIX"
}
