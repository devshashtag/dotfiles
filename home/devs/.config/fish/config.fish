# Commands to run in interactive sessions can go here
if status is-interactive
    # prompt
    source ~/.config/fish/functions/fish_prompt.fish

    # aliases
    source ~/.config/fish/aliases/shell.fish
    source ~/.config/fish/aliases/git.fish

    # environment
    source ~/.config/fish/env/shell.fish
    #source ~/.config/fish/env/ranger.fish

    # disable fish welcome message
    set -g fish_greeting
end
