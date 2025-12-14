## 🏴‍☠️ PHASE 3 — Hidden Persistence & Privilege Risks
## Analyst: Jose G.
## Purpose: Manually investigate persistence, file permissions, and privilege risks
## Environment: Vulnerable Ubuntu Azure VM (Credentialed Access)

############################################################
## 🔍 3.1 — Logic Bomb & File Replication Investigation
############################################################

# Check user shell startup file for hidden execution logic
cat ~/.bashrc

# Check system-wide shell startup file for persistence affecting all users
cat /etc/bash.bashrc

# Search the filesystem for shell scripts that could contain malicious logic
find / -type f -name "*.sh" 2>/dev/null

# Inspect /tmp for suspicious or unexpected files
# /tmp is world-writable and commonly abused by attackers
ls -la /tmp

# Monitor /tmp in real time to detect automated file creation or replication
watch -n 2 ls -la /tmp

# RESULT:
# No active logic bomb or file replication observed.
# /tmp contained only expected system-generated files.
# Location remains high-risk despite no active payload.

############################################################
## 🔍 3.2 — World-Writable Hidden File Investigation
############################################################

# Identify world-writable files across the system
find / -type f -perm -0002 2>/dev/null

# Inspect intentionally created vulnerable file
ls -l /etc/world_writable_test

# Review metadata to confirm permissions and ownership
stat /etc/world_writable_test

# RESULT:
# /etc/world_writable_test is world-writable (777).
# File exists in a sensitive system directory (/etc).
# Any local user could modify system-related data.
# This misconfiguration was intentionally introduced for detection.

############################################################
## 🔍 3.3 — Privilege & Authentication Investigation
############################################################

# Review all system and user accounts
cat /etc/passwd

# Inspect password and authentication controls (privileged)
sudo cat /etc/shadow

# Review sudo configuration for privilege escalation paths
sudo cat /etc/sudoers

# Check for additional sudo rules or dropped-in configs
ls -la /etc/sudoers.d/

# Verify SSH root login configuration
grep PermitRootLogin /etc/ssh/sshd_config

# Search for persistent SSH key-based access
find /home -name "authorized_keys" -type f 2>/dev/null

# RESULT:
# Root SSH login is explicitly enabled.
# This allows direct remote administrative access.
# Represents a critical authentication and privilege risk.
# Easily detected by authenticated vulnerability scans.

############################################################
## PHASE 3 SUMMARY
############################################################

# Manual investigation confirms:
# - High-risk persistence locations were inspected
# - Insecure file permissions were validated
# - Privilege escalation paths were identified
# Findings align with expected authenticated Tenable results.
