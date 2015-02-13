Sublime Text 3
==============

Package Control
---------------

### Install

Open Text Console on Sublime Text by typing ```ctrl+` ```

In Text console type:

```bash
import urllib.request,os,hashlib; h = '7183a2d3e96f11eeadd761d777e62404' + 'e330c659d4bb41d3bdf022e94cab3cd0'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://sublime.wbond.net/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```
(As shown on https://sublime.wbond.net/installation)

Restart Sublime Text

### Usage

On Sublime Text type ```Ctrl + Shift + P``` to open the Command Pallete

#### Install packages

Type Install, select ```Package Control: Install Package``` and browse for the package to install

#### Remove packages

Type Remove, select ```Package Control: Remove Package``` and browse for the package to remove


Go to definition
----------------

Add Go to definition on ```Ctrl + Click```

> $ vim ~/.gitconfig/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-mousemap

Add the following and save

```json
[
    {
        "button": "button1",
        "count": 1,
        "modifiers": ["ctrl"],
        "press_command": "drag_select",
        "command": "goto_definition"
    }
]
```


Packages
--------

### Must-have

* SublimeCodeIntel
* SublimeLinter
* SublimeGit
* EditorConfig

### GIT
* Git Config
* GitGutter

### CSS

* SCSS

### PHP

* Phpcs

### Interface

* BracketHighlighter
* SideBarEnhacements
* Monokai Extended
* Theme - Soda

### Other interesting packages

* Alignment
* DocBlockr
* MarkdownEditing
* Markdown Preview


Preferences
-----------

Open Preferences > Settings - User on Sublime Text toolbar

### Files

* "default_line_ending": "unix" //Sets default files line ending to LF
* "detect_indentation": false //Detects indentation type on file
* "translate_tabs_to_spaces": true //Combined with previous forces spaces instead of tabs
* "ensure_newline_at_eof_on_save": true //Checks and includes LF at the end of file
* "trim_automatic_white_space": true //Removes whitespaces automatically in some situations
* "trim_trailing_white_space_on_save": true //Removes trailing whitespaces on file saving

### Interface

* "draw_white_space": "all" //Draws all whitespace characters
* "highlight_line": true //Highlights current caret line
* "highlight_modified_tabs": true //Highlights tabs corresponding to modified files
* "scroll_past_end": false //Prevents scrolling passed last line
* "indent_guide_options": ["draw_active"] //Marks current active indented block
* "rulers":[80, 120] //Shows vertical ruler guides
* "show_encoding": true //Shows file encoding on status bar
* "show_line_endings": true //Shows file line endings on status bar
* "word_wrap": true //Forces word wrap on long lines
* "wrap_width": 120 //Sets hard limit for word wrap

### Theme

* "color_scheme": "Packages/Monokai Extended/Monokai Extended.tmTheme" //Sets color schema for editor
* "theme": "Soda Dark 3.sublime-theme" //Sets sublime text selected theme
