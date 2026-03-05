# Modul: `status_atheria_background.ps1`

Dieses Modul zeigt den Status der laufenden Background-Session.

## Ausfuehrung in PowerShell

Arbeitsordner:

```powershell
cd D:\Atheria-main\Atheria_Relase
```

Status abrufen:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\status_atheria_background.ps1 -ReportDir daemon_runtime
```

Hinweis: Die Session-Datei liegt unter `daemon_runtime\_background\session.json`.

