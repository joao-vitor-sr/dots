# sources 
source /opt/asdf-vm/asdf.fish

# PATHS
fish_add_path -g ~/.asdf 

set fish_user_paths (yarn global bin)

fish_add_path -g ~/.local/bin

# ENVIRONMENTS VARIABLES
set -x EDITOR "nvim"
set -x TERMINAL "kitty"
set -x BROWSER "qutebrowser"

gpg-connect-agent updatestartuptty /bye >/dev/null

set -x XDG_CONFIG_HOME ~/.config
set -x XDG_DATA_HOME ~/.local/share
set -x XDG_CACHE_HOME ~/.local/share/.cache
set -x XINITRC ~/.local/share/.config/x11/xinitrc
set -x NOTMUCH_CONFIG ~/.local/share/.config/notmuch-config
set -x GTK2_RC_FILES ~/.local/share/.config/gtk-2.0/gtkrc-2.0
set -x LESSHISTFILE "-"
set -x WGETRC ~/.local/share/.config/wget/wgetrc
set -x INPUTRC ~/.local/share/.config/shell/inputrc
set -x ZDOTDIR ~/.local/share/.config/zsh
set -x WINEPREFIX ~/.local/share/.local/share/wineprefixes/default
set -x KODI_DATA "~/.local/share/kodi"
set -x PASSWORD_STORE_DIR ~/.local/share/.local/share/password-store
set -x ANDROID_SDK_HOME ~/.local/share/.config/android
set -x CARGO_HOME ~/.local/share/.local/share/cargo
set -x GOPATH ~/.local/share/go
set -x ANSIBLE_CONFIG ~/.local/share/.config/ansible/ansible.cfg
set -x UNISON ~/.local/share/.local/share/unison
set -x HISTFILE ~/.local/share/.local/share/history
set -x WEECHAT_HOME ~/.local/share/.config/weechat
set -x MBSYNCRC ~/.local/share/.config/mbsync/config
set -x ELECTRUMDIR ~/.local/share/.local/share/electrum
set -x NVM_DIR ~/.local/share/.local/share/nvm
set -x DICS /usr/share/stardict/dic/
set -x SUDO_ASKPASS ~/.local/share/.local/bin/dmenupass
set -x FZF_DEFAULT_OPTS "--layout reverse --height 40%"
set -x LESS -R
set -x LESSOPEN "| /usr/bin/highlight -O ansi %s 2>/dev/null"
set -x QT_QPA_PLATFORMTHEME "gtk2"	# Have QT use gtk2 theme.
set -x MOZ_USE_XINPUT2 "1"		# Mozilla smooth scrolling/touchpads.
set -x AWT_TOOLKIT "MToolkit wmname LG3D"	#May have to install wmname
set -x _JAVA_AWT_WM_NONREPARENTING 1	# Fix for Java applications in dwm
