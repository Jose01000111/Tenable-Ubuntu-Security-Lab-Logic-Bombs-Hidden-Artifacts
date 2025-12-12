#!/bin/bash
# ============================================================
#  Vulnerable Azure VM Build Script
#  Author: Jose Guerrero
#  Purpose: Build a SAFE but SCANNABLE vulnerable Linux server
#  Usage Instructions Included Below
# ============================================================

# ============================================================
# HOW TO USE THIS SCRIPT (IMPORTANT)
# ============================================================
# 1. Create an Ubuntu VM in Azure (22.04 or 20.04 recommended)
# 2. SSH into the VM:
#       ssh azureuser@YOUR_PUBLIC_IP
#
# 3. Upload this script to the VM:
#       nano build_vulnerabilities.sh
#       (Paste this entire file, save with CTRL+O, exit with CTRL+X)
#
# 4. Make it executable:
#       chmod +x build_vulnerabilities.sh
#
# 5. RUN IT:
#       sudo ./build_vulnerabilities.sh
#
# 6. After completion, the VM will contain:
#       - Weak SSH config
#       - Weak MySQL root credentials
#       - Outdated Python2
#       - Anonymous SMB share
#       - World-writable file
#       - Firewall disabled
#       - Apache + MySQL + SMB exposed to the internet
#
# 7. Now you can scan it with:
#       • Tenable
#       • Nessus
#       • OpenVAS
# ============================================================


echo "=== Starting vulnerable Azure VM build... ==="
echo

# ------------------------------------------------------------
# 1. Install Apache (Port 80)
# ------------------------------------------------------------
echo "[1/9] Installing Apache..."
apt update -y
apt install apache2 -y
systemctl enable --now apache2
echo "Apache installed."
echo

# ------------------------------------------------------------
# 2. Install MySQL (Port 3306)
# ------------------------------------------------------------
echo "[2/9] Installing MySQL..."
apt install mysql-server -y
systemctl enable --now mysql
echo "MySQL installed."
echo

# ------------------------------------------------------------
# 3. Install SMB (Samba) – Port 445
# ------------------------------------------------------------
echo "[3/9] Installing Samba..."
apt install samba -y
systemctl enable --now smbd
echo "Samba installed."
echo

# ------------------------------------------------------------
# 4. Disable Firewall (UFW)
# ------------------------------------------------------------
echo "[4/9] Disabling firewall..."
ufw disable
echo "Firewall disabled."
echo

# ------------------------------------------------------------
# 5. Install Outdated Python2
# ------------------------------------------------------------
echo "[5/9] Installing outdated Python2..."
apt install python2 -y
echo "Python2 installed."
echo

# ------------------------------------------------------------
# 6. Vulnerability: World-Writable Sensitive File
# ------------------------------------------------------------
echo "[6/9] Creating world-writable test file..."
echo "Sensitive data" > /etc/world_writable_test
chmod 777 /etc/world_writable_test
echo "World-writable file created: /etc/world_writable_test"
echo

# ------------------------------------------------------------
# 7. Vulnerability: Weak SSH Config (PermitRootLogin yes)
# ------------------------------------------------------------
echo "[7/9] Weakening SSH configuration..."
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
echo "PermitRootLogin yes" | tee -a /etc/ssh/sshd_config
systemctl restart ssh
echo "SSH is now weak: root login ENABLED."
echo

# ------------------------------------------------------------
# 8. Vulnerability: Weak MySQL Root Password
# ------------------------------------------------------------
echo "[8/9] Setting weak MySQL password..."
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Password123';"
echo "Weak MySQL credentials set: root / Password123"
echo

# ------------------------------------------------------------
# 9. Vulnerability: Open Anonymous SMB Share
# ------------------------------------------------------------
echo "[9/9] Creating open SMB share..."
mkdir -p /srv/open_share
chmod -R 777 /srv/open_share

cat <<EOF >> /etc/samba/smb.conf

[open_share]
path = /srv/open_share
browseable = yes
writable = yes
guest ok = yes

EOF

systemctl restart smbd
echo "Open SMB share created."
echo

# ------------------------------------------------------------
echo "============================================================"
echo " ALL VULNERABILITIES DEPLOYED SUCCESSFULLY "
echo "============================================================"
echo "Your VM is now ready for Tenable/Nessus scanning."
echo
echo "To verify SMB:"
echo "    smbclient -L localhost -N"
echo
echo "To verify SSH:"
echo "    grep PermitRootLogin /etc/ssh/sshd_config"
echo
echo "To verify MySQL login:"
echo "    mysql -u root -pPassword123 -e \"SELECT VERSION();\""
echo
echo "Script complete."
echo "============================================================"
