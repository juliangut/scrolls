#!/usr/bin/env bash

__powerline() {
    SECTION_LIST=('\u@\h' 'path' 'git')
    SECTION_COLORS=('236' '246' '238' '248' '25' '111')
    STATUS_COLORS=('2' '186' '124' '253')

    PATH_MAX_LENGTH=30

    GIT_BRANCH_SYMBOL=' '
    GIT_BRANCH_CHANGED_SYMBOL='+'
    GIT_NEED_PUSH_SYMBOL='↑'
    GIT_NEED_PULL_SYMBOL='↓'

    PS_SYMBOL_DARWIN=''
    PS_SYMBOL_LINUX='$'
    PS_SYMBOL_OTHER='%'

    __shorten_pwd() {
        local LEFT_LENGTH=10
        local RIGHT_LENGTH=`expr $PATH_MAX_LENGTH - 3 - $LEFT_LENGTH`
        local DIR=`echo "${PWD}" | sed "s/\\/home\\/$USER/~/" | sed "s/\\/Users\\/$USER/~/"`

        if [ ${#DIR} -gt $(($PATH_MAX_LENGTH)) ]; then
            printf "${DIR:0:$(($LEFT_LENGTH))}...${DIR:$((${#DIR}-$RIGHT_LENGTH)):$RIGHT_LENGTH}"
        else
            printf "$DIR"
        fi
    }

    __git_info() {
        [ -x "$(which git)" ] || return    # git not found

        local git_eng="env LANG=C git"   # force git output in English to make our work easier
        # get current branch name or short SHA1 hash for detached head
        local branch="$($git_eng symbolic-ref --short HEAD 2>/dev/null || $git_eng describe --tags --always 2>/dev/null)"
        [ -n "$branch" ] || return  # git branch not found

        local marks

        # branch is modified?
        [ -n "$($git_eng status --porcelain)" ] && marks+=" $GIT_BRANCH_CHANGED_SYMBOL"

        # how many commits local branch is ahead/behind of remote?
        local stat="$($git_eng status --porcelain --branch | grep '^##' | grep -o '\[.\+\]$')"
        local aheadN="$(echo $stat | grep -o 'ahead [[:digit:]]\+' | grep -o '[[:digit:]]\+')"
        local behindN="$(echo $stat | grep -o 'behind [[:digit:]]\+' | grep -o '[[:digit:]]\+')"
        [ -n "$aheadN" ] && marks+=" $GIT_NEED_PUSH_SYMBOL$aheadN"
        [ -n "$behindN" ] && marks+=" $GIT_NEED_PULL_SYMBOL$behindN"

        printf "$GIT_BRANCH_SYMBOL$branch$marks"
    }

    RESET="\[$(tput sgr0)\]"

    case "$(uname)" in
        Darwin)
            PS_SYMBOL=$PS_SYMBOL_DARWIN
            ;;
        Linux)
            PS_SYMBOL=$PS_SYMBOL_LINUX
            ;;
        *)
            PS_SYMBOL=$PS_SYMBOL_OTHER
    esac

    ps1() {
        # Check the exit code of the previous command and display different
        # colors in the prompt accordingly.
        if [ $? -eq 0 ]; then
            local PS_STATUS="success"
        else
            local PS_STATUS="error"
        fi

        local PS_LINE=""

        local CUR_BG="${SECTION_LIST[0]}"
        local CUR_FG="${SECTION_LIST[1]}"
        local PREV_BG="${SECTION_LIST[0]}"
        local PREV_FG="${SECTION_LIST[1]}"
        for ((i=0; i<${#SECTION_LIST[@]}; i++)); do
            local BG_INDEX=`expr ${i}*2`
            local FG_INDEX=`expr ${BG_INDEX}+1`
            local CUR_TEXT=""

            case "${SECTION_LIST[$i]}" in
                path)
                    CUR_TEXT+=$(__shorten_pwd)
                    ;;
                git)
                    CUR_TEXT+=$(__git_info)
                    ;;
                *)
                    CUR_TEXT+="${SECTION_LIST[$i]}"
            esac

            if [ "$CUR_TEXT" != "" ]; then
                PREV_BG="$CUR_BG"
                PREV_FG="$CUR_FG"
                CUR_BG="${SECTION_COLORS[$BG_INDEX]}"
                CUR_FG="${SECTION_COLORS[$FG_INDEX]}"

                if [ "$PS_LINE" != "" ]; then
                    PS_LINE+="\[$(tput setab $CUR_BG)\]\[$(tput setaf $PREV_BG)\]$RESET"
                fi
                PS_LINE+="\[$(tput setab $CUR_BG)\]\[$(tput setaf $CUR_FG)\] $CUR_TEXT $RESET"
            fi
        done

        # Status and prompt
        PREV_BG="$CUR_BG"
        PREV_FG="$CUR_FG"

        if [ "$PS_STATUS" == "success" ]; then
            CUR_BG="${STATUS_COLORS[0]}"
            CUR_FG="${STATUS_COLORS[1]}"
        else
            CUR_BG="${STATUS_COLORS[2]}"
            CUR_FG="${STATUS_COLORS[3]}"
        fi

        if [ "$PS_LINE" != "" ]; then
            PS_LINE+="\[$(tput setab $CUR_BG)\]\[$(tput setaf $PREV_BG)\]$RESET"
        fi

        PS_LINE+="\[$(tput setab $CUR_BG)\]\[$(tput setaf $CUR_FG)\] $PS_SYMBOL $RESET"

        PS1="$PS_LINE\[$(tput setaf $CUR_BG)\]$RESET "
    }

    PROMPT_COMMAND=ps1
}

__powerline
unset __powerline
