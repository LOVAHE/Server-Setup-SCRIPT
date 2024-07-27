#!/bin/bash

check_os() {
    if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        OS=$ID
    else
        echo "Cannot determine the operating system."
        exit 1
    fi
}

check_os

if [[ "$OS" != "ubuntu" && "$OS" != "debian" && "$OS" != "centos" && "$OS" != "almalinux" ]]; then
    echo "This script only works on Ubuntu, Debian, CentOS or AlmaLinux servers."
    exit 1
fi

clear


# Menu
show_menu() {
    echo ""
    echo ""
    echo ""
    echo "#########################"
    echo "Author: Baidu0com"
    echo "Telegram channel: https://t.me/VVairport"
    echo "Last Update on 2024, 23 Jul"
    echo "Github https://github.com/LOVAHE/Server-Setup-SCRIPT/"
    echo "#########################"
    echo ""
    echo ""
    echo "Select an option:"
    echo "1. Install Required"
    echo "2. Set Firewall"
    echo "3. Set SSH"
    echo "4. Set Swapfile"
    echo "5. Install Docker and compose"
    echo "6. Install XrayR"
    echo "------------"
    echo "0. Exit Script"
}
