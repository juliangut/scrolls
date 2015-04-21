# Git Configuration

### Global .gitconfig file

Locate .gitconfig file in `~/.gitconfig` to apply globally

#### Template .gitconfig

Alongside this document goes a `.gitconfig` file containing a template for global git configuration

## Basic

### Identity set

Set your name and email to be identified

```bash
git config --global user.name name
git config --global user.email email@example.com
```

### Colors
```bash
git config --global color.ui true
```

## Important

### Line endings

Always store line endings as `lf` (\n) on repository!

#### Windows

Transforms `crlf` (\r\n) to`lf` (\n) on push and viceversa on pull

```bash
git config --global core.autocrlf true
```

#### Unix like

Transforms `crlf` (\r\n) to `lf` (\n) on pull but not viceversa

```bash
git config --global core.autocrlf input
```

### Pushing

* `nothing`  - do not push anything.
* `matching` - push all branches having the same name in both ends.
* `upstream` - push the current branch to its upstream branch.
* `simple`   - like upstream, but refuses to push if the upstream branch’s name is different from the local one.
* `current`  - push the current branch to a branch of the same name.

```bash
git config --global push.default current
```

## Additional

### Command spelling

In case you misstype a command and there is only one option that command will be triggered automatically

```bash
git config --global help.autocorrect 1
```

### Global .gitignore

Defines a general `~/.gitignore` file applied globally

```bash
git config --global core.excludesfile ~/.gitignore
```

## Alias

### Status

```bash
git config --global alias.st status
git config --global alias.lg 'log --name-only'
git config --global alias.history 'log -p'
```

### Branches

```bash
git config --global alias.br brach
git config --global alias.go checkout
git config --global alias.co checkout
git config --global alias.pulla 'pull --all'
git config --global alias.pusha 'push --all'
```

### Staging

```bash
git config --global alias.stage add
git config --global alias.unstage 'reset HEAD'
git config --global alias.discard 'checkout --'
```

### Commiting

```bash
git config --global alias.ci commit
git config --global alias.amend 'commit --amend'
```

### Diffs

```bash
git config --global alias.df diff
```

### Tags

```bash
git config --global alias.pullt 'fetch --tags'
git config --global alias.pusht 'push --tags'
```

### Stashing

```bash
git config --global alias.unstash 'stash apply'
```

### Ignore

```bash
git config --global alias.ignore '!([ ! -e .gitignore ] && touch .gitignore) | echo $1 >> .gitignore'
```

### GUI

Graphical tools and views

```bash
git config --global alias.graph "log --graph --all --format=format:'%C(bold blue)%h%Creset%C(bold yellow) %d%Creset - %C(cyan)%aD%Creset %Cgreen(%ar)%Creset - %C(magenta)%an%Creset - %s' --abbrev-commit"
git config --global alias.visual '!gitg --all &'
git config --global alias.conflict '!gitg --left-right HEAD...MERGE_HEAD'
```

### Diffing

#### Images

In order for git to be able to perform diffing on images

```bash
git config --global diff.exif.textconv exiftool
```

Then you can add `diff=exif` to `.gitattributes` file

*`exiftool` is needed for this*

```
yum install exiftool
```

## Template .gitignore

Alongside this document goes a `.gitignore` file containing most usefull 'ignores'

## Template .gitattributes

Alongside this document goes a common base `.gitattributes` file

## GIT information on bash

git-prompt shell script can be found alonside this document or be downloaded from:

```bash
curl https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
```

add this lines to ~/.bashrc

```bash
function __shorten_pwd()
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
NONE="\[\033[0m\]"

source ~/.git-prompt.sh
PS1="[$CYAN\u@\h \W$YELLOW\$(__git_ps1)$NONE]\$  "
/*PS1="[$CYAN\u@\h \$(__shorten_pwd)$YELLOW\$(__git_ps1)$NONE]\$  "*/
export PS1
```

or make your own combination
* `\h` hostname up to the first `.`
* `\u` current user
* `\W` basename of current working directory, with `$HOME` abbreviated with a tilde
* `\$(__git_ps1)` displays current git branch
* `\$(__shorten_pwd)` shortens pwd (otherwise `\W`)

### Modifiers

#### Untracked files

A symbol will be shown following branch name to indicate untracked files: [%]

Add the following to `~/.bashrc`

```bash
GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUNTRACKEDFILES
```

#### Stage state

A symbol will be shown following branch name to indicate file changes: `*` for unstaged and `+` for staged

Add the following to `~/.bashrc`

```bash
GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWDIRTYSTATE
```

#### Branch status

A symbol will be shown following branch name to show comparison with HEAD: `=` no difference, `<` you are behind, `>` you are ahead, and `<>` you have diverged

Add the following to `~/.bashrc`

```bash
GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWUPSTREAM
```
