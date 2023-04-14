if status is-interactive
    # Commands to run in interactive sessions can go here
end
abbr --add ee exit
abbr --add vv nvim
abbr --add pp pnpm
abbr --add bb ./build.sh
abbr --add t tmux
abbr --add tt time
abbr --add gk git checkout
abbr --add g  git clone

set -U GPG_TTY $(tty)
