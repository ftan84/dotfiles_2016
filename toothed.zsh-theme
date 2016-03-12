# Based on the Toothe custom prompt found here:
# https://gist.github.com/encodes/5575420#file-toothe-zsh_theme

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[cyan]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

#RVM and git settings
if [[ -s ~/.rvm/scripts/rvm ]] ; then
  RPS1='$(git_custom_status)%{$fg[red]%}[`~/.rvm/bin/rvm-prompt`]%{$reset_color%} $EPS1'
else
  if which rbenv &> /dev/null; then
    RPS1='$(git_custom_status)%{$fg[red]%}[`rbenv version | sed -e "s/ (set.*$//"`]%{$reset_color%} $EPS1'
  else
    RPS1='$(git_custom_status) %{$fg[yellow]%}$(virtualenv_prompt_info) %{$fg[magenta]%}%D{[%I:%M:%S]}%{$reset_color%} $EPS1'
  fi
fi

#PROMPT='%{$fg[cyan]%}[%~% ]%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '
# PROMPT='%{$fg_bold[yellow]%}%n@%m %{$fg[blue]%}[%~% ]%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '
#PROMPT='%{$fg_bold[green]%}%n@%m $fg[cyan]%}[%~% ]%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b %{$reset_color%}'
PROMPT='%{$fg_bold[yellow]%}%n %{$fg[blue]%}[%~% ]%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '

