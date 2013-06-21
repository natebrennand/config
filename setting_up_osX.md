## Setting up your Mac for Development


#####Start by downloading Xcode from the app store

* This will take a long time, 1.5 gb

#####Then start downloading sublime text 2

* http://www.sublimetext.com/2
* Then install package control for Sublime
	* http://wbond.net/sublime_packages/package_control
* Install the sublimelinter package

#####When Xcode has finished, go to Preferences

* Choose the Downloads pane
* Hit install for "Command Line Tools"

#####Now install HomeBrew

* http://mxcl.github.io/homebrew/  

      ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

* (use the ruby command at the bottom)

#####Now install git

* "brew install git"
* allow the command line to use your keychain
* git config --global credential.helper osxkeychain
* Download and install github
	* http://mac.github.com/
* Make an education account to get private repos
	* https://github.com/edu
* update your gitconfig
	* https://github.com/edu

#####Now install zshell

* Oh-my-zshell
* https://github.com/robbyrussell/oh-my-zsh
	     
	    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

#####Increase your key-repeat rate and Remap your capslock key

* http://pqrs.org/macosx/keyremap4macbook/
	* Lower the "Delay to Key Repeat" and "Key Repeat", test it and figure out what's comfortable to you.
* http://pqrs.org/macosx/keyremap4macbook/pckeyboardhack.html.en
	* Remap you capslock key to ESC, trust me, you'll love it.
	* Remap your ESC to capslock if you want to.

#####Command line help

* Make it easier to navigate with Z
* This helps you jump around all of the directories you spend the most time in
	* https://github.com/rupa/z
* Know whether or not your commands are valid with syntax highlighting
* Syntax highlighting will high light 
	* https://github.com/zsh-users/zsh-syntax-highlighting



