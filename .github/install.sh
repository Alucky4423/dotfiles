#!/bin/bash

cat <<- DESC
                d88P       8888888b.   .d88888b. 88888888888 8888888888 8888888 888      8888888888 .d8888b. 
               d88P        888  "Y88b d88P" "Y88b    888     888          888   888      888       d88P  Y88b
 d888b  d88   d88P         888    888 888     888    888     888          888   888      888       Y88b.     
d888888888P  d88P          888    888 888     888    888     8888888      888   888      8888888    "Y888b.  
88P  Y888P  d88P           888    888 888     888    888     888          888   888      888           "Y88b.
           d88P            888    888 888     888    888     888          888   888      888             "888
          d88P    d8b      888  .d88P Y88b. .d88P    888     888          888   888      888       Y88b  d88P
         d88P     Y8P      8888888P"   "Y88888P"     888     888        8888888 88888888 8888888888 "Y8888P" 

DESC

# Variables
declare -r           ROOT=$HOME
declare -r REPOSITORY_URL=https://github.com/Alucky4423/dotfiles.git
declare -r   INSTALL_PATH=${ROOT}/.dotfiles.git
declare -r     BACKUP_DIR=${ROOT}/backup-dotfiles
# Functions
function NewLine() { echo ""; }
function MSG()   { echo -e "\033[1;32m[MSG] :$*\033[0m"; }
function INFO()  { echo -e "\033[1;34m[INFO]:$*\033[0m"; }
function ERR()   { echo -e "\033[1;31m[ERR] :$*\033[0m"; }

# TODO:
#   install package manager.
#   install git

#####################################################################
# Setup git user.
MSG "Setting 'git config --global user'."
MSG "Please input [user.name] and [user.email]."

# GITCONFIG_KEYS=("user.name" "user.email")
for KEY in "user.name" "user.email"; do
  echo -n "$KEY >> "; read -r INPUT
  git config --global "$KEY" "$INPUT"
done
INFO "Show git config --globals\n$(git config --global --list)"
NewLine

#####################################################################
# Clone bare repository.
MSG "Clone dotfiles repository."
function __config() {
  git --git-dir="${INSTALL_PATH}" --work-tree="${ROOT}" "$@"
}

git clone --bare "${REPOSITORY_URL}" "${INSTALL_PATH}"
__config config --local status.showUntrackedFiles no

__config checkout; RESULT=$?
if [ $RESULT -ne 0 ]; then
  ERR  "Failed git bare repository checkout."
  ERR  "Your folder already have some stock configuration files which would be overwritten by Git."
  INFO "Backup pre-existing dot files to ~/backup-dotfiles dirctory.";

  # Extract existing file names contained in the error message.
  mapfile -t EXISTING_DOTFILES < \
    <(__config checkout 2>&1 | grep -E "\s+\." | sed -E "s/^\s+//g")

  # Move existing files to backup directory.
  for DOTFILE in "${EXISTING_DOTFILES[@]}"; do
    # directoryを含む場合、backup_dir にdirを作成する。
    DIR=$(dirname "$DOTFILE")
    if [ "$DIR" != "." ] && ! [ -d "${BACKUP_DIR}/${DIR}" ] ; then
      mkdir -p "${BACKUP_DIR}/${DIR}"
    fi
    INFO "backup: mv" "${ROOT}/${DOTFILE}" "=>" "${BACKUP_DIR}/${DOTFILE}"
    mv "${ROOT}/${DOTFILE}" "${BACKUP_DIR}/${DOTFILE}"
  done
  __config checkout; RESULT=$?
fi;
[ $RESULT -eq 0 ] && MSG "Complete Checkout.\n"

INFO "Create an alias to interact with the configuration repository."
cat <<- DESC
# Example: 
alias config='git --git-dir=\$HOME/.dotfiles.git/ --work-tree=\$HOME'"

DESC

