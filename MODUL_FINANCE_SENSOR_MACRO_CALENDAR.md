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

Standalone Smoke-Test:

```powershell
@'
import time
from finance_sensor_macro_calendar import MacroReleaseCalendarSensor
sensor = MacroReleaseCalendarSensor(lookahead_hours=120.0, max_releases=5)
print(sensor.analyze(now_ts=time.time()))
'@ | python -
```

