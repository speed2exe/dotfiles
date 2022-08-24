alias cd "cd_override"

function cd_override
    alias cd "cd"

    set prev_git (git rev-parse --show-toplevel 2> /dev/null)
    cd "$argv" || return
    set cur_git (git rev-parse --show-toplevel 2> /dev/null)

    # display git info if in different git repo
    test "$cur_git" && test "$prev_git" != "$cur_git" && onefetch

    # make sure file exists
    if test ! -f ~/marks/dir_history.txt
        mkdir -p ~/marks/
        touch ~/marks/dir_history.txt
    end

    # update file
    set dir_hists (string split ' ' (cat ~/marks/dir_history.txt))
    set cur_path "$PWD/"
    set existing_item_idx (contains -i "$cur_path" $dir_hists)
    if success
        if test ! $existing_item_idx -eq 1
            set -e dir_hists[$existing_item_idx]
            set -p dir_hists "$cur_path"
        end
    else
        set -p dir_hists "$cur_path"
    end

    string join \n $dir_hists | head -100 > ~/marks/dir_history.txt

    echo; print_boxed "$cur_path"; echo; la
    echo "$cur_path" > /tmp/.savedir

    alias cd "cd_override"
end
