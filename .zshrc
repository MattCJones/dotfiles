## Antigen
# curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > antigen.zsh
# Put this at the top
source ~/software/antigen/antigen.zsh
# Install Oh-My-Zsh for helpful commands and plugins
# See wiki: https://github.com/ohmyzsh/ohmyzsh/wiki
# `omz --help` for command-line help
antigen use oh-my-zsh
# See oh-my-zsh plugins here: /Plugins
# antigen bundle git  # many git aliases
# antigen bundle heroku
antigen bundle pip  # pip completion
# antigen bundle lein
# antigen bundle command-not-found
# antigen bundle zsh-users/zsh-syntax-highlighting # MUST BE LAST
antigen apply # Tell antigen that you're done.

#antigen theme robbyrussell # Load the theme.

## Source other files

# Mass renaming with z-move
autoload -U zmv # zmv 'foo(*)' 'bar$1'
alias mmv='noglob zmv -W' # intuitive move without brackets: mmv foo.* bar.*

# Set up the prompt
autoload -Uz promptinit
promptinit
prompt redhat
#type prompt -p to see all prompts
#adam1, adam2, bart, bigfade, bigfade, clint, elite2, elite2, elite2, elite2, elite2, elite, elite, fade [blue, green, magenta, etc], fire, fire, off, oliver, pws, redhat, suse, zefram
# Favorites: off, pws, walters
PROMPT="%{$fg[yellow]%}[%T]%{$fg[cyan]%}[%h]%{$fg[green]%}%n@%{$fg[green]%}%m:%{$fg_no_bold[blue]%}%1~%{$reset_color%}%# "
RPROMPT=""


# History settings - ignore duplicates
setopt histignorealldups sharehistory 

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

## Completions
# Add colors to tab completion
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

setopt noautomenu # bash-like tab completion

# Vman completion - https://github.com/jez/vim-superman
compdef vman="man"

## VIM OR EMACS MODE
# What I ultimately want is emacs mode until I press escape
#Look into https://github.com/hchbaw/opp.zsh for more advanced
if [[ 0 -eq 1 ]]; then # 1 to use vim
    bindkey -v # -e for emacs -v for vim
    bindkey '^P' up-history
    bindkey '^N' down-history
    bindkey '^?' backward-delete-char
    bindkey '^h' backward-delete-char
    bindkey '^w' backward-kill-word
    bindkey '^r' history-incremental-search-backward
    export KEYTIMEOUT=1 # reduce delay on pressing escape
    # Add "normal" text to prompt when in normal mode (VERY SLOW RIGHT NOW)
    #function zle-line-init zle-keymap-select {
    #    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
    #    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    #    zle reset-prompt
    #}
    #zle -N zle-line-init  # enable function
    #zle -N zle-keymap-select # enable function
else
    bindkey -e # -e for emacs -v for vim
fi

## Dirstack: use cd -# to go to a recent directory
mkdir -p ~/.cache/zsh
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}
DIRSTACKSIZE=20 # number of past directories that are remembered
setopt autopushd pushdsilent pushdtohome
# Remove duplicate entries
setopt pushdignoredups
# This reverts the +/- operators.
setopt pushdminus


## Special aliases
alias hist='fc -l '
function his() { fc -l -$1; }

## Source my aliases
source ~/.bash_matt
source ~/.bash_matt_private
