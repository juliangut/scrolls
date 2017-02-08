# VIM

## Configuration

Copy accompanying `.vimrc` file into your home folder

## Color schema

For a color schema to be available it should be installed in `~/.vim/colors`.

You can find some fine color schemes beside this file

## Plugins

### Pathogen

[Pathogen](https://github.com/tpope/vim-pathogen) auto-loads installed plugins located at `~/.vim/bundle`

```
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

Add this lines to your `.vimrc` file

```
" Autoload plugins located at ~/.vim/bundle
execute pathogen#infect()
```

### Airline Status bar

Add an informational and good looking status bar

```
git clone git@github.com:vim-airline/vim-airline.git ~/.vim/bundle/vim-airline
git clone git@github.com:vim-airline/vim-airline-themes.git ~/.vim/bundle/vim-airline-themes
```

Download a font from [Powerline patched fonts](https://github.com/powerline/fonts), `Source Code Pro` for example, and install globally

```
wget https://github.com/powerline/fonts/raw/master/SourceCodePro/Sauce%20Code%20Powerline%20Regular.otf
mv Sauce\ Code\ Powerline\ Regular.otf ~/.fonts/
fc-cache -vf ~/.fonts/
```

Finally add this lines to `.vimrc` file

```
" Airline integration
set guifont=Source\ Code\ Pro
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
```

The list of available airline themes can be found at `~/.vim/bundle/vim-airline-themes/autoload/airline/themes`

### Better whitespace

Highlight tabs and trailing spaces

```
git clone git@github.com:ntpeters/vim-better-whitespace.git ~/.vim/bundle/vim-better-whitespace
```

### Git integration

Launch git commands from VIM and integrate into airline

```
git clone git@github.com:tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
git clone git@github.com:airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter
```

### CtrlP

Easy and quick path finder by Ctrl+P

```
git clone git@github.com:ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp
```

### Twig templates syntax coloring

By default VIM does not support twig syntax coloring but [vim-twig](https://github.com/evidens/vim-twig) plugin can be installed for this purpose

```
git clone git@github.com:evidens/vim-twig.git ~/.vim/bundle/vim-twig
```

## Base .vimrc

Find a .vimrc file with same defaults and Airline configuration alongside this document
