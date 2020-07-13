# nvim-config

Environment: Ubuntu 18.04

## Prerequisite

1. fzf
2. ripgrep
3. silversearcher-ag
4. nodejs & npm
5. ctags

## How to use

1. Install neovim
2. Copy this repo to `~/.config/nvim`
```bash
mv ~/.config/nvim ~/.config/nvim-backup
git clone https://github.com/latavin243/nvim-config.git ~/.config/nvim
```
3. Install plugins
```bash
vim +PlugInstall +qa
```
4. Enjoy

## FAQ

1. No python provider found
```
pip install pynvim
```

2. No fanyi command
```
npm install fanyi -g
```
