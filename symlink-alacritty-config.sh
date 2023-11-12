# Checking and symlink tmux config file

echo "Checking tmux config file"
if [ -e ~/.alacritty.yml ] || [ -L ~/.alacritty.yml ]; then
  echo "Alacritty config exits"
else
  echo "File not exits"
  ln -s ~/dotfiles/.alacritty.yml ~/.alacritty.yml
fi
