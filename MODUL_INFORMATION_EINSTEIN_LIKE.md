# Modul: `atheria_information_einstein_like.py` / `run_information_einstein_like.ps1`

Dieses Modul erzeugt eine Einstein-like Effekt-Geometrie aus Informationsdynamik
inklusive Probe-Trajektorien, Deflektion und Proof-JSON.

## Ausfuehrung in PowerShell (empfohlen ueber PS1-Wrapper)

Arbeitsordner:

```powershell
cd D:\Atheria-main\Atheria_Relase
```

Standardlauf mit JSON-Ausgabe:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\run_information_einstein_like.ps1 -ReportFile ..\daemon_runtime\atheria_daemon_audit.jsonl -JsonOut .\runtime_audit\einstein_like_reconstruction.json
```

Mit Browser-Start der Proof-Seite:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\run_information_einstein_like.ps1 -ReportFile ..\daemon_runtime\atheria_daemon_audit.jsonl -JsonOut .\runtime_audit\einstein_like_reconstruction.json -OpenBrowser -HttpPort 8000
```

Physikalisch konservativer Modus (geringere Deflektion, schwaechere Kopplung):

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\run_information_einstein_like.ps1 -Mode conservative -ReportFile ..\daemon_runtime\atheria_daemon_audit.jsonl -JsonOut .\runtime_audit\einstein_like_reconstruction_conservative.json -OpenBrowser -HttpPort 8000
```

Konservativer Modus mit Auto-Tuning (empfohlen fuer bestmoegliche Evidenz):

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\run_information_einstein_like.ps1 -Mode conservative -AutoTuneConservative -AutoTuneMaxTrials 12 -AutoTuneTargetCorr 0.35 -ReportFile ..\daemon_runtime\atheria_daemon_audit.jsonl -JsonOut .\runtime_audit\einstein_like_reconstruction_conservative_tuned.json -OpenBrowser -HttpPort 8000
```

Hinweis:
- `standard`: staerkere Kopplung, hoehere Deflektion.
- `conservative`: deutlich schwaechere Kopplung und konservativere Trajektorien.
- `AutoTuneConservative`: testet mehrere konservative Parameter-Sets und waehlt den besten Trial.
  - Wenn `-AutoTuneConservative` gesetzt ist, wird intern automatisch im Modus `conservative` gerechnet.
- Im JSON stehen beide Korrelationswerte:
  - `mass_potential_correlation` (roh)
  - `source_potential_corr_scaled` (mit Kopplungsfaktor skaliert)

Mit angepassten Simulationsparametern:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\run_information_einstein_like.ps1 -ReportFile ..\daemon_runtime\atheria_daemon_audit.jsonl -ProbeCount 32 -ProbeSteps 220 -Gravity 0.55 -Dt 0.04 -JsonOut .\runtime_audit\einstein_like_reconstruction.json
```

Direktlauf ohne Wrapper:

```powershell
python .\atheria_information_einstein_like.py --report-file ..\daemon_runtime\atheria_daemon_audit.jsonl --limit 180 --spatial-dims 3 --probe-count 24 --probe-steps 180 --dt 0.045 --gravity 0.55 --path-decimation 2 --json-out .\runtime_audit\einstein_like_reconstruction.json
```

Direktlauf konservativ ohne Wrapper:

```powershell
python .\atheria_information_einstein_like.py --mode conservative --report-file ..\daemon_runtime\atheria_daemon_audit.jsonl --limit 180 --spatial-dims 3 --probe-count 24 --probe-steps 180 --dt 0.045 --gravity 0.55 --path-decimation 2 --json-out .\runtime_audit\einstein_like_reconstruction_conservative.json
```
