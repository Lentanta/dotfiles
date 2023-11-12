# Checking and symlink tmux config file
echo "Checking tmux config file"

if [ -f ~/.tmux.conf ] || [ -L ~/.tmux.conf ]; then
  echo "File exits"

else
  echo "File not exits"
  ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
fi
