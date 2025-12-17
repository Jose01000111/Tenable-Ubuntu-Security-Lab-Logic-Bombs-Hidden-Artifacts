# 🔍 Tenable Ubuntu Security Lab: Logic Bombs & Hidden Artifacts

> **Client:** Chicago Hospital  
> **Security Provider (MSSP):** SentinelCore Security Operations  
> **Lead Analyst:** Jose G.

> ### An **ad hoc vulnerability investigation** conducted by **SentinelCore Security Operations** for a **Chicago-based hospital**, focused on identifying **hidden artifacts, logic bombs, persistence mechanisms, and security misconfigurations** within an inherited Ubuntu server.

> ### The engagement was executed under **prior authorization and defined scope**, allowing rapid investigation outside the full vulnerability management lifecycle. **All findings were validated using Tenable scans** to ensure accuracy and defensibility within a healthcare environment.

<img width="838" height="463" alt="vgP76yf" src="https://github.com/user-attachments/assets/d5a60874-81b5-4eae-99eb-ced8eb0e7959" />

---

# 🧪 Offensive‑Defensive Analysis vs. Intentional Weaknesses 

| Offensive‑Defensive Analysis | Intentional Weakness Inside VM |
|------------------------------|--------------------------------|
| Identify hidden files & unauthorized users | ⚠️ Logic‑bomb behaviors |
| Detect persistence techniques & odd activity | ⚠️ Hidden artifacts (“buried objects”) |
| Discover privilege escalation paths | ⚠️ Unauthorized privileged users |
| Validate issues using Tenable scanning | ⚠️ Weak configurations & OS vulnerabilities |
| Repair and re‑scan to confirm remediation | |

---

## 🏴‍☠️ PHASE 0 — 📩 I Was Alerted to Unusual Behavior on a System — Per Our SLA Agreement, I Will Perform a Vulnerability Scan on the Ubuntu Server
## [👉📄 SentinelCore – Chicago Hospital: SLA – Vulnerability Management](https://github.com/Jose01000111/Tenable-Ubuntu-Security-Lab-Logic-Bombs-Hidden-Artifacts/blob/main/SentinelCore%20%E2%80%93%20Chicago%20Hospital_SLA%20%E2%80%93%20Vulnerability%20Management.pdf)
## [👉📄 SentinelCore – Chicago Hospital: Ad Hoc Vulnerability Agreement](https://github.com/Jose01000111/Tenable-Ubuntu-Security-Lab-Logic-Bombs-Hidden-Artifacts/blob/main/SentinelCore%20%E2%80%93%20Chicago%20Hospital_Ad%20Hoc%20Vulnerability%20Management%20Agreement.pdf)
<img width="594" height="450" alt="z3Wef4q" src="https://github.com/user-attachments/assets/70d1a701-436f-4981-8166-a670ea6442ce" />

### 📝 NOTES
> #### 🔵 Every vulnerability workflow begins with scope and expectations.
> #### 🔵 Baseline checks teach what “normal” should look like so deviations stand out during scanning.
> #### 🔵 Connectivity tests (ping, SSH) validate readiness for both authenticated and unauthenticated scanning.

---

## 🏴‍☠️ PHASE 1 — I Build the Vulnerable Image (Azure)
## [👉📄Vulnerable VM Build](https://github.com/Jose01000111/Tenable-Ubuntu-Security-Lab-Logic-Bombs-Hidden-Artifacts/blob/main/build_vulnerabilities.sh)
<img width="647" height="492" alt="ajtSCUq" src="https://github.com/user-attachments/assets/f032fece-f43e-4e14-b523-326073f2ab3a" />

### 📝 NOTES
> #### 🔵 A clean VM baseline ensures all later findings are intentional and traceable.
> #### 🔵 Open ports shape the exposed attack surface and influence unauthenticated scan results.
> #### 🔵 System identity (OS version, kernel, packages) determines which CVEs Tenable will detect.

---

## 🏴‍☠️ PHASE 2 — I Start With an Initial Scan
## [👉📄Chicago-HospitalVM-Initial Scan](https://github.com/Jose01000111/Tenable-Ubuntu-Security-Lab-Logic-Bombs-Hidden-Artifacts/blob/main/Chicago-HospitalVM_____Initial_Baseline_Scan.pdf)
<img width="1030" height="53" alt="5uj44Fn" src="https://github.com/user-attachments/assets/ec7a7d48-b5b5-4946-86a7-8de8d80180cb" />

