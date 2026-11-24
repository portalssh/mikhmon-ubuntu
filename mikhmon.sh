#!/usr/bin/env bash
# ==========================================================
#  LAMP Stack Secure Installer (Modular)
#  Author: Mosudi I. O., imosudi
#  Version: 1.0
#  Date: 2024-06-15
# ==========================================================
# install.sh - Main installation script

# --- 1. Update Sistem dan Repositori PHP ---
sudo apt update && sudo apt upgrade -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update

# --- 2. Install Apache dan Ekstensi PHP ---
log "=========================================================="
log "  MIKHMON ARMBIAN SECURE INSTALLER - INITIALISATION"
log "=========================================================="

# --- Execute each installation phase ---
sudo apt install apache2 php7.4 php7.4-gd php7.4-curl php7.4-xml php7.4-mbstring php7.4-zip wget unzip -y

# --- Download dan Ekstrak Mikhmon ---
cd /var/www/html
sudo wget -O mikhmon.zip https://codeload.github.com/laksa19/mikhmonv3/zip/master
sudo unzip mikhmon.zip
sudo mv mikhmonv3-master mikhmon

# --- 4. Atur Hak Akses (Permission) Folder ---
sudo chown -R www-data:www-data /var/www/html/mikhmon
sudo chmod -R 755 /var/www/html/mikhmon

log "=========================================================="
log "✅ MIKHMON installation completed successfully!"
log "Log file: $LOG_FILE"
log "=========================================================="
