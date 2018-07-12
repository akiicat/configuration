
## clone

```shell
git clone https://gist.github.com/2e63be1ffe7b7f7cb758e6022cd32f3a.git ./profile
```

## Install

### vimrc

install vundle

```shell
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

```shell
cp ./profile/vimrc ~/.vimrc
vim +PluginInstall +qall
```

### bash_profile

```shell
cp ./profile/bash_profile ~/.bash_profile
```

### gitconfig

```shell
cp ./profile/gitconfig ~/.gitconfig
```

## 取代文字
```shell
grep -rlI matchstring somedir/ | xargs sed -i "" 's/string1/string2/g'
```

## 不用互動式來新增使用者
```shell
adduser --disabled-password --gecos "" username
```

