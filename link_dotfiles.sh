#!/bin/bash

# Define the location of your repository (the source)
DOTFILES_REPO="$HOME/mark-setup"

# --- Configuration ---
# Define an array of files/folders to link and their system targets
# Format: "repo_path:target_path"
declare -A links=(
    ["home/.config/starship.toml"]="$HOME/.config/starship.toml"
    ["home/.oh-my-zsh/custom/aliases.zsh"]="$HOME/.oh-my-zsh/custom/aliases.zsh"
    ["home/.oh-my-zsh/custom/pyenv.zsh"]="$HOME/.oh-my-zsh/custom/pyenv.zsh"
    ["home/Templates"]="$HOME/Templates"
    ["home/.zshrc"]="$HOME/.zshrc"
)
# ---------------------

# Loop through the defined links
for source_file in "${!links[@]}"; do
    target_link="${links[$source_file]}"
    repo_source="${DOTFILES_REPO}/${source_file}"

    echo "--- Processing: ${source_file} ---"
    
    # --- 1. CHECK IF REPO SOURCE EXISTS ---
    if [ ! -e "$repo_source" ]; then
        echo "❌ ERROR: Source file not found in repository: $repo_source"
        continue # Skip to the next item in the loop
    fi
    
    # --- 2. PREPARE TARGET LOCATION ---
    # Create parent directories for the target link if they don't exist
    mkdir -p "$(dirname "$target_link")"
    
    # --- 3. HANDLE EXISTING TARGET LINK ---
    if [ -e "$target_link" ] || [ -L "$target_link" ]; then
        # Check if it is an existing symlink
        if [ -L "$target_link" ]; then
            echo "🔄 Existing symlink found, overwriting: $target_link"
            rm "$target_link"
        # Check if it is an actual file or directory (not a symlink)
        else
            echo "⚠️ Target file/directory exists, creating a backup: $target_link.bak"
            mv "$target_link" "$target_link.bak"
        fi
    fi

    # --- 4. CREATE THE SYMBOLIC LINK ---
    echo "🔗 Linking $repo_source to $target_link"
    ln -s "$repo_source" "$target_link"
done

echo "---"
echo "✅ Symlinking process complete."