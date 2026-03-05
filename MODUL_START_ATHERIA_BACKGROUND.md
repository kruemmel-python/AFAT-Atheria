# Modul: `start_atheria_background.ps1`

Dieses Modul startet den kompletten Background-Stack:
- `atheria_daemon.py`
- `aion_chronik.py`
- optional `aion_insight.py`
- optional lokaler Webserver

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

Nur Prozesse starten (ohne Webserver):

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\start_atheria_background.ps1 -ReportDir daemon_runtime -NoWebServer
```

