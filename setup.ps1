# ==========================================
# SOC Investigation Repo Scaffold Creator
# ==========================================

Write-Host "Creating SOC Investigation directory structure..."

# Base folders
$folders = @(
    "docs",
    "queries",
    "queries\mde",
    "queries\sentinel",
    "assets",
    "assets\screenshots"
)

foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder | Out-Null
        Write-Host "Created folder: $folder"
    } else {
        Write-Host "Folder already exists: $folder"
    }
}

# Files to create (excluding README.md)
$files = @(
    "docs\report.md",
    "docs\timeline.md",
    "docs\mitre-mapping.md",
    "docs\iocs.md",
    "docs\lessons-learned.md",
    "docs\query-pack.md",
    "assets\redaction-notes.md",
    "queries\mde\01_initial_access_rdp.kql",
    "queries\mde\02_suspicious_processes.kql",
    "queries\mde\03_persistence_registry_schtasks.kql",
    "queries\mde\04_data_staging_archives.kql",
    "queries\mde\05_exfiltration_network.kql",
    "queries\mde\06_user_account_compromise.kql",
    "queries\sentinel\01_signin_anomalies.kql",
    "queries\sentinel\02_impossible_travel.kql",
    "queries\sentinel\03_rdp_bruteforce.kql",
    "queries\sentinel\04_data_exfil_signals.kql"
)

foreach ($file in $files) {
    if (-not (Test-Path $file)) {
        New-Item -ItemType File -Path $file | Out-Null
        Write-Host "Created file: $file"
    } else {
        Write-Host "File already exists: $file"
    }
}

Write-Host ""
Write-Host "SOC Investigation scaffold complete."
Write-Host "You can now paste content into the created files."