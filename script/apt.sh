#!/usr/bin/env bash
run_sudo

# main sources
s="/etc/apt/sources.list"
sd="/etc/apt/sources.list.d"
sudo su -c 'echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" > '"$s"
sudo su -c 'echo "deb http://deb.debian.org/debian buster main contrib non-free" >> '"$s"
sudo su -c 'echo "deb-src http://deb.debian.org/debian buster main contrib non-free" >> '"$s"
sudo su -c 'echo "deb http://security.debian.org/debian-security buster/updates main contrib" >> '"$s"
sudo su -c 'echo "deb-src http://security.debian.org/debian-security buster/updates main contrib" >> '"$s"

# unlock db
sudo rm -f /var/lib/apt/lists/lock || true
sudo rm -f /var/lib/dpkg/lock || true
sudo rm -f /var/lib/dpkg/lock-frontend || true
sudo rm -f /var/cache/apt/archives/lock || true

# nodejs
if [[ ! -f "$sd/nodesource.list" ]]; then
    print_info "Adding nodejs source..."
    sudo su -c "curl -sL https://deb.nodesource.com/setup_13.x | bash -"
fi

# yarn
if [[ ! -f "$sd/yarn.list" ]]; then
    print_info "Adding yarn source..."
    sudo su -c "curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -"
    sudo su -c 'echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list'
fi

mapfile -t l < <(get_app_list "$LIST_DIR/apt.list")
if [[ ${l[*]} ]]; then
    sudo apt update --fix-missing >&1
    sudo apt -y install "${l[@]}" >&2
else
    print_error "Cannot find apt.list or it's empty!"
fi
