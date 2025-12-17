#!/bin/bash
# ============================================================
# Vulnerable Azure VM Remediation Script
# Author: Jose Guerrero (remediations provided by Grok)
# Purpose: Remediate the vulnerabilities identified in the Tenable scan for the lab VM
# Usage Instructions Included Below
# ============================================================
# ============================================================
# HOW TO USE THIS SCRIPT (IMPORTANT)
# ============================================================
# 1. SSH into the VM:
# ssh azureuser@YOUR_PUBLIC_IP
#
# 2. Upload this script to the VM:
# nano remediate_vulnerabilities.sh
# (Paste this entire file, save with CTRL+O, exit with CTRL+X)
#
# 3. Make it executable:
# chmod +x remediate_vulnerabilities.sh
#
# 4. RUN IT:
# sudo ./remediate_vulnerabilities.sh
#
# 5. After completion, the VM will have:
# - SMB signing required
# - Python vulnerabilities patched or removed
# - ICMP timestamp requests blocked
#
# 6. Rescan with Tenable to verify fixes
# ============================================================
echo "=== Starting vulnerability remediation on Azure VM... ==="
echo
# ------------------------------------------------------------
# 1. Remediate SMB Signing not required (Plugin ID 57608)
# ------------------------------------------------------------
echo "[1/4] Enabling SMB signing..."
if ! grep -q "server signing = mandatory" /etc/samba/smb.conf; then
    sed -i '/^\[global\]/a server signing = mandatory' /etc/samba/smb.conf || echo -e "\n[global]\nserver signing = mandatory" >> /etc/samba/smb.conf
fi
systemctl restart smbd
echo "SMB signing now required."
echo
# ------------------------------------------------------------
# 2. Remediate Python vulnerabilities (USN-7488-1, Plugin ID 235360)
# ------------------------------------------------------------
echo "[2/4] Updating Python packages..."
apt update -y
apt upgrade -y
echo "Python packages updated to address vulnerabilities."
echo
# ------------------------------------------------------------
# 3. Remediate Python 2.7 vulnerabilities (USN-7212-1, Plugin ID 214323)
# ------------------------------------------------------------
echo "[3/4] Removing outdated Python 2.7..."
apt remove --purge python2 python2.7 -y
apt autoremove -y
echo "Python 2.7 removed to eliminate vulnerabilities."
echo
# ------------------------------------------------------------
# 4. Remediate ICMP Timestamp Request Remote Date Disclosure (Plugin ID 10114)
# ------------------------------------------------------------
echo "[4/4] Blocking ICMP timestamp requests..."
apt install netfilter-persistent -y
iptables -A INPUT -p icmp --icmp-type timestamp-request -j DROP
iptables -A OUTPUT -p icmp --icmp-type timestamp-reply -j DROP
netfilter-persistent save
echo "ICMP timestamp responses blocked."
echo
# ------------------------------------------------------------
echo "============================================================"
echo " ALL VULNERABILITIES REMEDIATED SUCCESSFULLY "
echo "============================================================"
echo "Your VM is now more secure."
echo
echo "To verify SMB signing:"
echo " grep 'server signing' /etc/samba/smb.conf"
echo
echo "To verify Python removal:"
echo " which python2"
echo
echo "To verify ICMP block (from another host):"
echo " hping3 -C 13 -c 1 YOUR_VM_IP (should get no response)"
echo
echo "Script complete."
echo "============================================================"
