# 🔍 Tenable Ubuntu Security Lab: Logic Bombs & Hidden Artifacts
> ### A custom vulnerability investigation by **SentinelCore Security Operations**, led by **Jose G.**, simulating the discovery of buried artifacts, malicious behaviors, and misconfigurations inside an inherited Ubuntu system — validated through Tenable authenticated vs. unauthenticated scanning.*

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
## 📚 Table of Contents
- [Tenable Ubuntu Security Lab: Logic Bombs & Hidden Artifacts](#tenable-ubuntu-security-lab-logic-bombs--hidden-artifacts)
- [Mission Brief: Ubuntu Artifact Investigation](#mission-brief-ubuntu-artifact-investigation)
- [Offensive‑Defensive Analysis vs Intentional Weaknesses](#offensive-defensive-analysis-vs-intentional-weaknesses)
- [PHASE 0 — I Was Alerted to Unusual Behavior](#phase-0--i-was-alerted-to-unusual-behavior)
- [PHASE 1 — I Build the Vulnerable Image (Azure)](#phase-1--i-build-the-vulnerable-image-azure)
- [PHASE 2 — I Discover the Logic Bomb File Replicator](#phase-2--i-discover-the-logic-bomb-file-replicator)
- [PHASE 3 — I Find the Hidden Mystery File](#phase-3--i-find-the-hidden-mystery-file)
- [PHASE 4 — I Investigate the Mystery Privileged User](#phase-4--i-investigate-the-mystery-privileged-user)
- [PHASE 5 — I Configure the Tenable Scans](#phase-5--i-configure-the-tenable-scans)
- [PHASE 6 — I Solve the Issues](#phase-6--i-solve-the-issues)
- [PHASE 7 — I Verify the Final Clean Scan](#phase-7--i-verify-the-final-clean-scan)


### 📝 NOTES
> #### 🔵 Every vulnerability workflow begins with scope and expectations.
> #### 🔵 Baseline checks teach what “normal” should look like so deviations stand out during scanning.
> #### 🔵 Connectivity tests (ping, SSH) validate readiness for both authenticated and unauthenticated scanning.

---

## 🏴‍☠️ PHASE 1 — I Build the Vulnerable Image (Azure)
## [📄Vulnerable VM Build](https://github.com/Jose01000111/Tenable-Ubuntu-Security-Lab-Logic-Bombs-Hidden-Artifacts/blob/main/build_vulnerabilities.sh)
<img width="647" height="492" alt="ajtSCUq" src="https://github.com/user-attachments/assets/f032fece-f43e-4e14-b523-326073f2ab3a" />

### 📝 NOTES
> #### 🔵 A clean VM baseline ensures all later findings are intentional and traceable.
> #### 🔵 Open ports shape the exposed attack surface and influence unauthenticated scan results.
> #### 🔵 System identity (OS version, kernel, packages) determines which CVEs Tenable will detect.

---

## 🏴‍☠️ PHASE 2 — I Discover the Logic Bomb File Replicator
Screenshot placeholder: ![phase2](#)

### 📝 NOTES
> #### 🔵 Logic bombs demonstrate persistence tied to user behavior, such as reading a file.
> #### 🔵 .bashrc modification is a real attack technique because it guarantees execution when a user opens a shell.
> #### 🔵 Replica files in /tmp simulate noisy attacker activity that authenticated Tenable scans can detect.
> #### 🔵 Tenable plugins identify abnormal replication behavior through system auditing and file‑integrity checks.

---

## 🏴‍☠️ PHASE 3 — I Find the Hidden Mystery File
Screenshot placeholder: ![phase3](#)

### 📝 NOTES
> #### 🔵 Hidden artifacts teach file discovery skills that go beyond simple ls usage.
> #### 🔵 Weak world-writable permissions illustrate misconfiguration-based risk, flagged by Tenable under insecure file permissions.
> #### 🔵 Sensitive paths under /etc model real-world disclosure risks where secrets and credentials are often leaked.
> #### 🔵 Authenticated scans reveal hidden artifacts that unauthenticated scans cannot detect.

---

## 🏴‍☠️ PHASE 4 — I Investigate the Mystery Privileged User
Screenshot placeholder: ![phase4](#)

### 📝 NOTES
> #### 🔵 Unauthorized accounts are one of the highest-impact security gaps in real environments.
> #### 🔵 Passwordless sudo represents a full privilege escalation path, immediately flagged by Tenable’s audit checks.
> #### 🔵 SSH key persistence models stealthy long-term access, bypassing password and MFA policies.
> #### 🔵 Reviewing passwd, shadow, and sudoers teaches core Linux account-hygiene skills.

---

## 🏴‍☠️ PHASE 5 — I Configure the Tenable Scans
Screenshot placeholder: ![phase5](#)

### 📝 NOTES
> #### 🔵 Unauthenticated scanning provides only external visibility (open ports, banners, surface CVEs).
> #### 🔵 Authenticated scanning exposes the full system: users, permissions, installed packages, configs, running services.
> #### 🔵 Authenticated scans consistently find 3–10× more vulnerabilities because they inspect internal state.
> #### 🔵 Scan duration differences teach how deep enumeration affects performance and completeness.

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

