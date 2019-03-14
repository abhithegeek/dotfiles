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
  
# Install vim plugins
$vim  
:PlugInstall  
  
# Install fzf for use in bash
PlugInstall will download fzf  
$cd ~/.vim/fzf  
$./install  
  
# install ripgrep on ubuntu https://github.com/BurntSushi/ripgrep/releases
curl -LO <ripgrep_deb_file_url>  
sudo dpkg -i ripgrep_0.10.0_amd64.deb
