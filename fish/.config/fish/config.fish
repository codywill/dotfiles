if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
end

function fish_user_key_bindings
    bind \cy forward-char
end
