# Git Configuration

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

#### Branches
```bash
git config --global color.branches.current 'yellow reverse'
git config --global color.branches.local yellow
git config --global color.branches.remote green
```

#### Diff
```bash
git config --global color.diff.meta 'yellow bold'
git config --global color.diff.frag 'magenta bold'
git config --global color.diff.old red
git config --global color.diff.new green
git config --global color.diff.whitespace 'white reverse'
```

#### Status
```bash
git config --global color.status.added 'green bold'
git config --global color.status.updated green
git config --global color.status.changed yellow
git config --global color.status.untracked magenta
git config --global color.status.nobranch red
```

*Mind this color schemes are for dark themed consoles*

## Important

### Line endings

Always store line endings as `lf` (\n) on repository!

#### Windows

Transforms `crlf` (\r\n) to`lf` (\n) on push and viceversa on pull

```bash
git config --global core.autocrlf true
```

#### Unix

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

### Templates

Apply files globally

```bash
git config --global core.excludesfile ~/.gitconfig
git config --global core.attributesfile ~/.gitattributes
```

Template `.gitignore` and `.gitattributes` files can be found aside this document

### Command spelling

In case you misstype a command and there is only one option that command will be triggered automatically

```bash
git config --global help.autocorrect 1
```

## Alias

### Initializing/cloning

```bash
git config --global alias.clone 'clone --recursive'
```

### Status

```bash
git config --global alias.st status
git config --global alias.lg 'log --name-only'
git config --global alias.history 'log -p'
```

### Branches

```bash
git config --global alias.br brach
git config --global alias.brs 'branch -a'
git config --global alias.go checkout
git config --global alias.co checkout
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
git config --global alias.pulla 'pull --all'
git config --global alias.pusha 'push --all'
```

### Diffs

```bash
git config --global alias.df diff
```

### Tags

```bash
git config --global alias.tags 'tag -l'
git config --global alias.pullt 'fetch --tags'
git config --global alias.pusht 'push --tags'
```

### Stashing

```bash
git config --global alias.unstash 'stash apply'
```

### Others

```bash
git config --global alias.remotes 'remote -v'
git config --global alias.contributors 'shortlog --summary --numbered'
```

### Ignore

```bash
git config --global alias.ignore '!([ ! -e .gitignore ] && touch .gitignore) | echo $1 >> .gitignore'
```

### GUI

Graphical tools and views

```bash
git config --global alias.gr "log --graph --all --format=format:'%C(bold blue)%h%Creset%C(bold yellow) %d%Creset - %C(cyan)%aD%Creset %Cgreen(%ar)%Creset - %C(magenta)%an%Creset - %s' --abbrev-commit"
git config --global alias.visual '!gitg --all &'
git config --global alias.conflict '!gitg --left-right HEAD...MERGE_HEAD'
```

### Diffs

Detect copies as well as renames

```bash
git config --global diff.renames = copies
```

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

YELLOWBOLD="\[\033[1;33m\]"
CYAN="\[\033[0;36m\]"
WHITE="\[\033[0;37m\]"
NONE="\[\033[0m\]"

source ~/.git-prompt.sh
PS1="[$CYAN\u@\h \W$YELLOWBOLD\$(__git_ps1)$NONE]\$  "
/*PS1="[$CYAN\u@\h \$(__shorten_pwd)$YELLOWBOLD\$(__git_ps1)$NONE]\$  "*/
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
