# Modul: `atheria_market_benchmarks.py` / `run_market_benchmarks.ps1`

## Ziel
Dieses Modul fuehrt einen rollierenden One-Step-Benchmark fuer das Markt-Zukunftssignal aus und vergleicht:

- `ATHERIA field model`
- `Random baseline`
- `ARIMA(1,1,0) baseline`
- `GARCH(1,1) baseline`
- `Transformer baseline` (optional abschaltbar)

Der Benchmark nutzt denselben Audit-Datenpfad wie die Zukunftsprojektion (`atheria_daemon_audit.jsonl`) und erzeugt reproduzierbare Kennzahlen.

## Standardaufruf (PowerShell)

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\run_market_benchmarks.ps1 -ReportFile .\daemon_runtime_live\atheria_daemon_audit.jsonl -JsonOut .\runtime_audit\market_benchmark_report.json -MarkdownOut .\runtime_audit\market_benchmark_table.md
```

## Direkter Python-Aufruf

```powershell
python .\atheria_market_benchmarks.py --report-file .\daemon_runtime_live\atheria_daemon_audit.jsonl --limit 220 --min-train-events 24 --scenario-threshold 0.03 --json-out .\runtime_audit\market_benchmark_report.json --markdown-out .\runtime_audit\market_benchmark_table.md
```

## Wichtige Parameter

- `-ReportFile`: Quelle (`atheria_daemon_audit.jsonl`)
- `-Limit`: Anzahl letzter Events
- `-MinTrainEvents`: initiale Trainingsfensterlaenge fuer expanding-window
- `-ScenarioThreshold`: Schwellwert fuer `stress_up/sideways/stress_down`
- `-SkipTransformer`: Transformer-Baseline deaktivieren (schneller Lauf)
- `-JsonOut`: strukturierter Bericht
- `-MarkdownOut`: tabellarische Zusammenfassung

## Output

- `runtime_audit/market_benchmark_report.json`
  - Datenabdeckung (`market_signal_ratio`, `proxy_signal_ratio`)
  - Protokoll (`folds`, `min_train_events`, `scenario_threshold`)
  - Modellmetriken (`MAE`, `RMSE`, `R2`, `directional_accuracy`, `Brier`, `CRPS`)
  - Ranking nach `MAE`, `Brier`, `CRPS`
  - Diagnostik zur Klassenverteilung (`class_imbalance_flag`)

- `runtime_audit/market_benchmark_table.md`
  - direkte Tabelle fuer README/Whitepaper-Einbindung

## Interpretation

- Sehr niedrige Fehlerwerte sind nur belastbar, wenn die Zielklasse nicht trivial dominiert.
- Pruefe immer:
  - `delta_std`
  - `target_class_counts`
  - `majority_target_ratio`
- Bei starker Klassen-Imbalance ist der Benchmark als vorlaeufig einzustufen.

<!-- docs-sync:2026-03-05 -->
## Dokumentations-Sync 2026-03-05

- Finance-Realdatenpfad aktualisiert: Provider-Fallback yahoo -> stooq.
- Daemon-Auditintervall aktualisiert: technisches Minimum 10s.
- Future-Projection-Diagnostik erweitert (has_supervised_fit, Datenabdeckung, Proxy-Anteil).
