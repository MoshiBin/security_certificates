
_fg() {
    echo -ne "\e[38;5;${1}m"
}

_bg() {
    echo -ne "\e[48;5;${1}m"
}

_reset() {
    echo -ne "\e[39;49m"
}

red() {
    _bg 167
    _fg 235
    echo -n "$@"
    _reset
    echo
}

cyan() {
    _bg 109
    _fg 235
    echo -n "$@"
    _reset
    echo

}
