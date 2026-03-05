# Modul: `atheria_market_future_projection.py` / `run_information_zukunftsprojektion.ps1`

Dieses Modul kartiert die Marktinformationslandschaft und erzeugt eine
probabilistische Kurzfrist-Projektion (inkl. Unsicherheitsband und Szenarien).

## Aktueller Stand (2026-03-05)

- Die Qualitaetsausgabe enthaelt jetzt explizite Datenabdeckungs-Infos:
  - `has_supervised_fit` (ab 8 Events),
  - `events_missing_for_supervised_fit`,
  - `signal_mode_counts`, `market_signal_ratio`, `proxy_signal_ratio`.
- Bei unzureichender Realdatenabdeckung bleibt der Nachweis bewusst `Weak`
  (auch bei gutem R2), um Proxy-basierte Ueberinterpretation zu vermeiden.
- Die Proof-HTML zeigt bei fehlendem Supervised-Fit `R2/MAE` als `n/a`.

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

## Empfohlener Live-Workflow fuer Realdaten

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\run_information_zukunftsprojektion.ps1 -ReportFile .\daemon_runtime_live\atheria_daemon_audit.jsonl -JsonOut .\runtime_audit\market_future_projection.json -OpenBrowser -HttpPort 8000
```

Interpretation der Mindestanforderungen:

- Supervised-Fit: ab `sample_count >= 8`.
- Robusteres Urteil `Partial`: typischerweise ab `>= 20` Events.
- Robusteres Urteil `Verified`: typischerweise ab `>= 40` Events.

<!-- docs-sync:2026-03-05 -->
## Dokumentations-Sync 2026-03-05

- Finance-Realdatenpfad aktualisiert: Provider-Fallback yahoo -> stooq.
- Daemon-Auditintervall aktualisiert: technisches Minimum 10s.
- Future-Projection-Diagnostik erweitert (has_supervised_fit, Datenabdeckung, Proxy-Anteil).
