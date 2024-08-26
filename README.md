# LinMon

**LinMon** is a bash script designed for real-time system monitoring on Debian-based Linux systems. It provides essential metrics including CPU usage, network activity, system load, memory usage, process management, and service monitoring. The script is lightweight and easy to use, making it ideal for managing and overseeing Debian-based servers.

## Features

- **Top 10 Most Used Applications**: Displays the top 10 applications consuming the most CPU and memory.
- **Network Monitoring**: Monitors the number of concurrent connections, packet drops, and total network traffic (MB in and out).
- **Disk Usage**: Shows disk space usage by mounted partitions and highlights partitions using more than 80% of their space.
- **System Load**: Provides the current system load average and a breakdown of CPU usage (user, system, idle, etc.).
- **Memory Usage**: Displays total, used, and free memory along with swap memory usage.
- **Process Monitoring**: Shows the number of active processes and the top 5 processes in terms of CPU and memory usage.
- **Service Monitoring**: Monitors the status of essential services such as `sshd`, `nginx/apache`, and `iptables`.
- **Custom Dashboard**: Offers command-line switches to view specific parts of the dashboard, such as `-cpu`, `-memory`, `-network`, etc.


## Installation

1. Clone the repository:

    ```bash
    https://github.com/ATUL9372/LinMon.git
    cd LinMon
    ```

2. Make the script executable:

    ```bash
    sudo chmod +x installation.sh LinMon_DashBoard_Tmux.sh LinMon_Functions.sh LinMon.sh
    ```

3. Install required packages:

    ```bash
    sudo ./installation.sh
    ```

4. Run the script:

    ```bash
    sudo ./LinMon.sh

5. Run the script with Tmux dashboard:

    ```bash
    sudo ./LinMon_DashBoard_Tmux.sh