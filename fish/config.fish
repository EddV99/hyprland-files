# set vi keybindings
set -g fish_key_bindings fish_vi_key_bindings

# tmuxifier init
eval (tmuxifier init - fish)

# commands to run in interactive sessions 
if status is-interactive
end

# greeting when opening fish shell
function fish_greeting
    ~/.local/bin/random-batman-quote.sh | cowsay -r 
    echo ""
    cal -3
end

# right prompt
function fish_right_prompt
    echo (set_color de79fc)(fish_vcs_prompt) ' '
end
# main prompt
function fish_prompt
    set -l color_user 5e409d
    set -l color_in 24837b    
    set -l color_dir a02f6f
    set -l color_arrow bc5215

    string join '' -- ' ' (set_color $color_user) $USER (set_color $color_in)' in ' (set_color $color_dir) (prompt_pwd --full-length-dirs 2) (set_color $color_arrow)'
 󱞩 '
end

# vi mode prompt
function fish_mode_prompt
end

# cursor
set fish_cursor_default block
set fish_cursor_insert block

# alias
alias vim "nvim"
alias ls "ls --color -h --group-directories-first"
alias t "tmux"
alias ts "tmuxifier load-session"
alias tx "tmuxifier"
alias la "ls -a"
alias ll "ls -l"
alias ff "fastfetch"
alias cat "bat"
alias image "sxiv"
alias config "cd ~/.config"
alias pp "powerprofilesctl"
