#!/usr/bin/env bash
languages=`echo "golang python java lua vimscript" | tr ' ' '\n'`
core_utils=`echo "sed awk xargs find sync" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`
read -p "query: " query

if printf $languages | grep -qs $selected; then
    curl -s cht.sh/$selected/`echo $query | tr ' ' '+'` | less
else
    curl cht.sh/$selected~$query | less
fi
