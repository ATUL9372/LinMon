#!/bin/bash


GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
RED=$(tput setaf 1)
RESET=$(tput sgr0)
BOLD=$(tput bold)


top_cpu() {
    echo "${BOLD}${YELLOW}Top 10 CPU Consuming Processes:${RESET}"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 11
    echo ""
}


top_memory() {
    echo "${BOLD}${YELLOW}Top 10 Memory Consuming Processes:${RESET}"
    ps -eo pid,comm,%mem --sort=-%mem | head -n 11 
    echo ""
}


network_monitor() {
    echo "${BOLD}${GREEN}Network Monitoring:${RESET}"
    echo "${YELLOW}Number of Concurrent Connections: ${RESET}$(ss -Htan | wc -l)"
    echo "${YELLOW}Packet Drops: ${RESET}$(netstat -s | grep 'segments retransmited')"
    echo "${YELLOW}Network Traffic (MB in/out):${RESET}"
    ifstat -t 1 1 | tail -n +3 
    echo ""
}


disk_usage() {
    echo "${BOLD}${GREEN}Disk Usage:${RESET}"
    df -h 
    echo "${BOLD}${RED}Partitions using more than 80% space:${RESET}"
    df -h | awk '$5 >= 80 {print $0}' 
    echo ""
}


system_load() {
    echo "${BOLD}${YELLOW}System Load:${RESET}"
    uptime
    echo "${YELLOW}CPU Usage Breakdown:${RESET}"
    mpstat | tail -n +4 | awk '{print "User: "$3"% System: "$5"% Idle: "$13"%"}' 
    echo ""
}


memory_usage() {
    echo "${BOLD}${GREEN}Memory Usage:${RESET}"
    free -h | awk 'NR==2{printf "Total: %-8s Used: %-8s Free: %-8s\n", $2,$3,$4}' | column -t
    echo "${BOLD}${YELLOW}Swap Memory Usage:${RESET}"
    free -h | awk 'NR==3{printf "Total: %-8s Used: %-8s Free: %-8s\n", $2,$3,$4}' | column -t
    echo ""
}


process_monitor() {
    echo "${BOLD}${YELLOW}Process Monitoring:${RESET}"
    echo "${GREEN}Total Active Processes: ${RESET}$(ps aux | wc -l)"
    echo "${YELLOW}Top 5 CPU Processes:${RESET}"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6 | column -t
    echo "${YELLOW}Top 5 Memory Processes:${RESET}"
    ps -eo pid,comm,%mem --sort=-%mem | head -n 6 | column -t
    echo ""
}


service_monitor() {
    echo "${BOLD}${GREEN}Service Monitoring:${RESET}"
    for service in sshd nginx apache2 iptables ufw; do
        if systemctl is-active --quiet $service; then
            echo "${BOLD}${service} is ${GREEN}running${RESET}"
        else
            echo "${BOLD}${service} is ${RED}NOT running${RESET}"
        fi
    done
    echo ""
}


dashboard() {
    clear
    echo "${BOLD}${YELLOW}System Resource Dashboard${RESET}"
    echo "${BOLD}${GREEN}-------------------------${RESET}"
    echo ""

    top_cpu
    echo "---------------------------------------------------------------------------------------------------------------"
    echo ""
    echo ""

    top_memory
    echo "---------------------------------------------------------------------------------------------------------------"
    echo ""
    echo ""

    network_monitor
    echo "---------------------------------------------------------------------------------------------------------------"
    echo ""
    echo ""

    disk_usage
    echo "---------------------------------------------------------------------------------------------------------------"
    echo ""
    echo ""

    system_load
    echo "---------------------------------------------------------------------------------------------------------------"
    echo ""
    echo ""
    
    memory_usage
    echo "---------------------------------------------------------------------------------------------------------------"
    echo ""
    echo ""

    process_monitor
    echo "---------------------------------------------------------------------------------------------------------------"
    echo ""
    echo ""

    service_monitor
    echo "---------------------------------------------------------------------------------------------------------------"
    echo ""
    echo ""
}


case "$1" in
    -cpu)
        top_cpu
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
    -services)
        service_monitor
        ;;
    *)
        while true; do
            dashboard
            sleep 5  
        done
        ;;
esac
