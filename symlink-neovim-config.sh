# checking and symlink nvim folder
echo "Checking if nvim folder exits"
if [ -d ~/.config/nvim ]
then
  echo "Folder exits"
else
  echo "Folder not exits"
  ln -s ~/dotfiles/nvim ~/.config/
fi
