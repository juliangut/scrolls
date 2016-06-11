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

* [All Autocomplete](https://github.com/alienhard/SublimeAllAutocomplete) Extends the default autocomplete to find matches in all open files
* [EditorConfig](http://editorconfig.org/) Helps developers define and maintain consistent coding styles between different editors and IDEs
* [SublimeCodeIntel](https://sublimecodeintel.github.io/SublimeCodeIntel/) A full-featured code intelligence and smart autocomplete engine for Sublime Text
* [SublimeLinter](http://www.sublimelinter.com/) A framework for linting code

### GIT

* [Git Config](https://github.com/robballou/gitconfig-sublimetext) Simple settings for .gitconfig and .gitignore files
* [GitGutter](https://github.com/jisaacks/GitGutter) Shows an icon in the gutter area indicating whether a line has been inserted, modified or deleted
* [SublimeGit](https://sublimegit.net) Full-featured Git integration

### CSS

* [Sublime-CSS3](https://github.com/i-akhmadullin/Sublime-CSS3) CSS3 syntax highlight
* [SCSS](https://github.com/MarioRicalde/SCSS.tmbundle/tree/SublimeText2) Sass & SCSS syntax package

### PHP

* [PHP Companion](https://github.com/erichard/SublimePHPCompanion) Provides cool stuff for PHP 5.3+ coding session
* [PHPIntel](https://github.com/jotson/SublimePHPIntel) PHP functions and objects auto-completion
* [Phpcs](http://benmatselby.github.io/sublime-phpcs/) PHP CodeSniffer, PHP Coding Standard Fixer, Linter and Mess Detector Support

### JSON

* [JSONLint](https://bitbucket.org/hmml/jsonlint) Finds issues in JSON files
* [JSON Reindent](https://github.com/ThomasKliszowski/json_reindent) Reindent JSON file or selection

### Markdown

* [Markdown Extended](https://github.com/jonschlinkert/sublime-markdown-extended) Markdown syntax support
* [Markdown Preview](https://github.com/revolunet/sublimetext-markdown-preview) Preview and build your markdown files quickly in your web browser

### Interface

* [BracketHighlighter](https://github.com/facelessuser/BracketHighlighter) Matches a variety of brackets, [], {}, () ...
* [SideBarEnhancements](https://github.com/titoBouzout/SideBarEnhancements) Provides enhancements to the operations on Sidebar of Files and Folders

### Syntax

* [Monokai Extended](https://github.com/jonschlinkert/sublime-monokai-extended) Extends Monokai from Soda with additional syntax highlighting
* [ApacheConf.tmLanguage](https://github.com/colinta/ApacheConf.tmLanguage) Apache Conf Syntax Highlighting
* [nginx](https://github.com/brandonwamboldt/sublime-nginx) Nginx Syntax Highlighting

### Themes

* [Material-theme](https://github.com/equinusocio/material-theme) Dark interface and icons change ("theme": "Material-Theme-Darker.sublime-theme")
* [Predawn](https://github.com/jamiewilson/predawn/) A dark interface and syntax theme ("theme": "predawn.sublime-theme")
* [Theme - Brogrammer](https://github.com/kenwheeler/brogrammer-theme) Brogrammer is a flat sexy theme ("theme": "Brogrammer.sublime-theme")

### Other

* [Alignment](http://wbond.net/sublime_packages/alignment) Dead-simple alignment of multi-line selections and multiple selections
* [DocBlockr](https://github.com/spadgos/sublime-jsdocs) Makes writing documentation a breeze

## Example Preferences

Alonside this document can be found `Preferences.sublime-settings` file
with custom preferences
