# Put this in $HOME/.oh-my-zsh/custom folder

# ORDER
SPACESHIP_PROMPT_ORDER=(
  jobs
  user
  host
  dir
  # kubecontext
  git
  char
)

SPACESHIP_RPROMPT_ORDER=(
  time
)

# COMMON
SEPARATOR=" "

# USER
SPACESHIP_USER_PREFIX="" # remove `with` before username
SPACESHIP_USER_SUFFIX="" # remove space before host

# HOST
# Result will look like this:
#   username@:(hostname)
SPACESHIP_HOST_PREFIX="@:("
SPACESHIP_HOST_SUFFIX=") "

# DIR
SPACESHIP_DIR_PREFIX='' # disable directory prefix, cause it's not the first section

# GIT
# Disable git symbol
SPACESHIP_GIT_SYMBOL="" # disable git prefix
SPACESHIP_GIT_BRANCH_PREFIX="" # disable branch prefix too
# Wrap git in `git:(...)`
SPACESHIP_GIT_PREFIX='git:'
SPACESHIP_GIT_SUFFIX=" "
SPACESHIP_GIT_BRANCH_SUFFIX="" # remove space after branch name
# Unwrap git status from `[...]`
SPACESHIP_GIT_STATUS_PREFIX=""
SPACESHIP_GIT_STATUS_SUFFIX=""
SPACESHIP_GIT_STATUS_STASHED='§'

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL='$ '
SPACESHIP_CHAR_SYMBOL_ROOT='# '
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_FORMAT='%* %D'

# Background jobs
SPACESHIP_JOBS_SHOW=true
SPACESHIP_JOBS_SYMBOL=✦
SPACESHIP_JOBS_COLOR=blue
SPACESHIP_JOBS_AMOUNT_PREFIX=" ["
SPACESHIP_JOBS_AMOUNT_SUFFIX="]"

# Kubernetes
SPACESHIP_KUBECONTEXT_SHOW=true
SPACESHIP_KUBECONTEXT_PREFIX=$SEPARATOR
SPACESHIP_KUBECONTEXT_SUFFIX=$SEPARATOR
