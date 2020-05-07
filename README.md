kaliup
======

> A flexible, highly customizable, all-in-one Kali Linux setup framework.

## Features

- Support package managers:
    - apt (install and remove)
    - npm
    - yarn
    - pip3
    - go
    - git

- Install app from GitHub release page (githubapp.sh)

## Framework structure

```
├── globalvar.yaml
├── kaliup.sh
├── list
│   ├── apt.list
│   ├── aptremove.list
│   ├── githubapp.list
│   ├── git.list
│   ├── go.list
│   ├── npm.list
│   ├── pip.list
│   └── yarn.list
└── script
    ├── aptremove.sh
    ├── apt.sh
    ├── githubapp.sh
    ├── git.sh
    ├── go.sh
    ├── npm.sh
    ├── pip.sh
    └── yarn.sh
```

- kaliup.sh: main script
- globalvar.yaml: global variables used in any scripts
- list/: app/package/module list, one item per line
- script/: bash scripts

## Usage

```bash
Usage:
  ./kaliup.sh [<script_name> <script_name2>...] [--help]

  Support Kali 2020.1

Custom scripts:
  aptremove         run ./script/aptremove.sh
  apt               run ./script/apt.sh
  githubapp         run ./script/githubapp.sh
  git               run ./script/git.sh
  go                run ./script/go.sh
  npm               run ./script/npm.sh
  pip               run ./script/pip.sh
  yarn              run ./script/yarn.sh
  <script_name>     run ./script/<script_name>.sh
```

Example:

- Install apps from `apt`, `pip` and `go` lists:

```bash
~$ ./kaliup.sh apt pip go
```

### Easy configuration

- Add any apps/packages into `list/<script_name>.list` file accordingly, then run `./kailu <srcipt_name>` to install them

### Easy extension

- Need a new global variable for your script? Add it in `globalvar.yaml`

- Need a new package manager? Simply add script to `script/` and then create app/package list in `list/`

### Easy customization

- Already have your own setup script? Feel free to hook up by copying it to `script/` folder, run it `./kaliup.sh <your_script_name>`
