
Tureba's base configuration files
=================================

In order to use these files, you/I have to:

* place the repo in ~/.config/vim and get the submodules
* edit ~/.{bash,zsh,psql}rc to source ~/.config/vim/{bash,zsh,psql}rc after system stuff and before the local machine's specific configuration
* link ~/.toprc, ~/.inputrc, ~/.gitconfig and ~/.tmux.conf to the respective files in ~/.config/vim
* link ~/.config/i3/config to ~/.config/vim/i3config
* make sure the default XDG directories are there (the most interesting ones are in ~/.config/vim/environment)
* resource ~/.{bash,zsh}rc
* ????
* profit

Arthur Nascimento <tureba@gmail.com> (github.com/tureba)
