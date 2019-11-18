# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Antigen

source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle wd
antigen bundle extract

antigen theme denysdovhan/spaceship-prompt

SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false

antigen apply

# Alias
alias vi=vim  
alias please='sudo $(fc -ln -1)'

# History
HISTSIZE=9999999               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history        #Where to save history to disk
SAVEHIST=9999999               #Number of history entries to save to disk
setopt    appendhistory        #Append history to the history file (no overwriting)
setopt    share_history        #Share history across terminals
setopt    inc_append_history   #Immediately append to the history file, not just when a term is killed

# Misc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR=vim
export PATH=$HOME/bin:$PATH
