function vim
    if test (count $argv) -eq 0
        if test -f "./Session.vim"
            nvim -S Session.vim -c 'lua vim.g.savesession = true'
        else
            nvim -c 'lua vim.g.savesession = true'
        end
    else
        nvim $argv
    end
end

