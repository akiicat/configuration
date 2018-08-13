
## clone

```shell
git clone https://gist.github.com/2e63be1ffe7b7f7cb758e6022cd32f3a.git ./profile
```
## update vim

### mac

```shell
brew install vim --with-override-system-vi
```

## Install

### vimrc

install [vim-plug](https://github.com/junegunn/vim-plug)

```shell
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```shell
cp ./profile/vimrc ~/.vimrc
vim +PlugInstall +qall
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
