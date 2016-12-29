# Valid colors include:
#
# black, red, green, yellow, blue, magenta, cyan, white
# brblack, brred, brgreen, bryellow, brblue, brmagenta, brcyan, brwhite

# Set basic prompt colors
set fish_color_autosuggestion black --bold # Suggested completion
set fish_color_command magenta
set fish_color_comment black --bold
set fish_color_cwd black --bold
set fish_color_cwd_root red
set fish_color_end white
set fish_color_error red
set fish_color_escape yellow
set fish_color_history_current yellow
set fish_color_host blue
set fish_color_match white --bold
set fish_color_normal white
set fish_color_operator white --bold
set fish_color_param blue
set fish_color_quote yellow
set fish_color_redirection yellow --bold
set fish_color_search_match cyan --underline
set fish_color_status red
set fish_color_user green
set fish_color_valid_path green --underline

# Set git prompt colors
set -g __fish_git_prompt_color_branch white
set -g __fish_git_prompt_color_branch_detached red
set -g __fish_git_prompt_color_dirtystate yellow --bold
set -g __fish_git_prompt_color_stagedstate green
set -g __fish_git_prompt_color_flags cyan
set -g __fish_git_prompt_color_prefix normal
set -g __fish_git_prompt_color_suffix normal
set -g __fish_git_prompt_color_bare red
set -g __fish_git_prompt_color_merging yellow --bold
set -g __fish_git_prompt_color_upstream magenta
