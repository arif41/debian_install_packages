#!/bin/sh
clear
echo "===============Install Packages for ServerDebian============="
echo ""
read -p "Press [Enter] to continue"
clear

ShowMenu () {
clear
echo "-----------------------------------"
echo "- Created by : - Ahmad Karlam     -"
echo "-              - Arief Wiguna     -"
echo "- Install for Debian Server       -"
echo "-----------------------------------"
echo ""
echo "Pilih:"
echo ""
echo "[1] Install applikasi yang dibutuhkan (Domain dan WebServer)"
echo "[2] Setting IP dan Name Server"
echo "[3] Konfigurasi DNS Server"
echo "[4] Konfigurasi Web Server"
echo "[5] Restore Backup"
echo ""
echo "[x] exit"
echo ""

}

while [ 1 ]
do
ShowMenu
read CHOICE
case "$CHOICE" in
	"1")
	clear
	echo ""
	echo "Menginstall applikasi yang dibutuhkan"
	echo ""
	sudo apt-get install  bind9 apache2 phpmyadmin php5 mysql-server
	busybox sleep 1
	echo ""
	echo "Install Selesai"
	echo ""
	busybox sleep 1
	clear
	;;
	
	"2")
	echo ""
	echo "Konfigurasi IP"
	echo ""
	echo "Masukan IP address (C:192.168.1.1):"
	read IP;
	echo "Masukan gateway (C:192.168.1.2):"
	read gateway;
	echo "Masukan Netmask (C:255.255.255.0):"
	read netmask;
	echo "Masukan IP Broadcast (C:192.168.1.255):"
	read broadcast;
	echo "Masukan IP Network (C:192.168.1.0):"
	read network;
	sudo cp /etc/network/interfaces /etc/network/interfaces.bak
	sudo nano /etc/network/interfaces 
	busybox echo "auto lo" >> /etc/network/interfaces
	busybox echo "iface lo inet loopback" >> /etc/network/interfaces
	busybox echo "" >> /etc/network/interfaces
	busybox echo "auto eth0" >> /etc/network/interfaces
	busybox echo "iface eth0 inet static" >> /etc/network/interfaces
	busybox echo "address $IP" >> /etc/network/interfaces
	busybox echo "network $network" >> /etc/network/interfaces
	busybox echo "netmask $netmask" >> /etc/network/interfaces
	busybox echo "broadcast $broadcast" >> /etc/network/interfaces
	busybox echo "gateway $gateway" >> /etc/network/interfaces
	busybox echo "" >> /etc/network/interfaces
	sudo service networking restart
	echo "Settingan IP Anda Sekarang : "
	echo "IP        : $IP"
	echo "Gateway   : $gateway"
	echo "Netmask   : $netmask"
	echo "Broadcast : $broadcast"
	echo "Network   : $network"
	echo ""
	busybox sleep 5
	read -p "Press [Enter]"
	busybox sleep 1
	echo ""
	echo "Selesai"
	echo ""
	busybox sleep 1
	clear 
	;;

	"5")
	echo ""
	echo "======================="
	echo "- Restorisasi  Backup -"
	echo "======================="
	sudo rm -rf /etc/network/interfaces
	sudo cp -rf /etc/network/interfaces.bak /etc/network/interfaces
	sudo service networking restart
	busybox sleep 2
	echo ""
	echo "Restorisasi Berhasil"
	echo ""
	echo "Settingan IP Anda Sekarang : "
	ifconfig -a
	echo ""
	busybox sleep 5
	read -p "Press [Enter] To Continue"
	busybox sleep 1
	clear
	;;

	"x")
	clear
	echo ""
	echo "=========================="
	busybox sleep 1
	echo "http://cam-corp.com"
	busybox sleep 1
	echo "=========================="
	busybox sleep 1
	echo ""
	exit
	exit
	;;
	esac
done
