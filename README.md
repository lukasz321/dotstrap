# dotstrap

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
```


```sh
# install brew packages of interest
cat brew-packages.txt | xargs brew install

brew services start redis
brew services start postgresql

```


```sh
# config git
git config --global user.name "lukasz"
git config --global user.email "hello@lzagaja.com"
```


```sh
# copy over dotfiles
cp dotfiles/{vimrc,zshrc,pylintrc} ~/{.vimrc,.zshrc,.pylintrc}
```


```sh
# import terminal theme, font size, etc
open Terminal → Settings → (3 dots) → Import Terminal.terminal

```


```sh
# turn off bouncing dock icons
defaults write com.apple.dock no-bouncing -bool true && killall Dock

# turn off system sounds
defaults write com.apple.systemsound "com.apple.sound.uiaudio.enabled" -bool false

# set dark theme
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark" && killall Dock
```
