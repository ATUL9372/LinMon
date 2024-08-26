#!/bin/bash


GREEN="\033[32m"
YELLOW="\033[33m"
RED="\033[31m"
NO="\033[0m"
BOLD="\033[1m"

c1="##################################################################"
c2="------------------------------------------------------------------"
c3="__________________________________________________________________"
c4="========== ${YELLOW}Installing "
c5="=========="

figlet "Install     Monitoring      Tools"
echo "${c2}"

echo ""
echo "Author : Mr. Atul Yadav"
echo "${c3}"
echo ""

packages=(
    "update"
    "figlet"
    "net-tools (ifconfig)"
    "iproute2 (ip a)"
    "ifstat"
    "procps (uptime, free)"
    "sysstat (mpstat)"
    "nload"
    "tmux"
    "update"
)


echo -e "${GREEN}Required Packages:${NO}"
for pkg in "${packages[@]}"; do
    echo -e "${YELLOW}- $pkg${NO}"
done

echo "${c3}"
echo ""

echo -e "${c5} ${RED}update${NO} ${c5}"
sudo apt update -y
echo "${c1}"
echo ""
echo ""

echo -e "${c4}${RED}Figlet${NO} ${c5}"
sudo apt install figlet -y
echo "${c1}"
echo ""
echo ""

echo -e "${c4}${RED}net-tools${NO} ${c5}"
sudo apt install net-tools -y
echo "${c1}"
echo ""
echo ""

# ###
# echo -e "${c4}${RED}${NO} ${c5}"
# sudo apt install  -y
# echo "${c1}"
# echo ""
# echo ""
# ###

echo -e "${c4}${RED}ifstat${NO} ${c5}"
sudo apt install ifstat -y
echo "${c1}"
echo ""
echo ""

echo -e "${c4}${RED}procps${NO} ${c5}"
sudo apt install procps -y
echo "${c1}"
echo ""
echo ""

echo -e "${c4}${RED}sysstat${NO} ${c5}"
sudo apt install sysstat -y
echo "${c1}"
echo ""
echo ""

echo -e "${c4}${RED}nload${NO} ${c5}"
sudo apt install nload -y
echo "${c1}"
echo ""
echo ""

echo -e "${c4}${RED}tmux${NO} ${c5}"
sudo apt install tmux -y
echo "${c1}"
echo ""
echo ""

echo -e "${c5} ${RED}update${NO} ${c5}"
sudo apt update -y
echo "${c1}"
echo ""
echo ""


echo -e "${RED}############### ${YELLOW} Installation is Completed ${RED}}###############${NO}"