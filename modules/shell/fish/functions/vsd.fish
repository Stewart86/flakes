function vsd
    if count $argv > /dev/null
        cd $(fd . $HOME --max-depth 5 -t d --color=always --hidden -I -E=node_modules -E=.cache -E=__pycache__ -E=.git -E=virtualenvs -E=virtualenv | fzf --border --cycle --layout=reverse --preview-window=wrap --preview 'lsd --tree --color always --icon always --depth 3 {}' --ansi --height=30 -q $argv)
    else
        cd $(fd . $HOME --max-depth 5 -t d --color=always --hidden -I -E=node_modules -E=.cache -E=__pycache__ -E=.git -E=virtualenvs -E=virtualenv | fzf --border --cycle --layout=reverse --preview-window=wrap --preview 'lsd --tree --color always --icon always --depth 3 {}' --ansi --height=30)
    end
    nvim
end
