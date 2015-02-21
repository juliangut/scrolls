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
* Theme - Brogrammer

### Other interesting packages

* Alignment
* DocBlockr
* MarkdownEditing
* Markdown Preview


Example Preferences
-------------------

Alonside this document can be found ```Preferences.sublime-settings``` file
with custom preferences
