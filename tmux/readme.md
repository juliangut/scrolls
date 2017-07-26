# Tmux

## Remember bash history

Add this lines to your `~/.bashrc` file

```
# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
```

## Configuration

In `~/.tmux.conf` file. Find an example tmux configuration alongside this document

Modifications won't take effect until tmux is reloaded

### Indexing

```
set -g base-index 1
set -g pane-base-index 1
```

### Mappings

#### Configuration reload

```
bind r source-file ~/.tmux.conf \; display 'Config: RELOAD'
```

#### Prefix

```
unbind c-a
set -g prefix C-a
bind-key C-a send-prefix
```

#### Pane splitting

```
unbind %
unbind '"'
bind | split-window -h
bind - split-window -v
```

#### Pane switching

```
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D
```

#### Window switching

```
bind -n S-Left previous-window
bind -n S-Right next-window
bind-key L last-window
```

#### Zooming

```
unbind +
bind + new-window -d -n tmp \; swap-pane -s tmp.1 \; select-window -t tmp \; set mouse off
unbind -
bind - last-window \; swap-pane -s tmp.1 \; kill-window -t tmp \; set mouse on
```

### Mouse

#### Enable

```
set -g mouse on
```

#### Mappings

```
bind m set -g mouse on \; display 'Mouse: ON'
bind M set -g mouse off \; display 'Mouse: OFF'
```

### Style

#### Pane highlighting

```
set -g pane-border-fg colour240
set -g pane-active-border-fg colour250
```

#### Status bar

```
set -g status-bg blue
set -g status-fg white
set -g status-left "#H [#S] at #W:#T"
```

## Sessions

#### List sessions

```
tmux ls
```

#### Start new session

```
tmux
tmux new -s <session-name>
```

If no session name provided automatic int-indexed name will be generated

#### Rename session

```
tmux rename-session -t <old-session-name> <new-session-name>
# or
c-a $
```

#### Attach to session

```
tnux a -t <session-name>
```

#### Detach from session

```
c-a d
```

#### Kill session

```
tmux kill-session -t <session-name>
```

## Windows

Inside sessions

#### List windows

```
c-a w
```

#### Create new window

```
c-a c
```

#### Rename window

```
c-a ,
```

#### Kill current window

```
c-a &
```

#### Move between windows

```
# move between windows
s-<arrow-key>

# move to last active window 
c-a l

# specific window
c-a [0-9]
```

## Panes

Inside windows

#### Split

```
# horizontally
c-a %
# or
c-a |

# vertically
c-a "
# or
c-a -
```

#### Arrange panes

```
# Repeatedly
c-a <space>
```

#### Activate panes

```
# move between panes
m-<arrow-key>
# or
c-a <arrow-key>
```

#### Full-screen a pane
 
```
c-a z
```
 
Same combination to exit full-screen

#### Resize panes

```
c-a c-<arrow-key>
# or
c-a m-<arrow-key>
```

#### Scroll in a pane

```
c-a [
# <esc> to go back to insert mode
```

#### Close pane

```
c-d
# or
c-a x
```
