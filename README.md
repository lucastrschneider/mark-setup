# Simon Setup

## Post Install

Install Fedora 43 COSMIC and follow the [Fedora 43 Post Install Guide](https://github.com/devangshekhawat/Fedora-43-Post-Install-Guide), except for the \[Optional\] sections in the end.

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

## Basic Applications

After that, run the *basic install* script.

```bash
./basic_install.sh
```

## Docker

Follow [this documentation](https://docs.docker.com/engine/install/fedora/) to install Docker.

After that, you can also install rocker if you want.

```bash
sudo pip3 install rocker
```

## Shell

```bash
./setup_zsh.sh
```

If you want zsh as the default shell.

```bash
chsh -s $(which zsh)
```

## Headset fix

```bash
./headset_fix.sh
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

## Nvitop

Install [nvitop](https://github.com/XuehaiPan/nvitop) to monitor CPU, GPU and memory usage with the terminal.

```bash
pip3 install --user nvitop
```

To run as resource monitor:

```bash
python3 -m nvitop
```

## Settings

### Desktop

#### Appearance

- Import theme from `settings/purple.ron`

#### Panel

- Add applets in correct order

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

### Automount

Use the **GNOME Disk** to configure the data partition to be automounted at login. Then it is possible to add bookmarks in Nautilus for the folders there.

### VSCode Theme and Font

- Theme **Adwaita Dark & default syntax highlighting & colorful status bar**
- Open settings and add 'FiraCode Nerd Font' to the start of the list
