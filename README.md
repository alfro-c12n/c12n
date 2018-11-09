## First: Install zsh
1. Download and install Oh-my-zsh
sudo apt install zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

2. Replace config with custom version
bash zsh/create-symlinks.sh

3. Add git configs
git config --global alias.lg 'log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

## Install other custom stuf
sudo apt install xclip
cd autojump && ./install.py       # Awesome cd command (do j stuff)
sudo apt install when             # Nice calendar util
pip3 install mycli                # Mysql client
pip3 install pgcli                # Postgresql client
pip3 install glances              # Htop + stuff
sudo apt install neofetch

1. Install emacs-anywhere:
sudo apt install xdotool
./emacs-anywhere/install

2. Add shortcut for emacs-anywhere: (TODO: Include on install commands)
Settings > Custom Shortcuts (Super+E)

3. Add shortcut for jump to terminal (Super + ñ):
bash -c 'wmctrl -R $(wmctrl -l | grep -oh -e "@.*: ")' 

4. tiny-care-terminal?
https://github.com/notwaldorf/tiny-care-terminal#make-it-go

5. terminal icons support?
./icons-in-terminal/install.sh

6. Install bat:
https://github.com/sharkdp/bat
