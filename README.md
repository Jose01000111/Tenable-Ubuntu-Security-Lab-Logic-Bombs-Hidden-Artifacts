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

### 4.1 🔧 Remediating SMB Signing Not Required (Plugin ID: 57608)
**Screenshot placeholder:** ![smb-signing-fix](#)

**📝 NOTES**
> #### 🔵 Mandatory SMB signing prevents man-in-the-middle attacks by enforcing message integrity and authentication.
> #### 🔵 The fix adds "server signing = mandatory" to Samba's global configuration and restarts the service.
> #### 🔵 Tenable rescans confirm that unsigned SMB connections are no longer allowed.

---

### 4.2 🔧 Remediating Python Vulnerabilities (Plugin ID: 235360 — USN-7488-1)
**Screenshot placeholder:** ![python-update-fix](#)

**📝 NOTES**
> #### 🔵 Vulnerabilities affect Python packages across multiple Ubuntu LTS releases.
> #### 🔵 Running apt update and upgrade patches the vulnerable packages and their dependencies.
> #### 🔵 Post-remediation Tenable scans verify the issues are fully resolved.

---

### 4.3 🔧 Remediating Python 2.7 Vulnerabilities (Plugin ID: 214323 — USN-7212-1)
**Screenshot placeholder:** ![python2-removal-fix](#)

**📝 NOTES**
> #### 🔵 Python 2.7 is end-of-life and carries unpatchable security risks.
> #### 🔵 Complete removal of python2 packages eliminates the vulnerable interpreter.
> #### 🔵 Tenable rescans no longer detect Python 2.7-related vulnerabilities.

---

### 4.4 🔧 Remediating ICMP Timestamp Request Remote Date Disclosure (Plugin ID: 10114)
**Screenshot placeholder:** ![icmp-block-fix](#)

**📝 NOTES**
> #### 🔵 ICMP timestamp responses can leak system uptime, aiding attacker reconnaissance.
> #### 🔵 Iptables rules drop timestamp requests (type 13) and replies (type 14), with persistence across reboots.
> #### 🔵 Tenable information-gathering checks confirm the host no longer responds to these queries.

# 🛡️ Azure VM Remediation Validation

## STEP 1 — SMB Signing
![SMB Signing Validation](link-to-screenshot)

## STEP 2 — Python Packages Updated
![Python Packages Validation](link-to-screenshot)

## STEP 3 — Python 2.7 Removed
![Python 2.7 Removal Validation](link-to-screenshot)

## STEP 4 — ICMP Timestamp Requests Blocked
![ICMP Block Validation](link-to-screenshot)

---

## 🏴‍☠️ PHASE 7 — I Verify the Final Clean Scan
Screenshot placeholder: ![finalscan](#)

### 📝 NOTES
> #### 🔵 The final scan proves validated remediation across the entire host.
> #### 🔵 Confirms: logic bomb removed, hidden files removed, unauthorized users removed, permissions corrected, OS vulnerabilities patched.
> #### 🔵 Comparing authenticated vs unauthenticated results demonstrates the importance of full-credential scanning.

