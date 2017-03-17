# Tmux

## Configuration

In `~/.tmux.conf` file. Find an example tmux configuration alongside this document

Modifications won't take effect until tmux is reloaded

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
c-b $
```

#### Attach to session

```
tnux a -t <session-name>
```

#### Detach from session

```
c-b d
```

#### Kill session

```
tmux kill-session -t <session-name>
```

## Windows

Inside sessions

#### List windows

```
c-b w
```

#### Create new window

```
c-b c
```

#### Rename window

```
c-b ,
```

#### Kill current window

```
c-b &
```

#### Move between windows

```
# next window
c-b n

# previous window
c-b p

# specific window
c-b [0-9]
```

## Panes

Inside windows

#### Split

```
# horizontally
c-b %
# or
c-b |

# vertically
c-b "
# or
c-b -
```

#### Arrange panes

```
# Repeatedly
c-b <space>
```

#### Activate panes

```
# move between panes
m-<arrow-key>
# or
c-b <arrow-key>

# move to previous active pane
c-b ;

# swap with next pane
c-b }

# swap with previous pane
c-b {
```

#### Full-screen a pane
 
 ```
 c-b z
 ```
 
 Same combination to exit full-screen

#### Resize panes

```
c-b c-<arrow-key>
# or
c-b m-<arrow-key>
```

#### Scroll in a pane

```
c-b [
# <esc> to go back to insert mode
```

#### Close pane

```
c-d
# or
c-b x
```
