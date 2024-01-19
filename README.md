### Install neovim and plugin's requirement

Neovim build [instructions](https://github.com/neovim/neovim/blob/master/BUILD.md)

```
sudo apt install fzf ripgrep xclip zenity
sudo npm install --global yarn
sudo npm install --global live-server
```

Install [nodejs](https://github.com/nodesource/distributions#debian-and-ubuntu-based-distributions) on debian

> if using wayland, use **wl-clipboard** instead of **xclip** for clipboard 

### Install vimplug: 

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

```
:PlugInstall
```

### Install coc plugin:

```
cd ~/.local/share/nvim/plugged/coc.nvim
yarn install
yarn build
```

Install language server:

```
:CocInstall coc-tsserver coc-json coc-svelte
:CocInstall @yaegassy/coc-intelephense
:CocInstall @yaegassy/coc-laravel coc-blade
:CocInstall @yaegassy/coc-tailwindcss3
:CocInstall coc-html coc-css coc-emmet
:CocInstall coc-clangd
:CocCommand clangd.install (or install from: https://github.com/clangd/clangd/releases/tag/17.0.3)
<or install 'clangd' from your package manager>
```

More [coc-language-server](https://github.com/neoclide/coc.nvim/wiki/Language-servers)
