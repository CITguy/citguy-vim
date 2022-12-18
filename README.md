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
* editorconfig/editorconfig-vim
* scrooloose/nerdtree
* hail2u/vim-css3-syntax
* pangloss/vim-javascript
* posva/vim-vue

### Consider
* mattn/emmet-vim
* joukevandermaas/vim-ember-hbs
* tpope/vim-fugitive
* lepture/vim-jinja or glench/vim-jinja2-syntax
* MaxMEllon/vim-jsx-pretty
* groenewege/vim-less
* jxnblk/vim-mdx-js
* pbrisbin/vim-mkdir
* Vimjas/vim-python-pep8-indent
