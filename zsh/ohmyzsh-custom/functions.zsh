#!/bin/bash

# usage example: lnlog $DEVLOGS_PATH/personal/dotfiles.md
lnlog() {
    log_path="$1"
    log_dirname=$(dirname "$log_path")
    log_extension="${log_path/*./.}"
    # corner case: no file extension
    [[ "$log_extension" == "$log_path" ]] && log_extension=''
    notes_basename="vgp-notes$log_extension"
    log_shortpath="${log_path/*dev-logs/dev-logs}"

    if [[ -z "$log_path" ]]; then
        echo 'lnlog error: no path given'
        echo 'lnlog usage example: lnlog $DEVLOGS_PATH/personal/dotfiles.md'
        return 1
    elif [[ ! "$log_path" =~ ^.*dev-logs/.+$ ]]; then
        echo 'lnlog error: path must be a file within dev-logs/'
        echo 'lnlog usage example: lnlog $DEVLOGS_PATH/personal/dotfiles.md'
        return 1
    elif [[ ! -d "$log_dirname/" ]]; then
        echo "lnlog error: no '$log_dirname' directory"
        return 1
    elif [[ -h "$notes_basename" ]]; then
        echo "lnlog error: '$notes_basename' is already a link"
        return 1
    elif [[ -f "$notes_basename" ]]; then
        if [[ ! -a "$log_path" ]]; then
            # notes exist, but they're not kept in dev-logs yet
            mv -n "$notes_basename" "$log_path"
            ln -s "$log_path" "$notes_basename"
            echo "lnlog: moved '$notes_basename' to '$log_shortpath', then linked it here"
        else
            # both notes and dev-log exist
            echo "lnlog error: cannot clobber existing '$log_shortpath' with '$notes_basename'"
            return 1
        fi
    elif [[ -f "$log_path" ]]; then
        # dev-log already exists, but it's not linked here yet
        ln -s "$log_path" "$notes_basename"
        echo "lnlog: linked existing '$log_shortpath' on '$notes_basename'"
    else
        # brand new dev-log
        touch "$log_path"
        ln -s "$log_path" "$notes_basename"
        echo "lnlog: created '$log_shortpath', linked it on '$notes_basename'"
    fi
}
