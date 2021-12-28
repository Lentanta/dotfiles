echo "Config script"

echo "Linking alacritty config file"
ln -s ~/dotfiles/.alacritty.yml ~/.alacritty.yml

# Checking and symlink
[ -d "~/.alacritty.yml" ] && echo "WAO"

# checking and symlink nvim folder
echo "Checking if nvim folder exits"
if [ -d "~/.config/nvim" ]
then
  echo "Folder exits"
else
  echo "Folder not exits"
  ln -s ~/dotfiles/nvim ~/.config/
fi

# Checking and symlink tmux config file
echo "Checking tmux config file"
if [ -e "~/.tmux.conf" ]
then
  echo "File exits"
else
  echo "File not exits"
  ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
fi
