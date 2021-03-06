##################
# .zshrc
# http://www.machu.jp/b/ZshRc.html
##################

# keymap
bindkey -e
bindkey "^?"	backward-delete-char
bindkey "^H"	backward-delete-char
bindkey "^[[3~"	delete-char
bindkey "^[[1~"	beginning-of-line
bindkey "^[[4~" end-of-line
bindkey '^i' menu-expand-or-complete
bindkey '^[^i' reverse-menu-complete
bindkey '^[i' expand-or-complete
bindkey "^[[Z" reverse-menu-complete # Shift-tabで補完を逆順に

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
setopt share_history
function history-all {
	history -E 1
}
setopt  hist_ignore_all_dups
setopt  hist_reduce_blanks


# color
local GRAY=$'%{\e[1;30m%}'
local LIGHT_GRAY=$'%{\e[0;37m%}'
local WHITE=$'%{\e[1;37m%}'
local LIGHT_BLUE=$'%{\e[1;36m%}'
local YELLOW=$'%{\e[1;33m%}'
local PURPLE=$'%{\e[1;35m%}'
local GREEN=$'%{\e[1;32m%}'
local BLUE=$'%{\e[1;34m%}'
local BLACK=$'%{\e[0;30m%}'
#local DEFAULT=$'%{\e[1;m%}'

# vcs_infoロード
autoload -Uz vcs_info
# PROMPT変数内で変数参照する
setopt prompt_subst

# vcsの表示
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
# プロンプト表示直前にvcs_info呼び出し
#precmd() { vcs_info }
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}


# prompt
	#PROMPT=$GREEN"${USER}@${HOSTNAME} $WHITE%(!.#.$) "$WHITE
	#RPROMPT=$BLUE"[%~]"$WHITE
    #PROMPT=$'\n'$GREEN'${USER}@${HOSTNAME} '$LIGHT_BLUE'%~ '$'\n'$DEFAULT'%(!.#.$) '
    #PROMPT=$'\n'$GREEN'${USER}@${HOST} '$LIGHT_BLUE'%~ '$'\n'$WHITE'%(!.#.$) '
    PROMPT=$'\n'$GREEN'${USER}@${HOST} '$YELLOW'${vcs_info_msg_0_} '$LIGHT_BLUE'%~ '$'\n'$WHITE'%(!.#.$) '
	#PROMPT=$GREEN"${USER}@${HOSTNAME} $BLUE%(!.#.$) "$BLACK
	#RPROMPT=$BLUE"[%~]"$BLACK

# abbreviation

typeset -A myabbrev
myabbrev=(
    "lg"    "| grep"
)

my-expand-abbrev() {
    local left prefix
    left=$(echo -nE "$LBUFFER" | sed -e "s/[_a-zA-Z0-9]*$//")
    prefix=$(echo -nE "$LBUFFER" | sed -e "s/.*[^_a-zA-Z0-9]\([_a-zA-Z0-9]*\)$/\1/")
    LBUFFER=$left${myabbrev[$prefix]:-$prefix}" "
}
zle -N my-expand-abbrev
bindkey     " "         my-expand-abbrev

# User specific aliases and functions
#alias ls='ls -F --color=auto'
#alias ll='ls -Fl --color=auto'
#alias la='ls -Fa --color=auto'
#alias lla='ls -Fla --color=auto'
alias ls='ls -FG'
alias ll='ls -FGl'
alias la='ls -FGa'
alias lla='ls -FGla'
#alias -g G=' | grep '
#alias gd='dirs -v; echo -n "select number: "; read newdir; cd -"$newdir"'
#alias less='less -N'
alias pfind='ps aux | grep '
#alias top='top -RFXu'
alias top='top -o CPU'
autoload zmv
alias zmv='noglob zmv'

#alias for git
alias gitb='git branch'
alias gitco='git checkout'
alias gitst='git status'

setopt PROMPT_SUBST
setopt share_history
setopt autopushd

export ZLS_COLORS=$LSCOLORS

# completion
fpath=(/usr/local/share/zsh-completions ~/.zsh/completion $fpath)
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select true
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ${(s.:.)LSCOLORS}

# ENV
#export PAGER='lv -c'
#export LANG='ja_JP.eucJP'
export LANG='ja_JP.UTF-8'
#export PATH=$PATH:$HOME/bin:/usr/local/flex/bin
export PATH=$PATH:$HOME/bin:$HOME/bin/google_appengine:/opt/local/bin:$HOME/.renv/bin
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH="$PATH:/Users/gakkie/Library/Android/sdk/platform-tools"
export EDITOR=vim
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"
export LSCOLORS=gxfxcxdxbxegedabagacad
export CC=/usr/bin/gcc
export FONTCONFIG_PATH=/opt/X11/lib/X11/fontconfig

# ruby
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
