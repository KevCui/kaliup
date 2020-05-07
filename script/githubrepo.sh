#!/usr/bin/env bash
mapfile -t l < <(get_app_list "$LIST_DIR/githubrepo.list")
if [[ ${l[*]} ]]; then
    mkdir -p "$GIT_DIR"
    cd "$GIT_DIR" || exit
    for l in "${l[@]}"; do
        git clone --depth 1 "https://github.com/$l" || true
    done
    cd "$CURRENT_DIR" || exit
else
    print_error "Cannot find githubrepo.list or it's empty!"
fi
