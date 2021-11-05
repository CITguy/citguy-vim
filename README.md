## Installing

```sh
$ git clone https://github.com/CITguy/citguy-vim.git --recurse-submodules
```
_(`--recurse-submodules` will initialize the working directories of configured submodules)_

If you've already cloned the project, but forgot to use `--recurse-submodules`, run the following:

```sh
$ git submodule update --recursive --init
```

## Updating Included Plugins
```sh
$ git submodule update --recursive
```



## Plugins

### Installed
* editorconfig-vim (editorconfig/editorconfig-vim)
* nerdtree (scrooloose/nerdtree)
* vim-css3-syntax (hail2u/vim-css3-syntax)
* vim-javascript (pangloss/vim-javascript)
* vim-vue (posva/vim-vue)

### Consider
* emmet-vim (mattn/emmet-vim)
* vim-ember-hbs (joukevandermaas/vim-ember-hbs)
* vim-fugitive (tpope/vim-fugitive)
* vim-jinja (lepture/vim-jinja) or vim-jinja2-syntax (glench/vim-jinja2-syntax)
* vim-jsx-pretty (MaxMEllon/vim-jsx-pretty)
* vim-less (groenewege/vim-less)
* vim-mdx-js (jxnblk/vim-mdx-js)
* vim-mkdir (pbrisbin/vim-mkdir)
