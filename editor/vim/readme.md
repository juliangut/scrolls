# VIM

## Configuration

Copy accompanying `.vimrc` file into your home folder

## Color schema

For a color schema to be available it should be installed in `~/.vim/colors`.

You can find some fine color schemes beside this file

## Plugins

Review plugins at [VimAwesome](https://vimawesome.com)

### Plug

[vim-plug](https://github.com/junegunn/vim-plug) auto-loads installed plugins located at `~/.vim/bundle`

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Add this lines to your `.vimrc` file listing the plugins you want to use

```
" Autoload plugins located at ~/.vim/bundle
call plug#begin('~/.vim/bundle')

" List of plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'editorconfig/editorconfig-vim'
Plug 'evidens/vim-twig'

call plug#end()
```

In vim install plugins

```
:PlugInstall
```

### Airline Status bar

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
let g:airline_theme='kolor'
```

The list of available airline themes can be found at `~/.vim/bundle/vim-airline-themes/autoload/airline/themes`

### Indent Guides

Add to `.vimrc` file

```
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#1c1c1c ctermbg=234
```

## Base .vimrc

Find a .vimrc file with same defaults and Airline configuration alongside this document
