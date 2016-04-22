# VIM

## Configuration

Copy accompanying `.vimrc` file into your home folder

## Color schema

For a color schema to be available it should be installed in `~/.vim/colors`.

You can find some fine color schemes beside this file

## Pathogen

[Pathogen](https://github.com/tpope/vim-pathogen) auto-loads installed plugins located at `~/.vim/bundle`

### Install

```
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

Add this lines to your `.vimrc` file

```
" Autoload plugins located at ~/.vim/bundle
execute pathogen#infect()
```

## Plugins

### Twig templates syntax coloring

By default VIM does not support twig syntax coloring but [vim-twig](https://github.com/evidens/vim-twig) plugin can be installed for this purpose

```
cd ~/.vim/bundle
git clone git@github.com:evidens/vim-twig.git
```
