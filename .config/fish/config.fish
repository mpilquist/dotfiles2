set fish_greeting
fish_vi_key_bindings

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

set EDITOR hx

set PATH /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin $PATH

if not functions -q fisher
    echo "WARNING: FISHER NOT INSTALLED - RUN THE FOLLOWING:"
    echo "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher && fisher install jethrokuan/z && fisher install edc/bass && fisher install IlanCosman/tide@v6"
end

set fish_function_path $fish_function_path ~/.dotfiles/plugin-foreign-env/functions

fenv source ~/.profile

if status is-interactive; and test -t 0 # Ensure there's a real terminal attached
    set ZELLIJ_AUTO_EXIT true
    eval (zellij setup --generate-auto-start fish | string collect)

    atuin init fish | source
end
