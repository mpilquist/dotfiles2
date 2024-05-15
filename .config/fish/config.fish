set fish_greeting
fish_vi_key_bindings

set EDITOR hx

set PATH /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin $PATH

if not functions -q fisher
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher && fisher install jethrokuan/z && fisher install edc/bass && fisher install IlanCosman/tide@v6
end

test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

set fish_function_path $fish_function_path ~/.dotfiles/plugin-foreign-env/functions

fenv source ~/.profile

if status is-interactive
    # Configure auto-attach/exit to your likings (default is off).
    # set ZELLIJ_AUTO_ATTACH true
    set ZELLIJ_AUTO_EXIT true
    eval (zellij setup --generate-auto-start fish | string collect)

    atuin init fish | source
end
