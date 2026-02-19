# Attack Timeline – Azuki Import/Export

## Phase 1 – Initial Access
- External RDP connection from 88.97.178.12
- Account kenji.sato authenticated (RemoteInteractive)

## Phase 2 – Discovery
- Executed ARP.EXE -a
- Enumerated local network devices

## Phase 3 – Defense Evasion
- Created hidden directory C:\ProgramData\WindowsCache
- Modified Defender exclusion registry keys
- Excluded Temp folder from Defender scanning

## Phase 4 – Malware Deployment
- Used certutil.exe to download svchost.exe
- Malware staged in hidden cache directory

## Phase 5 – Persistence
- Created scheduled task “Windows Update Check”
- Configured to run on logon as SYSTEM

## Phase 6 – Credential Access
- Downloaded mm.exe
- Executed sekurlsa::logonpasswords
- Extracted LSASS credentials

## Phase 7 – Collection
- Created export-data.zip archive

## Phase 8 – Exfiltration
- Outbound HTTPS connection to 78.141.196.6
- Data uploaded to Discord service

## Phase 9 – Anti-Forensics
- Cleared Security event logs using wevtutil.exe

## Phase 10 – Persistence Hardening
- Created support admin account

## Phase 11 – Lateral Movement
- RDP attempt to 10.1.0.188 using mstsc.exe