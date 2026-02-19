# MITRE ATT&CK Mapping

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