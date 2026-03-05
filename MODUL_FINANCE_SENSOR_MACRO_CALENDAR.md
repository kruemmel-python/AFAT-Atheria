# Modul: `finance_sensor_macro_calendar.py`

Makro-Release-Kalender (PMI, Payrolls, CPI) fuer Trigger-Fenster. Kein eigenes CLI-Programm.

## Ausfuehrung in PowerShell

Arbeitsordner:

```powershell
cd D:\Atheria-main\Atheria_Relase
```

Regulaerer Einsatz (indirekt ueber Daemon/Finance-Profile):

```powershell
python .\atheria_daemon.py --report-dir daemon_runtime --market-profile finance --market-transport poll --audit-hours 1
```

Hinweis (2026-03-05):
- Finance-Provider nutzen `yahoo -> stooq` als Fallback.
- Fuer schnellen Eventaufbau kann `--audit-hours 0.003` genutzt werden (10s-Minimum intern).

Standalone Smoke-Test:

```powershell
@'
import time
from finance_sensor_macro_calendar import MacroReleaseCalendarSensor
sensor = MacroReleaseCalendarSensor(lookahead_hours=120.0, max_releases=5)
print(sensor.analyze(now_ts=time.time()))
'@ | python -
```

<!-- docs-sync:2026-03-05 -->
## Dokumentations-Sync 2026-03-05

- Finance-Realdatenpfad aktualisiert: Provider-Fallback yahoo -> stooq.
- Daemon-Auditintervall aktualisiert: technisches Minimum 10s.
- Future-Projection-Diagnostik erweitert (has_supervised_fit, Datenabdeckung, Proxy-Anteil).
