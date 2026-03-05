# Modul: `start_atheria_background.ps1`

Dieses Modul startet den kompletten Background-Stack:
- `atheria_daemon.py`
- `aion_chronik.py`
- optional `aion_insight.py`
- optional lokaler Webserver

## Aktueller Stand (2026-03-05)

- Finance-Ingest hat jetzt einen Provider-Fallback `yahoo -> stooq`.
- `-AuditHours` kann fuer schnellen Eventaufbau genutzt werden; intern gilt
  ein Mindestintervall von `10s`.

## Ausfuehrung in PowerShell

Arbeitsordner:

```powershell
cd D:\Atheria-main\Atheria_Relase
```

Empfohlener Finance-Start:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\start_atheria_background.ps1 -ReportDir daemon_runtime -MarketProfile finance -MarketTransport poll -AuditHours 1 -OpenBrowser
```

Mit Insight-Prozess:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\start_atheria_background.ps1 -ReportDir daemon_runtime -MarketProfile finance -MarketTransport poll -AuditHours 1 -StartInsight -OpenBrowser
```

Schneller Realdaten-Aufbau (empfohlen fuer Future-Projection-Training):

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\start_atheria_background.ps1 -ReportDir daemon_runtime_live -MarketProfile finance -MarketTransport poll -MarketPollSeconds 5 -AuditHours 0.003 -OpenBrowser
```

Nur Prozesse starten (ohne Webserver):

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\start_atheria_background.ps1 -ReportDir daemon_runtime -NoWebServer
```

<!-- docs-sync:2026-03-05 -->
## Dokumentations-Sync 2026-03-05

- Finance-Realdatenpfad aktualisiert: Provider-Fallback yahoo -> stooq.
- Daemon-Auditintervall aktualisiert: technisches Minimum 10s.
- Future-Projection-Diagnostik erweitert (has_supervised_fit, Datenabdeckung, Proxy-Anteil).
