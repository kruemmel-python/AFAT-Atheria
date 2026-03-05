# Modul: `atheria_daemon.py`

Dieses Modul startet den Daemon direkt (ohne Background-Wrapper).

## Aktueller Stand (2026-03-05)

- Finance-Fetch nutzt jetzt `yahoo -> stooq` als Fallback-Kette.
- Das minimale Auditintervall wurde auf `10s` gesenkt
  (`--audit-hours` wird intern auf mindestens 10 Sekunden geklemmt).

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

Schneller Event-Aufbau (nahe am 10s-Minimum):

```powershell
python .\atheria_daemon.py --report-dir daemon_runtime_live --market-profile finance --market-transport poll --market-poll-seconds 5 --audit-hours 0.003 --max-runtime-seconds 900
```

Hinweis: Stoppen mit `Ctrl+C`.

<!-- docs-sync:2026-03-05 -->
## Dokumentations-Sync 2026-03-05

- Finance-Realdatenpfad aktualisiert: Provider-Fallback yahoo -> stooq.
- Daemon-Auditintervall aktualisiert: technisches Minimum 10s.
- Future-Projection-Diagnostik erweitert (has_supervised_fit, Datenabdeckung, Proxy-Anteil).
