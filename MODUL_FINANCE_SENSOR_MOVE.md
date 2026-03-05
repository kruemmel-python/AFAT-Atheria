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

Hinweis (2026-03-05):
- Finance-Provider nutzen `yahoo -> stooq` als Fallback.
- Fuer schnellen Eventaufbau kann `--audit-hours 0.003` genutzt werden (10s-Minimum intern).

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

<!-- docs-sync:2026-03-05 -->
## Dokumentations-Sync 2026-03-05

- Finance-Realdatenpfad aktualisiert: Provider-Fallback yahoo -> stooq.
- Daemon-Auditintervall aktualisiert: technisches Minimum 10s.
- Future-Projection-Diagnostik erweitert (has_supervised_fit, Datenabdeckung, Proxy-Anteil).
