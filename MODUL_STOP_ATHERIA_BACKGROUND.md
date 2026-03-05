# Modul: `stop_atheria_background.ps1`

Dieses Modul beendet die laufende Background-Session.

## Ausfuehrung in PowerShell

Arbeitsordner:

```powershell
cd D:\Atheria-main\Atheria_Relase
```

Normal stoppen:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\stop_atheria_background.ps1 -ReportDir daemon_runtime
```

Erzwungen stoppen:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\stop_atheria_background.ps1 -ReportDir daemon_runtime -Force
```

