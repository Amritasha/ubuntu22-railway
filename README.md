![Ubuntu](https://img.shields.io/badge/Ubuntu-22.04-E95420?logo=ubuntu)
![Docker](https://img.shields.io/badge/Docker-Supported-blue?logo=docker)

# Ubuntu 22.04 Railway

A browser-accessible Ubuntu 22.04 terminal deployed on Railway using [ttyd](https://github.com/tsl0922/ttyd).

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.com/new/template)

## Description

Deploys an Ubuntu 22.04 LTS container accessible from any browser. No local installation required.

## Environment Variables

| Variable | Description |
|----------|-------------|
| `PORT` | Port for ttyd to listen on |
| `USERNAME` | Login username for the web terminal |
| `PASSWORD` | Login password for the web terminal |

> **Note:** Always set USERNAME and PASSWORD before deploying.

## Features

- 🐧 Ubuntu 22.04 LTS (Jammy Jellyfish)
- 🔒 Password-protected web terminal
- 💻 Neofetch on login
- 🛠️ Pre-installed: wget, curl, git, python3, pip

## Use Cases

- Test shell scripts from anywhere
- Learn Linux commands in a browser
- Lightweight remote dev environment
- Package and tool testing
