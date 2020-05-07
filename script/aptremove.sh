#!/usr/bin/env bash
mapfile -t l < <(get_app_list "$LIST_DIR/aptremove.list")
if [[ ${l[*]} ]]; then
    run_sudo
    sudo apt -y remove "${l[@]}" >&2
    sudo apt -y autoremove >&2
else
    print_error "Cannot find aptremove.list or it's empty!"
fi
