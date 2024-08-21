#!/bin/bash

# Function to display the top 10 most used applications
function top_apps() {
    echo "Top 10 Most Used Applications:"
    ps aux --sort=-%cpu | awk 'NR<=11{print $0}' | head -n 10
    ps aux --sort=-%mem | awk 'NR<=11{print $0}' | head -n 10
    echo
}

# Function to display network monitoring information
function network_monitor() {
    echo "Network Monitoring:"
    netstat -an | grep ESTABLISHED | wc -l
    netstat -s | grep 'packets:' | awk '{print $1, $2}'
    echo "Network I/O:"
    sar -n DEV 1 1 | grep Average | awk '{print "In: " $5 " KB/s, Out: " $6 " KB/s"}'
    echo
}

# Function to display disk usage
function disk_usage() {
    echo "Disk Usage:"
    df -h
    df -h | awk '$5>80 {print $0}'
    echo
}

# Function to display system load
function system_load() {
    echo "System Load:"
    uptime
    mpstat
    echo
}

# Function to display memory usage
function memory_usage() {
    echo "Memory Usage:"
    free -h
    echo
}

# Function to display process monitoring information
function process_monitor() {
    echo "Process Monitoring:"
    ps -e --no-headers | wc -l
    ps aux --sort=-%cpu | head -n 6
    ps aux --sort=-%mem | head -n 6
    echo
}

# Function to display service status
function service_monitor() {
    echo "Service Monitoring:"
    for service in sshd nginx apache2 iptables; do
        systemctl is-active --quiet $service && echo "$service is running" || echo "$service is not running"
    done
    echo
}

# Function to display custom dashboard based on argument
function custom_dashboard() {
    case $1 in
        -cpu)
            top_apps
            ;;
        -memory)
            memory_usage
            ;;
        -network)
            network_monitor
            ;;
        -disk)
            disk_usage
            ;;
        -load)
            system_load
            ;;
        -process)
            process_monitor
            ;;
        -service)
            service_monitor
            ;;
        *)
            echo "Usage: $0 {-cpu|-memory|-network|-disk|-load|-process|-service}"
            exit 1
            ;;
    esac
}

# Main script execution
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 {-cpu|-memory|-network|-disk|-load|-process|-service}"
    exit 1
fi

# Call the custom_dashboard function with the provided argument
custom_dashboard "$1"
