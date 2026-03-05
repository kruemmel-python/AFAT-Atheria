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

Hinweis (2026-03-05):
- Finance-Provider nutzen `yahoo -> stooq` als Fallback.
- Fuer schnellen Eventaufbau kann `--audit-hours 0.003` genutzt werden (10s-Minimum intern).

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

<!-- docs-sync:2026-03-05 -->
## Dokumentations-Sync 2026-03-05

- Finance-Realdatenpfad aktualisiert: Provider-Fallback yahoo -> stooq.
- Daemon-Auditintervall aktualisiert: technisches Minimum 10s.
- Future-Projection-Diagnostik erweitert (has_supervised_fit, Datenabdeckung, Proxy-Anteil).
