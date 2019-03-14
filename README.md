# dotfiles

My dotfiles  
  
Setup  

mkdir -p ~/.vim/autoload  
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim  
  
mkdir ~/dotfiles  
cd ~/dotfiles  
git clone git@gitlab.com:abhithegeek/dotfiles.git  
ln -s ~/dotfiles/.vimrc ~/.vimrc  
ln -s ~/dotfiles/.tern-project ~/.tern-project  
ln -s ~/dotfiles/.bashrc ~/.bashrc  
