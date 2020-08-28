# #!/usr/bin/env bash
# Some apps don't have brew packages, these include,
# - Matlab
# - Myki
# - NordVPN
# - Magnet
# - Discord, Whatsapp, Telegram
# - Xcode

# Install Xcode command line utilities
xcode-select --install


echo "Checking for Homebrew"
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Installing packages
NORMALS = (
gcc
git
octave
python@3.8
r
ranger
tree
)
brew cask install ${NORMALS[@]}

# Installing Casks
CASKS = (
appcleaner
atom
google-chrome
iterm2
spotify
transmission
visual-studio-code
vlc
mactex
rstudio
texstudio
keka
pycharm-ce
github-desktop
)
brew cask install ${CASKS[@]}

echo "Cleaning up..."
brew cleanup

echo "Configuring OSX..."

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Always show hidden files
defaults write com.apple.Finder AppleShowAllFiles true

# Show the Library folder
chflags nohidden ~/Library



echo "Install complete!"
