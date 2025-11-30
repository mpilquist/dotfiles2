set fish_greeting
fish_vi_key_bindings

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

set EDITOR hx

#set PATH /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin $PATH

if not functions -q fisher
    echo "WARNING: FISHER NOT INSTALLED - RUN THE FOLLOWING:"
    echo "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher && fisher install jethrokuan/z && fisher install edc/bass && fisher install IlanCosman/tide@v6"
end

#test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

set fish_function_path $fish_function_path ~/.dotfiles/plugin-foreign-env/functions

fenv source ~/.profile

if status is-interactive
    # Configure auto-attach/exit to your likings (default is off).
    # set ZELLIJ_AUTO_ATTACH true
    set ZELLIJ_AUTO_EXIT true
    eval (zellij setup --generate-auto-start fish | string collect)

    atuin init fish | source
end




# >>> JVM installed by coursier >>>
set -gx JAVA_HOME "/Users/mpilqu0037e@cable.comcast.com/Library/Caches/Coursier/arc/https/github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.14%252B7/OpenJDK17U-jdk_aarch64_mac_hotspot_17.0.14_7.tar.gz/jdk-17.0.14+7/Contents/Home"
# <<< JVM installed by coursier <<<

# >>> coursier install directory >>>
set -gx PATH "$PATH:/Users/mpilqu0037e@cable.comcast.com/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<
