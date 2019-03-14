# dotfiles

My dotfiles  
  
# Download vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim  
  
# Get dotfiles and create symlinks
cd ~
git clone git@gitlab.com:abhithegeek/dotfiles.git  
ln -s ~/dotfiles/.vimrc ~/.vimrc  
ln -s ~/dotfiles/.tern-project ~/.tern-project  
ln -s ~/dotfiles/.bashrc ~/.bashrc  

# create backup directory for vim
mkdir /tmp/.vimbackup

# install ripgrep on ubuntu
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb  
sudo dpkg -i ripgrep_0.10.0_amd64.deb
