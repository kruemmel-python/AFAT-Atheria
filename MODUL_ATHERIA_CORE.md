# Modul: `atheria_core.py`

Dieses Modul ist der Kern und wird in der Praxis ueber den Daemon gestartet.

## Ausfuehrung in PowerShell

Arbeitsordner:

```powershell
cd D:\Atheria-main\Atheria_Relase
```

Empfohlener Produktiv-Start (indirekt ueber Daemon):

```powershell
python .\atheria_daemon.py --report-dir daemon_runtime --market-profile finance --market-transport poll --audit-hours 1
```

Direkter Kern-Schnelltest (Demo):

```powershell
python .\atheria_core.py
```

Hinweis: Der direkte Aufruf startet die im Modul hinterlegte Demo-Routine.

