# 🔎 SOC Investigation — Azuki Import/Export  
### Microsoft Defender for Endpoint + Microsoft Sentinel (KQL)

---

## 🧠 Overview

This repository documents a full attack lifecycle reconstruction conducted in a live Azure SOC lab environment using:

- Microsoft Defender for Endpoint (Advanced Hunting)
- Microsoft Sentinel (SIEM)
- KQL (Kusto Query Language)
- Structured SOC investigation methodology
- MITRE ATT&CK framework alignment

The investigation reconstructed a multi-stage intrusion from initial access through lateral movement and persistence.

This project demonstrates practical SIEM engineering, threat hunting, detection logic, and attack chain analysis.

---

## 🎯 Incident Summary

**Target System:** AZUKI-SL (IT Admin Workstation)  
**Initial Access Vector:** RDP (RemoteInteractive Logon)  
**Compromised Account:** kenji.sato  
**External IP:** 88.97.178.12  

The attacker successfully:

- Gained RDP access
- Conducted network discovery (arp -a)
- Created hidden staging directory
- Modified Windows Defender exclusions
- Downloaded malware via certutil.exe (LOLBIN)
- Established scheduled task persistence
- Performed LSASS credential dumping
- Archived data (export-data.zip)
- Exfiltrated data via Discord (HTTPS)
- Cleared Security logs
- Created backdoor admin account
- Attempted lateral movement

Full lifecycle confirmed through enterprise telemetry.

---

## 🕒 Attack Timeline

| Phase | Activity |
|-------|----------|
| Initial Access | RDP from 88.97.178.12 |
| Discovery | ARP network enumeration |
| Defense Evasion | Hidden folder + Defender exclusions |
| Execution | certutil.exe download of svchost.exe |
| Persistence | Scheduled task "Windows Update Check" |
| Credential Access | LSASS memory dump via mm.exe |
| Collection | export-data.zip archive created |
| Exfiltration | Discord over HTTPS |
| Anti-Forensics | wevtutil.exe cleared Security logs |
| Lateral Movement | mstsc.exe to 10.1.0.188 |

See `/docs/timeline.md` for full breakdown.

---

## 🧬 MITRE ATT&CK Mapping

```mermaid
flowchart LR
A[Initial Access<br>T1021.001 RDP] --> B[Discovery<br>T1046 Network Recon]
B --> C[Defense Evasion<br>T1562 Modify Defender]
C --> D[Execution<br>T1105 Ingress Tool Transfer]
D --> E[Persistence<br>T1053 Scheduled Task]
E --> F[Credential Access<br>T1003 LSASS Dump]
F --> G[Collection<br>T1560 Archive Data]
G --> H[Exfiltration<br>T1567 Web Service]
H --> I[Anti-Forensics<br>T1070 Clear Logs]
I --> J[Lateral Movement<br>T1021 Remote Services]
'''
---

## 🔍 Detection Engineering Highlights

### 🧾 KQL Hunting Queries Used

The investigation relied on structured KQL hunts across both endpoint and SIEM telemetry:

- **DeviceLogonEvents** – RDP authentication analysis and compromised account identification  
- **DeviceProcessEvents** – LOLBin abuse, scheduled task creation, PowerShell execution  
- **DeviceRegistryEvents** – Windows Defender exclusion tampering detection  
- **DeviceNetworkEvents** – C2 traffic and exfiltration analysis  
- **SigninLogs (Sentinel)** – Identity anomaly validation  
- **SecurityEvent** – RDP logon and authentication pattern analysis  

Reusable queries are available in the `/queries/` directory.

---

## ⚙️ Key Technical Findings

### 🛡 Defender Tampering

The attacker modified Windows Defender exclusion registry keys to bypass detection and excluded the local Temp directory from scanning.  

This allowed malicious payloads to execute without AV inspection.

---

### 🧨 LOLBin Abuse

`certutil.exe` was used to download a malicious payload from an external host.

This demonstrates Living-Off-the-Land Binary (LOLBIN) abuse to evade traditional detection mechanisms.

---

### ♻ Persistence Mechanism

A scheduled task was created:



---

## 🧠 Skills Demonstrated

- Threat Hunting (Microsoft Defender for Endpoint + Sentinel)
- KQL Query Development
- Attack Lifecycle Reconstruction
- Windows Internals & Process Tree Analysis
- Persistence & Credential Theft Detection
- MITRE ATT&CK Mapping
- IOC Extraction & Documentation
- Log Tampering Detection
- Detection Engineering Workflow

---

## 🏆 Professional Context

This investigation was conducted in a live Azure SOC environment using enterprise telemetry.

All findings were documented using structured SOC methodology and aligned to MITRE ATT&CK.

---

## 🚀 Planned Enhancements

- Convert hunts into Sentinel Analytics Rules
- Build automated detection dashboards
- Add incident response playbook
- Add detection coverage matrix
- Add IOC export automation
