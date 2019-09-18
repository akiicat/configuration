
## Clone

```shell
git clone https://github.com/akiicat/configuration.git
cd configuration
```

## Install vim

- install [vim](https://github.com/vim/vim)
- install [vim-plug](https://github.com/junegunn/vim-plug)

### Mac

```shell
brew install vim

# Install Vim Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Raspberry Pi 3 B+

```shell
git clone https://github.com/vim/vim.git vim-master
cd vim-master/src
./configure
make -j 4
sudo make install

# Install Vim Plug
sudo apt install -y curl npm
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Install Vim Plug

```shell
cp ./bash_profile ~/.bash_profile
cp ./gitconfig ~/.gitconfig
cp ./vimrc ~/.vimrc
vim +PlugInstall +qall
```

