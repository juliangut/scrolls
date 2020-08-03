# Tmux

## Remember bash history

Add this lines to your `~/.bashrc` file

```
# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
```

## Plugin Manager 

Add Tmux Plugin Manager

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Add plugins

```
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-continuum
```

## Configuration

In `~/.tmux.conf` file. Find an example tmux configuration alongside this document

Modifications won't take effect until tmux is reloaded

### Plugins

Enable plugins at the end of the configuration file

```
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'

run '~/.tmux/plugins/tpm/tpm'
```

#### Activate restoring pane contents

```
set -g @resurrect-capture-pane-contents 'on'
```

Install plugins

```
c-I
```

Update plugins

```
c-U
```

### Coloring

```
set -g default-terminal 'screen-256color'
```

### Window/Pane indexing

```
set -g base-index 1
set -g pane-base-index 1
set -g renumber-windows on
```

### UTF8
```
set -g utf8 on
set -g status-utf8 on
```

### History

```
set -g history-limit 50000
```

### VIM mode switching

Addresses http://superuser.com/a/252717/65504

```
set -s escape-time 0
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
unbind v
bind v split-window -h
unbind '"'
unbind h
bind h split-window -v
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

#### Toggle

Copy .tmux-mouse-toggle.sh file to your home 

```
bind m run "sh ~/.tmux-mouse-toggle.sh"
```

### Style

#### Pane highlighting

```
set -g pane-border-fg colour240
set -g pane-active-border-fg colour250
```

#### Status bar

```
set -g status on
set -g status-interval 5
set -g status-bg colour234
set -g status-fg colour250
set -g status-left-length 30
set -g status-left " #S "
set -g window-status-format "#[fg=colour240]#I | #W "
set -g window-status-current-format "#[fg=colour250,bg=colour240] #I | #[fg=colour250,bold]#W "
set -g status-right-length 150
set -g status-right "#{?client_prefix,#[fg=colour250]<Prefix>#[fg=colour240] ,}#H %Y-%m-%d %H:%M"
```

## Sessions

#### List sessions

```
tmux ls
#or
c-a s
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
shift-<arrow-key>

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
c-a v

# vertically
c-a "
# or
c-a h
```

#### Arrange panes

```
# Repeatedly
c-a <space>
```

#### Activate panes

```
# move between panes
alt-<arrow-key>
# or
c-a <arrow-key>
```

#### Move panes

```
# swap with previous
c-a {
#or
c-a <

# swap with next
c-a }
#or
c-a >
```

#### Full-screen a pane
 
```
c-a z
```
 
Same combination to exit full-screen

##### Expand a pane

```
# expand
c-a +

# contract
c-a -
```

#### Resize panes

```
c-a c-<arrow-key>
# or
c-a alt-<arrow-key>
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
