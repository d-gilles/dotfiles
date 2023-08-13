# LENICO 03/2023

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

PROMPT='
╭─⟪${user_host}$(virtualenv_info)$(git_prompt_info)%{$fg_bold[green]%}%~%{$reset_color%}
╰───❱'

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local user_host="%(!.%{$fg[red]%}.%B%{$fg[green]%})%n@%m%{$reset_color%} "
local user_symbol='%(!.#.⪧)'
local current_dir="%B%{$fg[white]%}%~ %{$reset_color%}"


ZSH_THEME_GIT_PROMPT_PREFIX="%B%{%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" 🔴 %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" 🟢 %{$reset_color%}"

# show the exitcode of the last command on the right side of the prompt
RPROMPT="$return_code"
