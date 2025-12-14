# 🔍 Tenable Ubuntu Security Lab: Logic Bombs & Hidden Artifacts
> ### A custom vulnerability investigation by **SentinelCore Security Operations**, led by **Jose G.**, simulating the discovery of buried artifacts, malicious behaviors, and misconfigurations inside an inherited Ubuntu system — validated through Tenable authenticated vs. unauthenticated scanning.*
> 
---

# 🌐 Mission Brief: Ubuntu Artifact Investigation 
> ### You’ve inherited an undocumented Ubuntu server suspected of past compromise ☠️ and your goal is to analyze it **offensively and defensively**, uncover buried artifacts, and validate all findings through Tenable scanning — under the procedures executed by **SentinelCore Security Operations** and **Jose G.**


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
> #### 🔵 I begin with an **unauthenticated Tenable scan** to establish a baseline of external visibility.
> #### 🔵 This scan identifies exposed ports, service banners, and surface-level vulnerabilities only.
> #### 🔵 I then configure and run an **authenticated scan** to inspect internal system state.
> #### 🔵 Authenticated scanning reveals users, permissions, installed packages, configurations, and running services.
> #### 🔵 Authenticated scans consistently uncover **3–10× more vulnerabilities** than unauthenticated scans.
> #### 🔵 Differences in scan duration highlight the impact of deeper enumeration on performance and completeness.

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

## 🏴‍☠️ PHASE 6 — I Solve the Issues

### 🔧 Fixing the Logic Bomb
Screenshot placeholder: ![fixlogicbomb](#)

### 📝 NOTES
> #### 🔵 Full removal requires tracking every persistence point, not just deleting output files.
> #### 🔵 Cleaning .bashrc reinforces the importance of user-environment security.
> #### 🔵 Tenable validation verifies remediation, proving the logic bomb no longer triggers or creates artifacts.

### 🔧 Fixing the Hidden File
Screenshot placeholder: ![fixhidden](#)

### 📝 NOTES
> #### 🔵 Removing a sensitive file must include permission audits to ensure no insecure paths remain.
> #### 🔵 Authenticated scans confirm that misconfigurations are resolved, not just manually hidden.
> #### 🔵 Artifact cleanup teaches investigative behavior, ensuring similar files aren’t elsewhere.

---

### 🔧 Fixing the Privileged User
Screenshot placeholder: ![fixuser](#)

### 📝 NOTES
> #### 🔵 Removing unauthorized accounts is a core vulnerability-management task.
> #### 🔵 Eliminating passwordless sudo ensures the privilege escalation chain is broken.
> #### 🔵 Deleting SSH keys closes persistence channels, restoring proper access controls.
> #### 🔵 Tenable detects and validates account-level fixes via audit plugins.

---

### 🔧 Fixing OS Vulnerabilities
Screenshot placeholder: ![fixos](#)

### 📝 NOTES
> #### 🔵 Outdated packages are the most common enterprise vulnerability source.
> #### 🔵 Kernel upgrades eliminate dozens of CVEs at once, improving baseline host security.
> #### 🔵 Patching teaches full lifecycle remediation, not just artifact removal.
> #### 🔵 Re-running Tenable confirms CVE reduction and validated repair.

---

## 🏴‍☠️ PHASE 7 — I Verify the Final Clean Scan
Screenshot placeholder: ![finalscan](#)

### 📝 NOTES
> #### 🔵 The final scan proves validated remediation across the entire host.
> #### 🔵 Confirms: logic bomb removed, hidden files removed, unauthorized users removed, permissions corrected, OS vulnerabilities patched.
> #### 🔵 Comparing authenticated vs unauthenticated results demonstrates the importance of full-credential scanning.

