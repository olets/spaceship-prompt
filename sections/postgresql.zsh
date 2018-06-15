#
# postgres
#
# postgres is a server-side scripting language designed primarily for web development.
# Link: http://www.postgres.net/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_POSTGRESQL_SHOW="${SPACESHIP_POSTGRESQL_SHOW=true}"
SPACESHIP_POSTGRESQL_PREFIX="${SPACESHIP_POSTGRESQL_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_POSTGRESQL_SUFFIX="${SPACESHIP_POSTGRESQL_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_POSTGRESQL_SYMBOL="${SPACESHIP_POSTGRESQL_SYMBOL="🐢 "}"
SPACESHIP_POSTGRESQL_COLOR="${SPACESHIP_POSTGRESQL_COLOR="blue"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of postgres
spaceship_postgresql() {
  [[ $SPACESHIP_POSTGRESQL_SHOW == false ]] && return

  # Show only if…
  # || return

  spaceship::exists postgresql || return

  local postgresql_version=$(postgres --version | grep --color=never -oe "[0-9.]\+")

  spaceship::section \
    "$SPACESHIP_POSTGRESQL_COLOR" \
    "$SPACESHIP_POSTGRESQL_PREFIX" \
    "${SPACESHIP_POSTGRESQL_SYMBOL}v${postgresql_version}" \
    "${SPACESHIP_POSTGRESQL_SUFFIX}"
}
