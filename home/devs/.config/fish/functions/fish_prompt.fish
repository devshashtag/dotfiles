function random_color 
    set -l start 100
    set -l end 255

    set -l red (random $start $end)
    set -l green (random $start $end)
    set -l blue (random $start $end)

    set -l hex (math --base=hex "($red * 65536) + ($green * 256) + $blue")

    echo "$hex"|sed 's/^0x//'
end

function git_branch
    set -l git_branch_color (set_color fde6a4)
    set -l git_start_sep "$prompt_color ⚞ "
    set -l git_end_sep "$prompt_color ⚟"
    set -l git_branch_name (git branch --show-current 2>/dev/null)

    if test $git_branch_name
      echo "$git_start_sep$git_branch_color$git_branch_name$git_end_sep"
    end
end

function pwd_prompt
    set -l dir_color (set_color afffaf)
    set -l sep_color (set_color f35252)
    set -l sep "$sep_color ⇢ $dir_color"

    set -l pwd (string split "/" (dirs) |tail -n3 |string join "/")

    # style current path (root, user)
    set -l styled_pwd "$dir_color" (sed "s|\(.\)/|\1$sep|g" (echo $pwd|psub) | sed "s|^/\([^\$]\)|/$sep\1|g")

    echo $styled_pwd
end

function suffix_prompt
    set -l suffix '⚛ '

    if functions -q fish_is_root_user; and fish_is_root_user
        set suffix '# '
    end

    echo $prompt_color $suffix
end

function fish_prompt 
    set -g prompt_color (set_color (random_color))

    echo -n -s (pwd_prompt) (git_branch) (suffix_prompt)
end

