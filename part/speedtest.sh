#!/bin/bash
# Ver Alpha-0.1.0

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

setup() {
    echo "Setting Up..."
    if [[ "$OS" == "ubuntu" || "$OS" == "debian" ]]; then
        sudo apt-get update
        sudo apt-get install -y curl
        curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
        sudo apt-get install -y speedtest
    elif [[ "$OS" == "centos" || "$OS" == "almalinux" ]]; then
        sudo yum install -y curl
        curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.rpm.sh | sudo bash
        sudo yum install -y speedtest
    fi
}

clear
