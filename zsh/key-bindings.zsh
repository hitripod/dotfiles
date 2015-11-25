bindkey '^[[H'  beginning-of-line
bindkey '^[[F'  end-of-line
bindkey "^[[3~" delete-char
bindkey '^[[B'  history-beginning-search-forward
bindkey '^[[A'  history-beginning-search-backward
bindkey "^x^e" expand-cmd-path
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey -M vicmd "^M" accept_line
