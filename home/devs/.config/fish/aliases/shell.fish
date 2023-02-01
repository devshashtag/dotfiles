# clean swap
abbr --add boost 'sudo swapoff -a; sleep 5; sudo swapon -a'
# change relative urls to absolute urls
abbr --add rel-to-abs-url 'sed -i "s|\"[\./]\+/|\"/|"'
# display all urls in one file
abbr --add ls-url 'grep "\"[\./]*/" -rn'
# display relative urls
abbr --add ls-rel-url 'grep "\"[\./]\+/" -rn'
# gcc
abbr --add gcc 'gcc -Wall -Wextra -Wpedantic -Wunused'

