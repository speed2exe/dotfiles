# kill all jobs
function q
    for j in (jobs | cut -f 2)
        kill $j && disown $j 2> /dev/null
    end
end
