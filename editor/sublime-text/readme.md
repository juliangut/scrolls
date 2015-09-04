# Sublime Text 3

## Package Control

### Install

Open Text Console on Sublime Text by typing ```ctrl+` ```

In Text console type:

```
import urllib.request,os,hashlib; h = 'eb2297e1a458f27d836c04bb0cbaf282' + 'd0e7a3098092775ccb37ca9d6b2e4b7d'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```

(As shown on [https://packagecontrol.io/installation](https://packagecontrol.io/installation))

Restart Sublime Text

### Usage

On Sublime Text type `Ctrl + Shift + P` to open the Command Pallete

#### Install packages

Type Install, select `Package Control: Install Package` and browse for the package to install

#### Remove packages

Type Remove, select `Package Control: Remove Package` and browse for the package to remove

## Go to definition

Add Go to definition on `Ctrl + Click`

```
vim ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-mousemap
```

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

## Packages

### General

* [SublimeCodeIntel](https://sublimecodeintel.github.io/SublimeCodeIntel/)
* [SublimeLinter](http://www.sublimelinter.com/)
* [SublimeGit](https://sublimegit.net/)
* [EditorConfig](http://editorconfig.org/)
* [AllAutocomplete](https://github.com/alienhard/SublimeAllAutocomplete)

### GIT

* [Git Config](https://github.com/robballou/gitconfig-sublimetext)
* [GitGutter](http://www.jisaacks.com/gitgutter)

### CSS

* [Sublime-CSS3](https://github.com/i-akhmadullin/Sublime-CSS3)
* [SCSS](https://github.com/MarioRicalde/SCSS.tmbundle/tree/SublimeText2)

### PHP

* [PHP Companion](https://github.com/erichard/SublimePHPCompanion)
* [Phpcs](http://benmatselby.github.io/sublime-phpcs/)

### JSON

* [JSONLint](https://bitbucket.org/hmml/jsonlint)
* [JSON Reindent](https://github.com/ThomasKliszowski/json_reindent)

### Apache

* [ApacheConf.tmLanguage](https://github.com/colinta/ApacheConf.tmLanguage)

### Interface

* [BracketHighlighter](https://github.com/facelessuser/BracketHighlighter)
* [SideBarEnhancements](https://github.com/titoBouzout/SideBarEnhancements)
* [Monokai Extended](https://github.com/jonschlinkert/sublime-monokai-extended)
* [Predawn](https://github.com/jamiewilson/predawn/) ("theme": "predawn.sublime-theme")
* [Theme - Brogrammer](https://github.com/kenwheeler/brogrammer-theme) ("theme": "Brogrammer.sublime-theme")

### Other

* [Alignment](http://wbond.net/sublime_packages/alignment)
* [DocBlockr](https://github.com/spadgos/sublime-jsdocs)
* [Markdown Extended](https://github.com/jonschlinkert/sublime-markdown-extended)
* [Markdown Preview](https://github.com/revolunet/sublimetext-markdown-preview)

## Font

Adobe [Source Code Pro](https://github.com/adobe-fonts/source-code-pro) font is really nice for coding.

## Example Preferences

Alonside this document can be found `Preferences.sublime-settings` file
with custom preferences
