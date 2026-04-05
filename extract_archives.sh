#!/bin/bash

# Define the location of your repository (the source directory where the archives are)
DOTFILES_REPO="$HOME/mark-setup" 

# --- Configuration ---
# Define an associative array mapping the archive filename 
# (relative to DOTFILES_REPO) to the TARGET directory where its contents should be extracted.
# Format: "archive_filename.tar.gz:target_directory_path"
declare -A archives=(
    ["home/.fonts/my-fonts.tar.gz"]="$HOME/.fonts" 
)
# ---------------------

echo "--- Starting Archive Deployment ---"

# Loop through the defined archives
for archive_file in "${!archives[@]}"; do
    target_dir="${archives[$archive_file]}"
    repo_source="${DOTFILES_REPO}/${archive_file}"

    echo "--- Processing Archive: ${archive_file} ---"
    
    # --- 1. CHECK IF REPO SOURCE ARCHIVE EXISTS ---
    if [ ! -f "$repo_source" ]; then
        echo "❌ ERROR: Archive file not found in repository: $repo_source"
        continue # Skip to the next item
    fi
    
    # --- 2. PREPARE TARGET LOCATION ---
    # Create the target directory if it doesn't exist
    if [ ! -d "$target_dir" ]; then
        echo "Creating target directory: $target_dir"
        mkdir -p "$target_dir"
    fi
    
    # --- 3. DECOMPRESS AND EXTRACT ---
    echo "📦 Extracting $repo_source into $target_dir"
    
    # The 'tar' command parameters:
    # -x: eXtract
    # -z: filter through gzip (for .gz files)
    # -f: use the specified File
    # -C: Change to the specified directory (the target) before extraction
    tar -xzf "$repo_source" -C "$target_dir"
    
    # Check the exit status of the tar command
    if [ $? -eq 0 ]; then
        echo "✅ Successfully extracted."
    else
        echo "🔥 FAILED to extract archive $archive_file. Check file integrity or permissions."
    fi

done

echo "---"
echo "✨ Archive deployment complete."