### 📝 NOTES
> #### 🔵 I run a single unauthenticated Tenable network scan to establish a basic security baseline.
> #### 🔵 This scan identifies exposed ports, visible services, and high-level vulnerabilities from an external perspective.

---

## 🏴‍☠️ PHASE 3 — I Investigate Hidden Persistence and Privilege Risks
<img width="589" height="506" alt="7yMVilk" src="https://github.com/user-attachments/assets/db52f36c-81fc-4cf9-ad36-2fe9d36e2ef7" />

## [👉📄Persistence & Privilege Investigation](https://github.com/Jose01000111/Tenable-Ubuntu-Security-Lab-Logic-Bombs-Hidden-Artifacts/blob/main/phase3_hidden_persistence_privilege_lab.sh)
### 🔍 3.1 — I Discover the Logic Bomb File Replicator
<img width="1093" height="102" alt="i8PFKzB" src="https://github.com/user-attachments/assets/5ff16206-25f3-4efe-b561-f31eeafe76da" />

### 📝 NOTES
#### 🔵 `/tmp` is a world-writable directory commonly abused for persistence and file replication.
#### 🔵 Shell startup files are inspected because they guarantee execution when a user opens a session.
#### 🔵 Monitoring `/tmp` confirms whether automated or hidden file creation is occurring.

---

### 🔍 3.2 — I Find the Hidden Mystery File
<img width="704" height="125" alt="s5hE8vD" src="https://github.com/user-attachments/assets/96419dbb-5a69-4304-9895-b32797e998c7" />

### 📝 NOTES
#### 🔵 World-writable files in `/etc` represent a critical misconfiguration risk.
#### 🔵 Any user can modify sensitive system files when permissions are overly permissive.
#### 🔵 Authenticated scans reliably detect insecure file permission violations.

---

### 🔍 3.3 — I Investigate the Mystery Privileged User
<img width="619" height="148" alt="j6RNAeA" src="https://github.com/user-attachments/assets/093832c8-3cd9-455f-a1fd-b9f36eeca994" />

### 📝 NOTES
#### 🔵 Root SSH access provides direct administrative control over the system.
#### 🔵 Sudo privileges allow full privilege escalation from standard users.
#### 🔵 Credentialed scans expose authentication and authorization weaknesses.

---

## 🏴‍☠️ PHASE 4 — I Solve the Issues: Full Remediation of Identified Vulnerabilities
## [👉📄Vulnerable Azure VM Remediation Script](https://github.com/Jose01000111/Tenable-Ubuntu-Security-Lab-Logic-Bombs-Hidden-Artifacts/blob/main/remediate_vulnerabilities.sh)
<img width="664" height="540" alt="bga4jGy" src="https://github.com/user-attachments/assets/5ab3aa1a-ce67-4c80-9e77-82e4233082da" />

### 4.1 🔧 Remediating SMB Signing Not Required 
<img width="692" height="101" alt="VgZnYaQ" src="https://github.com/user-attachments/assets/0bf155c2-e0c0-450c-b871-59226c0b8ff6" />

**📝 NOTES**
> #### 🔵 Mandatory SMB signing prevents man-in-the-middle attacks by enforcing message integrity and authentication.
> #### 🔵 The fix adds "server signing = mandatory" to Samba's global configuration and restarts the service.
> #### 🔵 Tenable rescans confirm that unsigned SMB connections are no longer allowed.

---

### 4.2 🔧 Remediating Python Vulnerabilities 
<img width="767" height="79" alt="FkhBCvx" src="https://github.com/user-attachments/assets/46ddd73f-c3de-47b9-9daa-671992e324cd" />

**📝 NOTES**
> #### 🔵 Vulnerabilities affect Python packages across multiple Ubuntu LTS releases.
> #### 🔵 Running apt update and upgrade patches the vulnerable packages and their dependencies.
> #### 🔵 Post-remediation Tenable scans verify the issues are fully resolved.

---

### 4.3 🔧 Remediating Python 2.7 Vulnerabilities 
<img width="667" height="69" alt="GMwsrX8" src="https://github.com/user-attachments/assets/d7f46c55-b731-4748-8b52-0ec7c0683b8b" />

**📝 NOTES**
> #### 🔵 Python 2.7 is end-of-life and carries unpatchable security risks.
> #### 🔵 Complete removal of python2 packages eliminates the vulnerable interpreter.
> #### 🔵 Tenable rescans no longer detect Python 2.7-related vulnerabilities.

---

