# Modul: `atheria_daemon.py`

Dieses Modul startet den Daemon direkt (ohne Background-Wrapper).

## Ausfuehrung in PowerShell

Arbeitsordner:

```powershell
cd D:\Atheria-main\Atheria_Relase
```

Minimaler Start (Finance, Poll, 1h Audit):

```powershell
python .\atheria_daemon.py --report-dir daemon_runtime --market-profile finance --market-transport poll --audit-hours 1
```

Mit begrenzter Laufzeit (z.B. 1 Stunde):

```powershell
python .\atheria_daemon.py --report-dir daemon_runtime --market-profile finance --market-transport poll --audit-hours 1 --max-runtime-seconds 3600
```

Hinweis: Stoppen mit `Ctrl+C`.

