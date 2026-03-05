# Modul: `aion_chronik.py`

Dieses Modul rendert die Chronik aus den Daemon-Auditdaten.

## Ausfuehrung in PowerShell

Arbeitsordner:

```powershell
cd D:\Atheria-main\Atheria_Relase
```

Einmaliger Lauf mit HTML-Ausgabe:

```powershell
python .\aion_chronik.py --report-dir daemon_runtime --html-out chronik.html
```

Follow-Modus (laufende Aktualisierung):

```powershell
python .\aion_chronik.py --report-dir daemon_runtime --follow --poll-seconds 5 --html-out chronik.html
```

Optional mit Zusammenfassung:

```powershell
python .\aion_chronik.py --report-dir daemon_runtime --summary --html-out chronik.html
```


<!-- docs-sync:2026-03-05 -->
## Dokumentations-Sync 2026-03-05

- Finance-Realdatenpfad aktualisiert: Provider-Fallback yahoo -> stooq.
- Daemon-Auditintervall aktualisiert: technisches Minimum 10s.
- Future-Projection-Diagnostik erweitert (has_supervised_fit, Datenabdeckung, Proxy-Anteil).
