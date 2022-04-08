
# RANGER CONFIGURATION
function ranger-cd                                                               

  set tempfile '/tmp/chosendir'                                                  
  ranger --choosedir=$tempfile (pwd)                                    

  if test -f $tempfile                                                           
      if [ (cat $tempfile) != (pwd) ]                                            
        cd (cat $tempfile)                                                       
      end                                                                        
  end                                                                            

  rm -f $tempfile                                                                

end                                                                              

# Function to format c code
function format-c
	indent -ts 4 $argv

	rm -rf $argv~

end

bind -M insert \t accept-autosuggestion
### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
  function fish_mode_prompt; end
    for mode in insert default visual
        bind -M $mode \eu forward-char
        bind -M $mode \er 'ranger-cd ; commandline -f repaint'  
        bind -M $mode \cz 'fg'  
    end

end

# Set the cursor shapes for the different vi modes.
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block

### END OF VI MODE ###

set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

alias cp="cp -iv" 
alias mv="mv -iv" 
alias rm="rm -vI" 
alias bc="bc -ql" 
alias mkd="mkdir -pv" 
alias clr="clear"
alias yt="youtube-dl --add-metadata -i" 
alias yta="yt -x -f bestaudio/best" 
alias lo="ls" 
alias ls="exa -al --color=always --icons --group-directories-first --git"
alias la="exa -a --color=always --icons --group-directories-first --git"
alias ll="exa -l --color=always --icons --group-directories-first --git" 
alias ffmpeg="ffmpeg -hide_banner"
alias y="yay"

# Colorize commands when possible.
alias grep="grep --color=auto" 
alias diff="diff --color=auto" 
alias ccat="highlight --out-format=ansi"

# These common commands are just too long! Abbreviate them.
alias ka="killall" 

# GIT

alias g='git'
#compdef g=git
alias gst='git status'
#compdef _git gst=git-status
#compdef _git gd=git-diff
alias gdc='git diff --cached'
#compdef _git gdc=git-diff
alias gl='git pull'
#compdef _git gl=git-pull
alias gup='git pull --rebase'
#compdef _git gup=git-fetch
alias gp='git push'
#compdef _git gp=git-push
alias gd='git diff --name-only --diff-filter=d | xargs bat --diff'
#compdef _git gdv=git-diff
alias gc='git commit -v'
#compdef _git gc=git-commit
alias gc!='git commit -v --amend'
#compdef _git gc!=git-commit
alias gca='git commit -v -a'
#compdef _git gc=git-commit
alias gca!='git commit -v -a --amend'
#compdef _git gca!=git-commit
alias gcmsg='git commit -m'
#compdef _git gcmsg=git-commit
alias gco='git checkout'
#compdef _git gco=git-checkout
alias gcm='git checkout master'
alias gr='git remote'
#compdef _git gr=git-remote
alias grv='git remote -v'
#compdef _git grv=git-remote
alias grmv='git remote rename'
#compdef _git grmv=git-remote
alias grrm='git remote remove'
#compdef _git grrm=git-remote
alias grset='git remote set-url'
#compdef _git grset=git-remote
alias grup='git remote update'
#compdef _git grset=git-remote
alias grbi='git rebase -i'
#compdef _git grbi=git-rebase
alias grbc='git rebase --continue'
#compdef _git grbc=git-rebase
alias grba='git rebase --abort'
#compdef _git grba=git-rebase
alias gb='git branch'
#compdef _git gb=git-branch
alias gba='git branch -a'
#compdef _git gba=git-branch
alias gcount='git shortlog -sn'
#compdef gcount=git
alias gcl='git config --list'
alias gcp='git cherry-pick'
#compdef _git gcp=git-cherry-pick
alias glg='git log --stat --max-count=10'
#compdef _git glg=git-log
alias glgg='git log --graph --max-count=10'
#compdef _git glgg=git-log
alias glgga='git log --graph --decorate --all'
#compdef _git glgga=git-log
alias glo='git log --oneline'
#compdef _git glo=git-log
alias gss='git status -s'
#compdef _git gss=git-status
alias ga='git add'
#compdef _git ga=git-add
alias gm='git merge'
#compdef _git gm=git-merge
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gclean='git reset --hard; and git clean -dfx'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

alias trem="transmission-remote" 
alias YT="youtube-viewer" 
alias sdn="sudo shutdown -h now" 
alias e="$EDITOR" 
alias v="$EDITOR" 
alias xi="sudo xbps-install" 
alias xr="sudo xbps-remove -R" 
alias xq="xbps-query" 
alias zat="zathura"

alias magit="nvim -c MagitOnly" 


alias cac="cd /home/joao-vitor-sr/.cache ; ls -a" 
alias cf="cd /home/joao-vitor-sr/.config ; la" 
alias D="cd /home/joao-vitor-sr/Downloads ; ls -a" 
alias d="cd /home/joao-vitor-sr/Documents ; ls -a" 
alias dt="cd /home/joao-vitor-sr/.local/share ; ls -a" 
alias rr="cd /home/joao-vitor-sr/.local/src ; ls -a" 
alias h="cd /home/joao-vitor-sr ; ls -a" 
alias m="cd /home/joao-vitor-sr/Music ; ls -a" 
alias mn="cd /mnt ; ls -a" 
alias pp="cd /home/joao-vitor-sr/Pictures ; ls -a" 
alias sc="cd /home/joao-vitor-sr/.local/bin ; ls -a" 
alias src="cd /home/joao-vitor-sr/.local/src ; ls -a" 
alias vv="cd /home/joao-vitor-sr/Videos ; ls -a" 
alias bf="$EDITOR /home/joao-vitor-sr/.config/shell/bm-files" 
alias bd="$EDITOR /home/joao-vitor-sr/.config/shell/bm-dirs" 
alias cfx="$EDITOR /home/joao-vitor-sr/.config/x11/xresources" 
alias cfb="$EDITOR ~/.local/src/dwmblocks/config.h" 
alias cfv="$EDITOR /home/joao-vitor-sr/.config/nvim/init.vim" 
alias cfa="$EDITOR /home/joao-vitor-sr/.config/shell/aliasrc" 
alias cfp="$EDITOR /home/joao-vitor-sr/.config/shell/profile" 
alias cfm="$EDITOR /home/joao-vitor-sr/.config/mutt/muttrc" 
alias cfn="$EDITOR /home/joao-vitor-sr/.config/newsboat/config" 
alias cfu="$EDITOR /home/joao-vitor-sr/.config/newsboat/urls" 
alias cfmb="$EDITOR /home/joao-vitor-sr/.config/ncmpcpp/bindings" 
alias cfmc="$EDITOR /home/joao-vitor-sr/.config/ncmpcpp/config" 
alias cfl="$EDITOR /home/joao-vitor-sr/.config/lf/lfrc" 
alias cfL="$EDITOR /home/joao-vitor-sr/.config/lf/scope" 
alias cfX="$EDITOR /home/joao-vitor-sr/.config/sxiv/exec/key-handler"

set fish_greeting

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

# sources 
source /opt/asdf-vm/asdf.fish

# PATHS
fish_add_path /home/joao-vitor-sr/.asdf 

set fish_user_paths (yarn global bin)


pokemon-colorscripts -r

starship init fish | source
