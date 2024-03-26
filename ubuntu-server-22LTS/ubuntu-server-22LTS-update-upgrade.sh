#!/bin/bash

# Enable exit on error
set -e

# Update package list
echo -e "\n * * * sudo apt-get update * * * \n" 
sudo apt-get update

# Update package list
echo -e "\n * * * sudo apt-get upgrade -y * * * \n" 
sudo apt-get upgrade -y

# echo -e "\n * * * sudo apt-get autoclean * * * \n"
# sudo apt-get autoclean

# echo -e "\n * * * sudo apt-get autoremove * * * \n"
# sudo apt-get autoremove

echo -e "\nUbuntu Server Updated & Upgraded successfully" 