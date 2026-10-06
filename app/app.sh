#!/bin/bash

# Assignment 3 - Diagnostic CLI

show_help() {
    echo "Usage:"
    echo "  diagnostic system-info"
    echo "  diagnostic check-host <host>"
    echo "  diagnostic check-port <host> <port>"
    echo "  diagnostic help"
}

system_info() {
    echo "SYSTEM INFORMATION"
    echo "Hostname: $(hostname)"
    echo "Current User: $(whoami)"
    echo "Date/Time: $(date)"
    echo "Operating System: $(uname -s)"
    echo "Kernel Version: $(uname -r)"
    echo "Uptime: $(uptime -p)"
}

check_host() {
    local host="$1"

    if ping -c 1 -W 2 "$host" >/dev/null 2>&1; then
        echo "Host $host is reachable"
        return 0
    else
        echo "Host $host is not reachable"
        return 1
    fi
}

check_port() {
    local host="$1"
    local port="$2"

    if timeout 3 bash -c "</dev/tcp/$host/$port" >/dev/null 2>&1; then
        echo "Port $port on $host is open"
        return 0
    else
        echo "Port $port on $host is closed or unreachable"
        return 1
    fi
}

case "$1" in
    system-info)
        if [ "$#" -ne 1 ]; then
            echo "Error: system-info does not accept arguments."
            exit 2
        fi
        system_info
        ;;

    check-host)
        if [ "$#" -ne 2 ]; then
            echo "Error: check-host requires exactly one host."
            show_help
            exit 2
        fi
        check_host "$2"
        ;;

    check-port)
        if [ "$#" -ne 3 ]; then
            echo "Error: check-port requires a host and port."
            show_help
            exit 2
        fi
        check_port "$2" "$3"
        ;;

    help|"")
        if [ "$#" -gt 1 ]; then
            echo "Error: invalid arguments."
            exit 2
        fi
        show_help
        ;;

    *)
        echo "Error: unknown command '$1'"
        show_help
        exit 2
        ;;
esac
