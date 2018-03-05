## First: Install zsh
1. Download and install Oh-my-zsh
sudo apt install zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

2. Replace config with custom version
bash zsh/create-symlinks.sh

3. Add git configs
git config --global alias.lg 'log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

4. Install custom stuf

sudo apt install xclip

5. Install emacs-anywhere:
sudo apt install xdotool
./emacs-anywhere/install

6. Add shortcut for emacs-anywhere: (TODO: Include on install commands)
Settings > Custom Shortcuts (Super+E)
