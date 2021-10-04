echo "Config script"

echo "Linking alacritty config file"
ln -s ~/dotfiles/.alacritty.yml ~/.alacritty.yml

# checking and symlink nvim folder
echo "Checking if nvim folder exits"
if [ -d "~/.config/nvim" ]
then
	echo "Folder exits"
else
	echo "Folder not exits"
	ln -s ~/dotfiles/nvim ~/.config/
fi
