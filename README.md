# Assignment 3 - Local CI Pipeline for a Bash Application

## Overview

This project implements a local CI pipeline for a Bash diagnostic application.

The application provides commands for checking system information, host connectivity, and network ports.

## Application Commands

```bash
./app/app.sh system-info
./app/app.sh check-host <host>
./app/app.sh check-port <host> <port>
./app/app.sh help

##Project Structure
assignment-3/
├── README.md
├── app/
│   └── app.sh
├── scripts/
│   ├── lint.sh
│   └── build.sh
├── tests/
│   └── test.sh
├── .github/
│   └── workflows/
│       └── ci.yml
├── Dockerfile
├── compose.yaml
├── .dockerignore
└── grade.sh
