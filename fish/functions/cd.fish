alias cd "cd_override"

function cd_override
    alias cd "cd"

    cd $argv

    # make sure file exists
    if test ! -f ~/marks/dir_history.txt
        mkdir -p ~/marks/
        touch ~/marks/dir_history.txt
    end

    # update file
    set dir_hists (string split ' ' (cat ~/marks/dir_history.txt))
    set cur_path (pwd)
    set existing_item_idx (contains -i $cur_path $dir_hists)
    if test $status -eq 0
        if test ! $existing_item_idx -eq 1
            set -e dir_hists[$existing_item_idx]
            set -p dir_hists $cur_path
        end
    else
        set -p dir_hists $cur_path
    end

    string join \n $dir_hists | head -9 > ~/marks/dir_history.txt


    alias cd "cd_override"
end