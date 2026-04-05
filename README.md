# Mark Setup

## Post Install

Install Fedora 43 COSMIC and follow the [Fedora 43 Post Install Guide](https://github.com/devangshekhawat/Fedora-43-Post-Install-Guide), except for the `NVIDIA Drivers` and  the \[Optional\] sections in the end.

## Git

```bash
git config --global init.defaultBranch main
git config --global core.autocrlf input
git config --global user.name "Lucas T. R. Schneider"
git config --global user.email "lucastrschneider@gmail.com"
```

## SSH

Retrieve the SSH keys from bitwarden. You can also add them to the SSH agent if you want (see bellow).

### Generate new SSH keys

If you want, generate a new SSH key.

```bash
ssh-keygen -t ed25519 -C "lucastrschneider@gmail.com"
```

Add the (new) key to the SSH agent.

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_git
```

Copy the public key and add it wherever you need.

```bash
sudo dnf install xclip -y
xclip -selection clipboard < ~/.ssh/id_ed25519_git.pub
```

After this point, you should clone this repository in order to run the scripts more easily.

## Shell

```bash
sudo dnf install zsh

# Oh My Zsh installation
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

```bash
./setup_zsh.sh
```

If you want zsh as the default shell.

```bash
chsh -s $(which zsh)
```

### Starship

```bash
curl -sS https://starship.rs/install.sh | sh
```

## Basic Applications

After that, run the *basic install* script.

```bash
./basic_install.sh
```

## Dotfiles

### Create symlinks

```bash
./link_dotfiles.sh
```

### Extract archives

```bash
./extract_archives.sh
```

## Settings

### Desktop

#### Appearance

- Import theme from `settings/purple.ron`

#### Panel

Start segment:

- Numbered Workspaces
- Minimized Windows

Center segment:

- Date, Time & Calendar

End segment:

- Notifications Tray
- Privacy Indicator
- Cosmic Pomodoro
- Clipboard Manager
- Input Sources
- Tiling
- Sound
- Bluetooth
- Network
- Power & Battery
- Nofigications Center
- User Session

#### Dock

- Disable it completely

#### Window management

- Disable super key action
- Disable minimize buttom

#### Workspaces

- Displays have separate workspaces
- Horizontal

### Keyboard Shortcuts

Modify the following keyboard shortcuts:

- System
  - Open the launcher: `Super + space`
  - Switch keyboard language input source: `Alt + space`
  - Take a screenshot: `Super + p`
  - Open a terminal: `Super + Return`

- Custom
  - VSCode: `code`, `Super + c`

## Others

### VSCode Theme and Font

- Theme **Adwaita Dark & default syntax highlighting & colorful status bar**
- Open settings and add 'FiraCode Nerd Font' to the start of the list

### Tailscale

Follow this [documentation](https://tailscale.com/docs/install/linux) to install the tailscale client. Then this one to install the [systray](https://tailscale.com/docs/features/client/linux-systray) application.

### Docker

Follow [this documentation](https://docs.docker.com/engine/install/fedora/) to install Docker.

### Pyenv

```bash
curl -fsSL https://pyenv.run | bash
```

### Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Flatpaks

Install the following directly from the Store:

- Blanket
- Calibre
- Discord
- Flatseal
- Gear Lever
- Krita
- ONLYOFFICE
- Spotify
- Upscaler
- VLC
