# Query Pack — Azuki Investigation (MDE + Sentinel)

This pack contains reusable hunting queries aligned to the investigation stages.

## MDE Advanced Hunting (Endpoint)
- `queries/mde/01_initial_access_rdp.kql`
- `queries/mde/02_suspicious_processes.kql`
- `queries/mde/03_persistence_registry_schtasks.kql`
- `queries/mde/04_data_staging_archives.kql`
- `queries/mde/05_exfiltration_network.kql`
- `queries/mde/06_user_account_compromise.kql`

## Sentinel / Log Analytics
- `queries/sentinel/01_signin_anomalies.kql`
- `queries/sentinel/02_impossible_travel.kql`
- `queries/sentinel/03_rdp_bruteforce.kql`
- `queries/sentinel/04_data_exfil_signals.kql`

> Replace placeholders like `azuki-sl` and time windows with your case values.