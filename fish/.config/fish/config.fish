
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
alias g="git" 
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
