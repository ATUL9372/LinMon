#!/bin/bash


GREEN="\033[32m"
YELLOW="\033[33m"
RED="\033[31m"
RESET="\033[0m"
BOLD="\033[1m"


top_cpu() {
    echo -e "${BOLD}${GREEN}Top 10 CPU Consuming Processes:${RESET}"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 11 
}


top_memory() {
    echo -e "${BOLD}${GREEN}Top 10 Memory Consuming Processes:${RESET}"
    ps -eo pid,comm,%mem --sort=-%mem | head -n 11 
}

network() {
    echo -e "${BOLD}${GREEN}Network Monitoring:${RESET}"
    echo -e "${YELLOW}Number of Concurrent Connections: ${RESET}$(ss -Htan | wc -l)"
    echo -e "${YELLOW}Packet Drops: ${RESET}$(netstat -s | grep 'segments retransmited')"
    echo -e "${YELLOW}Network Traffic (MB in/out):${RESET}"
    nload -m
    echo ""
}

disk_usage() {
    echo -e "${BOLD}${GREEN}Disk Usage:${RESET}"
    df -h 
    echo ""

    echo -e "${BOLD}${RED}Partitions using more than 80% space:${RESET}"
    df=$(df -h | awk '$5 >= 80 {print $0}' | column -t)
    echo -e "${YELLOW}$df${RESET}"
    echo ""
}

system_load() {
    echo -e "${BOLD}${GREEN}System Load:${RESET}"
    uptime
    echo -e "${YELLOW}CPU Usage Breakdown:${RESET}"
    mpstat | tail -n +4 | awk '{print "User: "$3"% System: "$5"% Idle: "$13"%"}' | column -t
    echo ""
}

memory_usage() {
    echo -e "${BOLD}${GREEN}Memory Usage:${RESET}"
    free -h | awk 'NR==2{printf "Total: %-8s Used: %-8s Free: %-8s\n", $2,$3,$4}' | column -t
    echo -e "${BOLD}${YELLOW}Swap Memory Usage:${RESET}"
    free -h | awk 'NR==3{printf "Total: %-8s Used: %-8s Free: %-8s\n", $2,$3,$4}' | column -t
    echo ""
}

process_monitor() {
    echo -e "${BOLD}${GREEN}Process Monitoring:${RESET}"
    echo -e "${RED}Total Active Processes: ${RESET}$(ps aux | wc -l)"
    echo -e "${YELLOW}Top 5 CPU Processes:${RESET}"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6 | column -t
    echo -e "${YELLOW}Top 5 Memory Processes:${RESET}"
    ps -eo pid,comm,%mem --sort=-%mem | head -n 6 | column -t
    echo ""
}

service_monitor() {
    echo -e "${BOLD}${GREEN}Service Monitoring:${RESET}"
    for service in sshd nginx apache2 iptables; do
        if systemctl is-active --quiet $service; then
            echo -e "${BOLD}${service} is ${GREEN}running${RESET}"
        else
            echo -e "${BOLD}${service} is ${RED}NOT running${RESET}"
        fi
    done
    echo ""
}