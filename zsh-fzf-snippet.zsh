FZF_SNIPPET_CONFIG_DIR=${FZF_SNIPPET_CONFIG_DIR:-"$HOME/.config/fzf-snippets"}
FZF_SNIPPET_EDITOR=${EDITOR:-vim}

function fzf-snippet-selection() {
  local out snippet key file

  if [[ ! -f $FZF_SNIPPET_CONFIG_DIR/snippets ]]; then
    echo 'snippets file does not exist' >&2
    exit 1
  fi

  IFS=$'\n' out=($(\grep -v "^#" $FZF_SNIPPET_CONFIG_DIR/snippets | \grep -v "^\s*$" | fzf --query "$LBUFFER" --prompt="Snippet> " --preview="cat $FZF_SNIPPET_CONFIG_DIR/{1}" --expect=ctrl-e))
  key=$(echo "$out" | head -1)
  snippet=$(echo "$out" | head -2 | tail -1)

  if [[ $snippet != "" ]]; then
    if [[ $key == "ctrl-e" ]]; then
      file=$(echo $snippet | cut -d' ' -f 1)
      eval "$FZF_SNIPPET_EDITOR $FZF_SNIPPET_CONFIG_DIR/$file"
    else
      snippet=$(echo $snippet | awk '{for(i=2;i<NF;i++){printf("%s%s",$i,OFS=" ")}print $NF}')
      BUFFER=$snippet
      CURSOR=$#BUFFER
    fi
  fi
  zle reset-prompt
}
zle -N fzf-snippet-selection
