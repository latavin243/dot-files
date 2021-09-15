#!/usr/bin/env bash
languages=`echo "golang python java lua vimscript" | tr ' ' '\n'`
core_utils=`echo "sed awk xargs find sync" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`
read -p "query: " query

if printf $languages | grep -qs $selected; then
    curl cht.sh/$selected/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done
else
    curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done
fi
