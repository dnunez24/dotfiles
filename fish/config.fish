### Configure fish ###

# Configure git prompt
set __fish_git_prompt_show_informative_status yes
set __fish_git_prompt_showuntrackedfiles yes
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showstashstate yes
set __fish_git_prompt_showcolorhints yes
set __fish_git_prompt_char_stateseparator ' '
set __fish_git_prompt_char_upstream_prefix 'u'

# Force 256 color mode for Hyper
set fish_term256 1

# Set greeting to null
set fish_greeting

# Set vi mode cursor styles
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_visual block

# use vi mode keybindings
set fish_key_bindings fish_vi_key_bindings 

# Set pwd length to 1 character, e.g. ~/a/b/c/dir>
set -U fish_prompt_pwd_dir_length 1

# Set custom bin directories in PATH
set fish_user_paths "/usr/local/sbin" "/Applications/LilyPond.app/Contents/Resources/bin"