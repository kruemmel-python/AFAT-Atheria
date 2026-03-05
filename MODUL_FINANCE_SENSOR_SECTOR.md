# Modul: `finance_sensor_sector.py`

Sektor-Rotationssensor (XLU/XLE/XLK -> defensive/cyclical bias). Kein eigenes CLI-Programm.

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
from finance_sensor_sector import SectorRotationSensor
sensor = SectorRotationSensor()
sample = {
    "SOFTWARE": {"recent_return": -0.013},
    "UTILITIES": {"recent_return": 0.011},
    "ENERGY": {"recent_return": 0.019},
}
print(sensor.analyze(sample))
'@ | python -
```

