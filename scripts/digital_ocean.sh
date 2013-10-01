
# update everything
apt-get -y update

# install libraries
apt-get -y install vim

# zsh stuff
apt-get -y install zsh git-core
apt-get -y install zsh git
apt-get install zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
chsh -s `which zsh`


