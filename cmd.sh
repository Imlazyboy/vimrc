# 安装ag
sudo  apt-get install silversearcher-ag
# 安装 powerline字体库
sudo apt-get install fonts-powerline

# 安装`rust and ripgrep`
# 安装`rust`
curl https://sh.rustup.rs -sSf | sh
# 使用`cargo`安装`ripgrep`
cargo install ripgrep

# 安装" 自动补全插件YCM
# Plugin 'Valloric/YouCompleteMe'
# 建议先直接下载在~/.vim/bundle/下。

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive

#这样下载完成后，再添加PluginInstall 'Valloric/YouCompleteMe'，
# 保存后，再执行命令:PluginInstall就可以瞬间完成了。
cd ~/.vim/bundle/YouCompleteMe
./install.py 
# 安装全部需要参数`-all`
./install.py --all


## 安装 exuberant-ctags
sudo apt-get install exuberant-ctags

# 安装vim8
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim

#Uninstall Vim 8.0:
#To uninstall Vim 8.0 and downgrade it to the stock version in Ubuntu repository, run the command below to purge the PPA:

sudo apt install ppa-purge && sudo ppa-purge ppa:jonathonf/vim

