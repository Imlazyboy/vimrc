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

#选址一个支持`python2`,支持`clipboard`的安装包为默认安装包：
sudo update-alternatives --config vim

#我们一般选择`vim.gnome-py2`,它比较符号我们的要求。

#=====================================================================
#Selection    Path                    Priority   Status
#------------------------------------------------------------
#0            /usr/bin/vim.gnome       60        auto mode
#1            /usr/bin/vim.basic       30        manual mode
#2            /usr/bin/vim.gnome       60        manual mode
#*3            /usr/bin/vim.gnome-py2   59        manual mode

#Press <enter> to keep the current choice[*], or type selection number: 
#=====================================================================

#我的系统Ubuntu16.04,`vim-gnome-py2`安装不上，
#只安装上了`vim-gtk3`,我们可以安装`vim-gtk3-py2`:
#-------------------------
sudo apt-get install vim-gtk3-py2
#-------------------------
#然后，选择你所安装的`vim.gtk3-py2`
#=====================================================================
#user@osgeolive:~/project/vimrc$ sudo update-alternatives --config vim
#There are 3 choices for the alternative vim (providing /usr/bin/vim).

  #Selection    Path                   Priority   Status
#------------------------------------------------------------
#* 0            /usr/bin/vim.gtk3       50        auto mode
  #1            /usr/bin/vim.basic      30        manual mode
  #2            /usr/bin/vim.gtk3       50        manual mode
  #3            /usr/bin/vim.gtk3-py2   49        manual mode

#Press <enter> to keep the current choice[*], or type selection number: 3
#update-alternatives: using /usr/bin/vim.gtk3-py2 to provide /usr/bin/vim (vim) in manual mode
#=====================================================================








#Uninstall Vim 8.0:
#To uninstall Vim 8.0 and downgrade it to the stock version in Ubuntu repository, run the command below to purge the PPA:
#sudo apt install ppa-purge && sudo ppa-purge ppa:jonathonf/vim

#  autopep8 for `vim-autoformat`插件
# 用于格式化`python`文件
sudo apt-get install python-autopep8


