#!/usr/bin/env bash

__powerline() {
    GIT_BRANCH_SYMBOL=' '
    GIT_BRANCH_CHANGED_SYMBOL='+'
    GIT_NEED_PUSH_SYMBOL='↑'
    GIT_NEED_PULL_SYMBOL='↓'

    PATH_MAX_LENGTH=30

    # SECTION_HOST > SECTION_PATH > SECTION_GIT > SECTION_SUCCESS/SECTION_ERROR
    SECTION_HOST_BG=236
    SECTION_HOST_FG=248
    SECTION_PATH_BG=238
    SECTION_PATH_FG=250
    SECTION_GIT_BG=25
    SECTION_GIT_FG=111
    SECTION_SUCCESS_BG=2
    SECTION_SUCCESS_FG=15
    SECTION_ERROR_BG=160
    SECTION_ERROR_FG=15

    PS_SYMBOL_DARWIN=''
    PS_SYMBOL_LINUX='$'
    PS_SYMBOL_OTHER='%'

    DIM="\[$(tput dim)\]"
    REVERSE="\[$(tput rev)\]"
    RESET="\[$(tput sgr0)\]"
    BOLD="\[$(tput bold)\]"

    function __shorten_pwd()
    {
        local LEFT_LENGTH=10
        local RIGHT_LENGTH=`expr $PATH_MAX_LENGTH - 3 - $LEFT_LENGTH`

        local DIR=`echo "${PWD}" | sed "s/\\/home\\/$USER/~/" | sed "s/\\/Users\\/$USER/~/"`

        if [ ${#DIR} -gt $(($PATH_MAX_LENGTH)) ]; then
            echo "${DIR:0:$(($LEFT_LENGTH))}...${DIR:$((${#DIR}-$RIGHT_LENGTH)):$RIGHT_LENGTH}"
        else
            echo "$DIR"
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

        printf " $GIT_BRANCH_SYMBOL$branch$marks "
    }

    SH_BG="\[$(tput setab $SECTION_HOST_BG)\]"
    SH_TX="\[$(tput setaf $SECTION_HOST_FG)\]"

    SP_BG="\[$(tput setab $SECTION_PATH_BG)\]"
    SP_FG="\[$(tput setaf $SECTION_HOST_BG)\]"
    SP_TX="\[$(tput setaf $SECTION_PATH_FG)\]"

    SG_BG="\[$(tput setab $SECTION_GIT_BG)\]"
    SG_FG="\[$(tput setaf $SECTION_PATH_BG)\]"
    SG_TX="\[$(tput setaf $SECTION_GIT_FG)\]"

    SPS_BG="\[$(tput setab $SECTION_SUCCESS_BG)\]"
    SPS_FG="\[$(tput setaf $SECTION_GIT_BG)\]"
    SPS_TX="\[$(tput setaf $SECTION_SUCCESS_FG)\]"
    SPE_BG="\[$(tput setab $SECTION_ERROR_BG)\]"
    SPE_FG="\[$(tput setaf $SECTION_GIT_BG)\]"
    SPE_TX="\[$(tput setaf $SECTION_ERROR_FG)\]"

    SPD_FG="\[$(tput setaf $SECTION_PATH_BG)\]"
    SQS_FG="\[$(tput setaf $SECTION_SUCCESS_BG)\]"
    SQE_FG="\[$(tput setaf $SECTION_ERROR_BG)\]"

    ps1() {
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

        # Check the exit code of the previous command and display different
        # colors in the prompt accordingly.
        if [ $? -eq 0 ]; then
            local PS_BG="$SPS_BG"
            local PS_FG="$SPS_FG"
            local PS_TX="$SPS_TX"
            local EXIT_FG="$SQS_FG"
        else
            local PS_BG="$SPE_BG"
            local PS_FG="$SPE_FG"
            local PS_TX="$SPE_TX"
            local EXIT_FG="$SQE_FG"
        fi

        local GIT_INFO=$(__git_info)

        PS1="$SH_BG$SH_TX \u@\h $RESET"
        PS1+="$SP_BG$SP_FG$RESET$SP_BG$SP_TX $(__shorten_pwd) $RESET"

        if [ "$GIT_INFO" != "" ]; then
            PS1+="$SG_BG$SG_FG$RESET$SG_BG$SG_TX$(__git_info)$RESET"
            PS1+="$PS_BG$PS_FG$RESET"
        else
            PS1+="$PS_BG$SPD_FG$RESET"
        fi
        PS1+="$PS_BG$PS_TX $PS_SYMBOL $RESET$EXIT_FG$RESET "
    }

    PROMPT_COMMAND=ps1
}

__powerline
unset __powerline
