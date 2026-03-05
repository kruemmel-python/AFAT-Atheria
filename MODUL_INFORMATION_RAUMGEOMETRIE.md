# Modul: `atheria_spacetime_reconstruction.py` / `run_information_raumgeometrie.ps1`

Dieses Modul rekonstruiert eine Raumzeit-Projektion aus Audit-Informationen.

## Ausfuehrung in PowerShell (empfohlen ueber PS1-Wrapper)

Arbeitsordner:

```powershell
cd D:\Atheria-main\Atheria_Relase
```

Standardlauf mit JSON-Ausgabe:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\run_information_raumgeometrie.ps1 -ReportFile ..\daemon_runtime\atheria_daemon_audit.jsonl -JsonOut .\runtime_audit\spacetime_reconstruction.json
```

Mit Pretty-Output im Terminal:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\run_information_raumgeometrie.ps1 -ReportFile ..\daemon_runtime\atheria_daemon_audit.jsonl -Pretty
```

Direktlauf ohne Wrapper:

```powershell
python .\atheria_spacetime_reconstruction.py --report-file ..\daemon_runtime\atheria_daemon_audit.jsonl --limit 120 --spatial-dims 3 --top-links 8 --json-out .\runtime_audit\spacetime_reconstruction.json
```

