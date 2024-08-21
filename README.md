# Sourabh's System Monitoring Script

## Overview

This script monitors various system resources and presents them in a dashboard format. It provides real-time insights into CPU usage, memory usage, network activity, disk usage, system load, process details, and service statuses.

## Features

- **Top 10 Most Used Applications**: Shows the top 10 applications consuming the most CPU and memory.
- **Network Monitoring**: Displays the number of concurrent connections, packet drops, and network I/O.
- **Disk Usage**: Provides disk space usage by mounted partitions and highlights partitions using more than 80% of their space.
- **System Load**: Shows the current system load average and CPU usage breakdown.
- **Memory Usage**: Displays total, used, and free memory, along with swap memory usage.
- **Process Monitoring**: Shows the number of active processes and the top 5 processes in terms of CPU and memory usage.
- **Service Monitoring**: Monitors the status of essential services like sshd, nginx/apache, and iptables.

## Usage

To use the script, run it with one of the following options:

```bash
./monitor.sh -cpu
./monitor.sh -memory
./monitor.sh -network
./monitor.sh -disk
./monitor.sh -load
./monitor.sh -process
./monitor.sh -service

# -Sourabh-system-monitoring
