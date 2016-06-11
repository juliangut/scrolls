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

Add a really good looking status bar

```
git clone git@github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
```

Download a font from [Powerline patched fonst](https://github.com/powerline/fonts), `Source Code Pro` for example, and install globally

```
mv 'Sauce Code Powerline Regular.otf' ~/.fonts/
fc-cache -vf ~/.fonts/
```

Finally add this lines to `.vimrc`file

```
" Airline integration
set guifont=Source\ Code\ Pro
let g:airline_powerline_fonts = 1
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

Find a .vimrc file with same defaults and Airline configuration alonside this document
