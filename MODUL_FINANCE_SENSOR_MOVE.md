# Modul: `finance_sensor_move.py`

`MOVE`-Sensor fuer Bond-Stress. Dieses Modul ist ein Bibliotheksbaustein ohne eigene CLI.

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
from finance_sensor_move import MoveIndexSensor
sensor = MoveIndexSensor()
sample = {
    "MOVE": {"price": 120.0, "recent_return": 0.018, "volatility": 0.025, "price_change_pct": 1.2},
    "VIX": {"recent_return": 0.009},
}
print(sensor.analyze(sample))
'@ | python -
```

