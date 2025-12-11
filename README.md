# 🔍 Tenable Ubuntu Security Lab: Logic Bombs & Hidden Artifacts
*A custom vulnerability investigation simulating the discovery of buried artifacts, malicious behaviors, and misconfigurations inside an inherited Ubuntu system — validated through Tenable authenticated vs. unauthenticated scanning.*

---

# 🌐 Scenario Overview  
You’ve inherited an undocumented Ubuntu server suspected of past compromise.  
The goal is to analyze it **offensively and defensively**, detect buried artifacts, and validate everything through Tenable scanning.

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

# 🟦 PHASE 0 — Ad Hoc Vulnerability Testing Agreement
Screenshot placeholder: `![phase0](#)`

📝 NOTES
- **Every vulnerability job begins with scope.** Even in a home lab, confirming isolation prevents accidental scanning of unintended assets.
- **Baseline checks teach you what “normal” should look like.** Without knowing normal, you can’t identify abnormal.
- **Connectivity tests (ping, SSH) are standard intake tasks.** They confirm you're even able to scan or access the host.

---

# 🟦 PHASE 1 — Build the Vulnerable Image (Azure)
Screenshot placeholder: `![phase1](#)`

📝 NOTES
- **Documenting initial system state is key** because Tenable uses OS fingerprinting to determine what CVEs apply.
- **Identifying open ports teaches exposure risk.** Port 22 is expected — but anything extra would indicate misconfiguration or compromise.
- **A clean baseline ensures every later artifact is intentional** and mapped to the exercise.

---

# 🟦 PHASE 2 — Vulnerability 1: Logic Bomb File Replicator
Screenshot placeholder: `![phase2](#)`

📝 NOTES
- **Logic bombs are persistence mechanisms disguised as normal behavior.** This teaches how attackers hide code execution behind shell activity.
- **Modifying `.bashrc` shows how easy it is to hijack a user’s environment.** Tenable detects abnormal file-creation patterns through plugin families like *Malware*, *Behavioral*, and *System Audit*.
- **Replica files in `/tmp` teach you to check volatile directories.** Temp locations are common hiding spots because they’re noisy and often ignored.

---

# 🟦 PHASE 3 — Vulnerability 2: Hidden Mystery File
Screenshot placeholder: `![phase3](#)`

📝 NOTES
- **Hidden files are a classic discovery skill.** Attackers rely on “security through obscurity.”
- **World-writable permissions (777) demonstrate misconfiguration attacks.** These are flagged in Tenable as *insecure permissions* or *misconfigured sensitive files*.
- **Finding secrets in system paths teaches bad key-management practices.** Even empty placeholder files teach the workflow of locating and classifying sensitive artifacts.

---

# 🟦 PHASE 4 — Vulnerability 3: Mystery Privileged User
Screenshot placeholder: `![phase4](#)`

📝 NOTES
- **Unauthorized users are one of the most common real-world compromises**, especially via leftover test accounts.
- **Passwordless sudo demonstrates a privilege escalation chain.** Tenable detects this through plugins checking sudo configuration.
- **SSH key persistence is extremely realistic.** Attackers prefer SSH keys because they bypass password policies and MFA.

---

# 🟦 PHASE 5 — Create the Tenable Scans
Screenshot placeholder: `![phase5](#)`

📝 NOTES
- **Unauthenticated vs authenticated scanning is the #1 most important lesson in vulnerability management.**
  - *Unauthenticated*: Only sees the outside (ports + banners).  
  - *Authenticated*: Reads configs, users, file permissions, installed packages, and running processes.
- **Authenticated scans detect 3–10x more findings** in every real environment.
- **Comparing durations teaches scanner behavior.** Authenticated scans take longer because they enumerate local packages and configuration files.

---

# 🟦 PHASE 6 — Solve the Issues

## 🔧 Fixing the Logic Bomb
Screenshot placeholder: `![fixlogicbomb](#)`

📝 NOTES
- **Removing persistence requires reversing every modification made.** Attackers leave multiple breadcrumbs.
- **Cleaning .bashrc teaches shell hygiene.** Most beginners underestimate how often .bashrc is abused.
- **Post-fix Tenable scans validate real remediation work**, which is the core of vulnerability management.

---

## 🔧 Fixing the Hidden File
Screenshot placeholder: `![fixhidden](#)`

📝 NOTES
- **Deleting sensitive files is only half the fix.** You must also ensure no similar paths exist.
- **Tenable verifies misconfiguration fixes by rescanning permissions.**
- **This teaches investigative mindset:** Don’t assume one hidden file means there's only one.

---

## 🔧 Fixing the Privileged User
Screenshot placeholder: `![fixuser](#)`

📝 NOTES
- **Unauthorized accounts are high-severity risks.** Tenable immediately flags passwordless sudo as a critical escalation vector.
- **Removing SSH keys teaches how to eliminate persistence pathways.**
- **Editing passwd/shadow teaches system hygiene and proper user lifecycle management.**

---

## 🔧 Fixing OS Vulnerabilities
Screenshot placeholder: `![fixos](#)`

📝 NOTES
- **Outdated packages are the most common corporate vulnerability source.** CVEs often originate from missing updates.
- **Kernel upgrades are a major security milestone**, as dozens of CVEs are kernel-level.
- **Students learn that remediation isn’t just deleting artifacts — it includes system patching.**

---

# 🟦 PHASE 7 — Final Clean Scan
Screenshot placeholder: `![finalscan](#)`

📝 NOTES
- **The purpose of vulnerability management is measurable improvement.**
- Tenable confirms:
  - No logic bombs  
  - No hidden files  
  - No rogue users  
  - No misconfigurations  
  - No high/critical CVEs  
- **This teaches the entire VM lifecycle: detect → analyze → fix → verify.**


---

