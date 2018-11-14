# Append paths
appendpath () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

#user path setting
appendpath "${HOME}/bin"

unset appendpath
export PATH
