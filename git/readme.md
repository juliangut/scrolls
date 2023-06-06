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
git config --global alias.st 'status -s'
git config --global alias.lg 'log --name-only'
git config --global alias.lgr "log --graph --format=format:'%C(bold blue)%h%Creset%C(bold yellow) %d%Creset - %C(cyan)%aD%Creset %Cgreen(%ar)%Creset - %C(magenta)%an%Creset - %s' --abbrev-commit"
git config --global alias.history 'log -p'
```

### Branches

```bash
git config --global alias.br 'branch -v'
git config --global alias.brs 'branch -va'
git config --global alias.go checkout
git config --global alias.co "!f() { git checkout -b \"$1\" 2> /dev/null || git checkout \"$1\"; }; f"
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
git config --global alias.untrack 'rm --cached'
```

### Diffs

```bash
git config --global alias.df 'diff --abbrev'
git config --global alias.dfw 'diff --abbrev --color-words'
```

### Tags

```bash
git config --global alias.tags 'tag -l --sort=-v:refname --column'
git config --global alias.pullt 'fetch --tags'
git config --global alias.pusht 'push --tags'
git config --global alias.retag '!r() { git tag -d $1 && git push origin :refs/tags/$1 && git tag $1; }; r'
```

### Stashing

```bash
git config --global alias.unstash 'stash pop'
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
git config --global alias.visual '!gitg --all &'
git config --global alias.conflict '!gitg --left-right HEAD...MERGE_HEAD'
```

### Diffs

Improve diffs

```bash
git config --global diff.algorithm patience
```

Detect copies as well as renames

```bash
git config --global diff.renames copies
```

#### Images

In order for git to be able to perform diffing on images

```bash
git config --global diff.exif.textconv exiftool
```

Then you can add `diff=exif` to `.gitattributes` file

*`exiftool` is needed for this*

```
dnf install exiftool
```

### GIT bash integration

#### Auto completion

In case you don't have bash git commands completion already you can add it with `git-completion.sh`

The script can be found alongside this document or can be downloaded from:

```bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.sh
```

Put the file in your home directory and add the following lines to ~/.bashrc

```bash
if [ -f ~/.git-completion.sh ]; then
    source ~/.git-completion.sh
fi
```

#### Prompt information

If you want to show current git branch on bash prompt you can use `bash-powerline.sh`

The script (a modification over [riobard/bash-powerline](https://github.com/riobard/bash-powerline)) can be found alongside this document

```bash
curl https://raw.githubusercontent.com/juliangut/scrolls/master/git/.bash-powerline.sh -o ~/.bash-powerline.sh
```

Put the file in your home directory and add the following lines at the end of `~/.bashrc` file

```bash
if [ -f ~/.bash-powerline.sh ]; then
    source ~/.bash-powerline.sh
fi
```

In order to see the new bash prompt in all its glory download a font from [Powerline patched fonts](https://github.com/powerline/fonts), `Source Code Pro` for example, and use it in your terminal

## Rewrite commit history

In case of committing with a wrong user configuration, maybe not from your own computer, there is a last resort to rewrite committer information.

Download and update `git-rewrite-commiter.sh` with the correct user information on a fresh copy of the repository.

```bash
curl https://raw.githubusercontent.com/juliangut/scrolls/master/git/git-rewrite-committer.sh -o ~/git-rewrite-commmitter.sh
vim ./git-rewrite-commmitter.sh
```

Apply commit rewrite

```bash
chmod +x ./git-rewrite-commmitter.sh
bash ./git-rewrite-commmitter.sh
rm ./git-rewrite-commmitter.sh
```

Push commit again

```bash
git push --force --tags origin 'refs/heads/*'
```

And delete the fresh copy of the repository as it's not needed any more
