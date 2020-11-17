# marmos91 .files

Personal dotfiles repository.

## How to install

First of all clone this repository

```bash
git clone https://github.com/marmos91/dotfiles.git
cd dotfiles
git submodule init
git submodule update
```

Run the following command

```bash
chmod +x ./install.sh
./install.sh
```

## Setup iTerm color scheme and custom fonts

To install iTerm color schema and custom fonts open iTerm preferences and go to the `Profile` tab.
Under the `Text` tab select the `SourceCodePro+Powerline+Awesome+Regular` font

![iterm-text](https://raw.githubusercontent.com/marmos91/dotfiles/master/assets/iterm-text.png)

Under the `Colors` tab click on the `Color Preset` option

![iterm-colors-1](https://raw.githubusercontent.com/marmos91/dotfiles/master/assets/iterm-colors-1.png)

Then select `Import...`

![iterm-colors-2](https://raw.githubusercontent.com/marmos91/dotfiles/master/assets/iterm-colors-2.png)

And select the `colors.itermcolors` file located in the `~/.dotfiles/iterm` folder

![iterm-colors-3](https://raw.githubusercontent.com/marmos91/dotfiles/master/assets/iterm-colors-3.png)

Finally select the just imported color scheme (`colors`) from the `Color Preset` menu again

![iterm-colors-4](https://raw.githubusercontent.com/marmos91/dotfiles/master/assets/iterm-colors-4.png)

Enjoy your new terminal 😊

## License

[MIT](https://github.com/marmos91/dotfiles/blob/master/LICENSE)
