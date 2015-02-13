Git Configuration
=================

Basic
-----

### Identity set

Set your name and email to be identified

> $ git config --global user.name name

> $ git config --global user.email email@example.com

### Colors
> $ git config --global color.ui true


Important
----------

### Line endings

Always store line endings as LF on repository

#### Windows
Transforms CRLF to LF on push and viceversa on pull

> $ git config --global core.autocrlf true

#### Unix like
Transforms CRLF to LF on pull but not viceversa

> $ git config --global core.autocrlf input

### Pushing

* nothing  - do not push anything.
* matching - push all branches having the same name in both ends.
* upstream - push the current branch to its upstream branch.
* simple   - like upstream, but refuses to push if the upstream branch’s name is different from the local one.
* current  - push the current branch to a branch of the same name.

> $ git config --global push.default current


Additional
----------

### Command spelling

In case you mistype a command and there is only one option that command will be triggered automatically

> $ git config --global help.autocorrect 1

### Global .gitignore

Defines a global ```.gitignore``` file independent of the project

> $ git config --global core.excludesfile ~/.gitignore


Alias
-----

### Status

> $ git config --global alias.st status

> $ git config --global alias.lg 'log --name-only'

### Branches

> $ git config --global alias.br brach

> $ git config --global alias.go checkout

> $ git config --global alias.co checkout

> $ git config --global alias.pulla 'pull --all'

> $ git config --global alias.pusha 'push --all'

### Staging

> $ git config --global alias.stage add

> $ git config --global alias.unstage 'reset HEAD'

> $ git config --global alias.discard 'checkout --'

### Commiting

> $ git config --global alias.ci commit

> $ git config --global alias.amend 'commit --amend'

### Diffs

> $ git config --global alias.df diff

### Tags

> $ git config --global alias.pullt 'fetch --tags'

> $ git config --global alias.pusht 'push --tags'

### Stashing

> $ git config --global alias.unstash 'stash apply'

### Ignore

> $ git config --global alias.ignore '!([ ! -e .gitignore ] && touch .gitignore) | echo $1 >> .gitignore'

### GUI

Graphical tools and views

> $ git config --global alias.graph "log --graph --all --format=format:'%C(bold blue)%h%Creset%C(bold yellow) %d%Creset - %C(cyan)%aD%Creset %Cgreen(%ar)%Creset - %C(magenta)%an%Creset - %s' --abbrev-commit"

> $ git config --global alias.visual '!gitg --all &'

> $ git config --global alias.conflict '!gitg --left-right HEAD...MERGE_HEAD'


Companion .gitignore
--------------------

Alongside this document goes a .gitignore file containing most usefull 'ignores'


GIT information on bash
-----------------------

> $ curl https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh

add this lines to ~/.bashrc

```bash
function shorten_pwd()
{
    LENGTH="40"
    PART1="10"
    PART2="27"

    DIR=`echo "${PWD}" | sed "s/\\/home\\/$USER/~/" | sed "s/\\/Users\\/$USER/~/"`

    if [ ${#DIR} -gt $(($LENGTH)) ]; then
        echo "${DIR:0:$(($PART1))}...${DIR:$((${#DIR}-$PART2)):$PART2}"
    else
        echo "$DIR"
    fi
}

YELLOW="\[\033[1;33m\]"
CYAN="\[\033[0;36m\]"
WHITE="\[\033[0;37m\]"

source ~/.git-prompt.sh
PS1="\[$WHITE\][\[$CYAN\]\u@\h \W\[$YELLOW\]\$(__git_ps1)\[$WHITE\]]\$  "
/*PS1="\[$WHITE\][\[$CYAN\]\u@\h $(shorten_pwd)\[$YELLOW\]\$(__git_ps1)\[$NONE\]]\$  "*/
export PS1
```

or make your own combinations for prompt. \$(__git_ps1) is what shows git branch.

### Modifiers

#### Untracked files

A symbol will be shown following branch name to indicate untracked files: [%]

Add the following to ~/.bashrc

```bash
GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUNTRACKEDFILES
```

#### Stage state

A symbol will be shown following branch name to indicate file changes: [*] for unstaged and [+] for staged

Add the following to ~/.bashrc

```bash
GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWDIRTYSTATE
```

#### Branch status

A symbol will be shown following branch name to show comparison with HEAD: [=] no difference, [<] you are behind,
[>] you are ahead, and [<>] you have diverged

Add the following to ~/.bashrc

```bash
GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWUPSTREAM
```