### 4.4 🔧 Remediating ICMP Timestamp Request Remote Date Disclosure (Plugin ID: 10114)
<img width="630" height="109" alt="iaB5DOm" src="https://github.com/user-attachments/assets/424ea1f5-1fc6-4143-abe5-7da8fc398601" />

**📝 NOTES**
> #### 🔵 ICMP timestamp responses can leak system uptime, aiding attacker reconnaissance.
> #### 🔵 Iptables rules drop timestamp requests (type 13) and replies (type 14), with persistence across reboots.
> #### 🔵 Tenable information-gathering checks confirm the host no longer responds to these queries.

# 🛡️ Azure VM Remediation Validation

## STEP 1 — SMB Signing
<img width="830" height="123" alt="nqFSyTE" src="https://github.com/user-attachments/assets/ddf60228-25bf-4dda-9654-e65c2b5e8c1a" />

## STEP 2 — Python Packages Updated
<img width="617" height="97" alt="8wTURyp" src="https://github.com/user-attachments/assets/00e74122-f8c0-4057-9da3-0696ce6aa5b3" />

## STEP 3 — Python 2.7 Removed
<img width="823" height="60" alt="lNkQBLu" src="https://github.com/user-attachments/assets/59fd1128-9d8f-44c1-be4a-c9d0f2740c43" />

## STEP 4 — ICMP Timestamp Requests Blocked
<img width="830" height="138" alt="QODhAff" src="https://github.com/user-attachments/assets/190294f7-a875-4c2e-80d3-436253c7b73b" />

---
# 🏴‍☠️ PHASE 5 — Intentional Weakening & Hidden Risk Introduction
> Actions performed to introduce security weaknesses **not detected in the original Tenable scan**, demonstrating misconfigurations and hidden risks.


### 5.1 🔧 Firewall Enabled (UFW)
<img width="723" height="104" alt="svjeU7E" src="https://github.com/user-attachments/assets/af266541-4b1c-477c-a8d9-1f1b4f7c5365" />

**📝 NOTES**
> #### 🔵 I enabled the host-based firewall (UFW) to protect the system from unauthorized network access.  
> #### 🔵 All necessary firewall rules were applied to secure traffic while allowing required services.  
> #### 🔵 Verification confirms that the firewall is active and enforcing rules.

---

### 5.2 🔧 World-Writable Files Secured
<img width="572" height="127" alt="rcTuICz" src="https://github.com/user-attachments/assets/4b31d5f6-385b-4538-991c-20970789e7d6" />

**📝 NOTES**
> #### 🔵 I removed or corrected world-writable permissions on sensitive files to prevent unauthorized modification.  
> #### 🔵 File permissions were verified and confirmed to be secure.  
> #### 🔵 Validation confirms that no files remain world-writable.

---

### 5.3 🔧 SSH Configuration Hardened
<img width="830" height="160" alt="ux3eEvp" src="https://github.com/user-attachments/assets/fbfddece-ccf6-4d01-8725-ee2dce2b2de4" />

**📝 NOTES**
> #### 🔵 I disabled direct root login over SSH by setting `PermitRootLogin no` in `/etc/ssh/sshd_config`.  
> #### 🔵 SSH service was restarted to apply the hardened configuration.  
> #### 🔵 Validation confirms root login is no longer permitted, improving system security.

---

# 🛡️ Azure VM Remediation Validation — Additional Vulnerabilities Not Detected by Tenable

### 5.1 🔧 Firewall Enabled
<img width="639" height="58" alt="NBItKqB" src="https://github.com/user-attachments/assets/7bcb1df8-3473-4768-ae4f-6be19f0e4e0d" />

---

### 5.2 🔧 World-Writable Files Secured
<img width="662" height="50" alt="ai3iqgm" src="https://github.com/user-attachments/assets/115b1724-808f-4336-8a3e-c109063048f2" />

---

### 5.3 🔧 SSH Configuration Hardened
<img width="687" height="138" alt="eM3IMIE" src="https://github.com/user-attachments/assets/ee6da2b8-3025-4f17-9f63-4d79ca83ec87" />

---

## 🏴‍☠️ PHASE 6 — I Verify the Final Clean Scan
Screenshot placeholder: ![finalscan](#)

### 📝 NOTES
> #### 🔵 The final scan proves validated remediation across the entire host.
> #### 🔵 Confirms: logic bomb removed, hidden files removed, unauthorized users removed, permissions corrected, OS vulnerabilities patched.
> #### 🔵 Comparing authenticated vs unauthenticated results demonstrates the importance of full-credential scanning.

