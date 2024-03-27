#!/bin/bash

# Enable exit on error
set -e

# # Available NodeJS versions (modify as needed)
# NODE_VERSIONS=(18.x 20.x 21.x)

# # Display available versions
# echo "Available NodeJS versions:"
# select NODE_VERSION in "${NODE_VERSIONS[@]}" "Exit"; do
#   case $REPLY in
#   1) break;;  # Exit on selection 1
#   2) break;;  # Exit on selection 2
#   3) break;;  # Exit on selection 3
#   4) echo "Exiting installation."; exit;;  # Exit on selection 4
#   *) echo "Invalid choice. Please select a valid version or Exit.";;
#   esac
# done


NODE_VERSION=20.x

# Update package lists
echo -e "\n * * * sudo apt-get update * * * \n" 
sudo apt-get update

# Install curl to download the NodeSource setup script
echo -e "\n * * * sudo apt-get install curl * * * \n" 
if ! command -v curl &> /dev/null; then
  sudo apt-get install curl
fi

# Install NodeSource package archive for the chosen NodeJS version
echo -e "\n * * * curl -sL https://deb.nodesource.com/setup_$NODE_VERSION -o nodesource_setup.sh * * * \n" 
curl -sL https://deb.nodesource.com/setup_$NODE_VERSION -o nodesource_setup.sh

# Verify downloaded script integrity (optional, using checksums from NodeSource)
# sha256sum nodesource_setup.sh (you'll need the expected checksum)

# Install NodeSource packages
echo -e "\n * * * sudo bash nodesource_setup.sh * * * \n" 
sudo bash nodesource_setup.sh

# Update package lists again (as NodeSource adds new entries)
echo -e "\n * * * sudo apt update * * * \n" 
sudo apt update

# Install NodeJS and npm
echo -e "\n * * * sudo apt install nodejs * * * \n" 
sudo apt install nodejs

# Clean up
echo -e "\n * * * rm -f nodesource_setup.sh * * * \n" 
rm -f nodesource_setup.sh

# Verify installation
echo -e "\n * * * nodejs version * * * \n" 
node -v
npm -v
echo "NodeJS $NODE_VERSION and npm successfully installed!"

