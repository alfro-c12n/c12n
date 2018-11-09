rm ~/.zshrc
ln -s ~/.c12n/zsh/.zshrc ~/.zshrc

rm -rf ~/.oh-my-zsh/
ln -s ~/.c12n/zsh/.oh-my-zsh/ ~/.oh-my-zsh

echo "Setting up zsh as default shell (chsh -s /bin/zsh $USER)"
chsh -s /bin/zsh $USER

rm -rf ~/.config/i3/config
ln -s ~/.c12n/i3/config ~/.config/i3/config
