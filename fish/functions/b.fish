# disown all jobs let them run on their own in background
function b
    for j in (jobs | cut -f 2)
        disown $j
    end
end
