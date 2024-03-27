#!/bin/bash

# Enable exit on error
set -e

# Update package list
echo -e "\n * * * sudo apt update * * * \n" 
sudo apt update

# Update package list
echo -e "\n * * * sudo apt upgrade -y * * * \n" 
sudo apt upgrade -y

# echo -e "\n * * * sudo apt-get autoclean * * * \n"
echo -e "\n * * * sudo apt autoclean * * * \n" 
sudo apt autoclean

# echo -e "\n * * * sudo apt-get autoremove * * * \n"
echo -e "\n * * * sudo apt autoremove * * * \n" 
sudo apt autoremove

echo -e "\nUbuntu Server Updated & Upgraded successfully" 