#!/usr/bin/env bash
#Author: <limkokhole@gmail.com>

#recursvie which access subdir/*, rf: http://stackoverflow.com/questions/1690809/what-expands-to-all-files-in-current-directory-recursively
#shift, rf: rf: http://askubuntu.com/questions/521192/how-to-pass-wildcard-to-path-parameter-of-find-command-via-a-variable-in-scr
function recurcat () {
    [ -z "$2" ] && echo "Missing 1st arg [Usage: recurcat extension (don't use single quotes bcoz nid expand)path] e.g. recurcat java **/*.java " && return 1
    shopt -q globstar && : || { echo "globstar not enabled. Simply run again it will works or put it in ~/.bashrc for permanent change." && shopt -s globstar && return 1; }
    #ensue shopt -s globstar right after this msg, the trick to ask user run 2nd time can direct works #but you cant put 1st line and expect it direct work bcoz the args already expans before enter this func
    #echo $1
    #echo "$@" if empty will find <empty> and find all curr dir
    #no nid reset color bcoz highlight already reset it
    #find "$@" -iname ".git" -prune -o -type f -exec bash -c 'printf "%s" "${p_yellow}"' \; -exec bash -c 'echo \<{}\>' \; -exec bash -c 'highlight -O xterm256 -S sh {}'  \;

    lang="$1"
    shift 

    find "$@" -type f -exec bash -c 'echo; echo -e "\e[41m Filepath: \e[40m\e[93m {}"; tput sgr0; echo' \; -exec bash -c "highlight -l -O xterm256 -S "$lang" {}"  \;

}

#'recurcat sh /etc/ld.so.conf.d/* |& g '/i686-linux-gnu' , will not work due to highlight add some color code(use `hd`(hexdump -C) to see), so nid `recurcat_g`
function recurcat_g () {
    [ -z "$2" ] && echo "Missing 1st arg [Usage: recurcat extension (don't use single quotes bcoz nid expand)path] e.g. recurcat java **/*.java " && return 1
    shopt -q globstar && : || { echo "globstar not enabled. Simply run again it will works or put it in ~/.bashrc for permanent change." && shopt -s globstar && return 1; }
    lang="$1"
    shift
    find "$@" -type f -exec bash -c 'echo; echo -e "\e[41m Filepath: \e[40m\e[93m {}"; tput sgr0; echo' \; -exec bash -c "cat {}"  \;

}


