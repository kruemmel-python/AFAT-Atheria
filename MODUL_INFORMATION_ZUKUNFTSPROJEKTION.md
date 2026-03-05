# Modul: `atheria_market_future_projection.py` / `run_information_zukunftsprojektion.ps1`

Dieses Modul kartiert die Marktinformationslandschaft und erzeugt eine
probabilistische Kurzfrist-Projektion (inkl. Unsicherheitsband und Szenarien).

## Ausfuehrung in PowerShell (empfohlen ueber PS1-Wrapper)

Arbeitsordner:

```powershell
cd D:\Atheria-main\Atheria_Relase
```

Standardlauf mit JSON-Ausgabe:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\run_information_zukunftsprojektion.ps1 -ReportFile ..\daemon_runtime\atheria_daemon_audit.jsonl -JsonOut .\runtime_audit\market_future_projection.json
```

Mit Browser-Start der Proof-Seite:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\run_information_zukunftsprojektion.ps1 -ReportFile ..\daemon_runtime\atheria_daemon_audit.jsonl -JsonOut .\runtime_audit\market_future_projection.json -OpenBrowser -HttpPort 8000
```

Mit angepasstem Horizont:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\run_information_zukunftsprojektion.ps1 -ReportFile ..\daemon_runtime\atheria_daemon_audit.jsonl -Limit 220 -HorizonSteps 18 -StepSeconds 300 -Ridge 0.08 -JsonOut .\runtime_audit\market_future_projection_h18.json
```

Direktlauf ohne Wrapper:

```powershell
python .\atheria_market_future_projection.py --report-file ..\daemon_runtime\atheria_daemon_audit.jsonl --limit 180 --horizon-steps 12 --step-seconds 300 --ridge 0.08 --json-out .\runtime_audit\market_future_projection.json
```

