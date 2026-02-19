# SOC Investigation — Azuki Import/Export (MDE + Sentinel)

This repository contains a full SOC-style investigation report for the **Azuki Import/Export** incident scenario, conducted in a live Azure security lab using:

- **Microsoft Defender for Endpoint (MDE) Advanced Hunting**
- **Microsoft Sentinel / Log Analytics (KQL)**
- Structured SOC methodology: **Initial Access → Execution → Persistence → Credential Access → Discovery → Collection → Exfiltration**

> **Note on defensibility:** This repo is written as a professional report template populated from saved hunting queries, timestamps, and screenshots captured during the investigation. Sensitive identifiers are redacted.

---

## Incident Brief (Scenario)
**Situation:** Contract/pricing data appeared on underground forums after a competitor undercut pricing by exactly 3%.  
**Company:** Azuki Import/Export Trading Co. (23 employees; logistics Japan/SE Asia)  
**Compromised System(s):** `AZUKI-SL` (IT admin workstation)  
**Evidence Source:** Microsoft Defender for Endpoint logs + Sentinel

---

## What’s Included
- ✅ Full investigation report with timeline, findings, and recommendations
- ✅ MITRE ATT&CK technique mapping
- ✅ IOC table + containment checklist
- ✅ Re-usable query pack (MDE + Sentinel KQL)
- ✅ Screenshot placeholders to prove findings

---

## Key Artifacts
- **Full Report:** `docs/report.md`
- **Timeline:** `docs/timeline.md`
- **IOC Table:** `docs/iocs.md`
- **MITRE Mapping:** `docs/mitre-mapping.md`
- **Query Pack:** `docs/query-pack.md` and `queries/`

---

## How to Use This Repo (for your portfolio)
1. Open `docs/report.md`
2. Replace every `[FILL]` block with:
   - your saved query names,
   - timestamps,
   - 1–2 screenshots per stage,
   - and extracted IOCs
3. Commit screenshots into `assets/screenshots/` (redacted)

---

## Resume-ready bullets (copy/paste)
- Conducted SOC threat hunt in a live Azure lab using **Microsoft Defender for Endpoint Advanced Hunting** and **Microsoft Sentinel (KQL)**; reconstructed attack chain from initial access through exfiltration.
- Built and saved descriptive KQL hunts (authentication anomalies, suspicious process trees, persistence checks, staging/exfil indicators); documented timeline and IOCs in a professional incident report.
- Mapped observed behaviors to **MITRE ATT&CK** and produced containment + remediation recommendations aligned to enterprise SOC workflows.