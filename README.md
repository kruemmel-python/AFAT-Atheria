# ATHERIA – Adaptive Telemetry, Heuristik, Risiko-Intelligenz & Analyse

## Überblick
ATHERIA ist ein modular aufgebautes, autonomes Analyse- und Überwachungssystem für informationsgetriebene Marktdynamiken. Die Plattform kombiniert:

- **Laufzeit-Orchestrierung** (Daemon + Core),
- **finanzmarktorientierte Sensorik** (Volatilität, Sektorrotation, Makro-Events),
- **auditierbare Ereignisprotokollierung mit Signaturkette**,
- **wissenschaftlich inspirierte Rekonstruktionsmodule** für Raumzeit-/Feldanalogie,
- **Kurzfrist-Projektionsmodelle** für probabilistische Zukunftsszenarien,
- **HTML-basierte Chronik-/Proof-Artefakte** zur operativen und analytischen Auswertung.

Das Repository ist für forschungsnahe, experimentelle und prototypische Anwendungen konzipiert und unterstützt sowohl den direkten Python-Betrieb als auch PowerShell-basierte Betriebsabläufe.

---

## Stand 2026-03-05: Realdaten- und Forecast-Update

- Finance-Ingest nutzt jetzt einen robusten Provider-Fallback: `yahoo -> stooq`.
- Das minimale Daemon-Auditintervall wurde auf `10s` reduziert.
- Future-Projection bewertet Datenqualitaet explizit:
  - `has_supervised_fit`, `events_missing_for_supervised_fit`,
  - `signal_mode_counts`, `market_signal_ratio`, `proxy_signal_ratio`.
- Bei zu hoher Proxy-Quote bleibt der Nachweis bewusst `Weak`, auch wenn Einzelmetriken stark aussehen.

---

## Systemarchitektur (Makroebene)

```text
Marktdaten / Signale
        │
        ▼
Finance-Sensoren (MOVE / Sector / Macro Calendar)
        │
        ▼
ATHERIA Core (zustandsbasierte Kernlogik)
        │
        ▼
ATHERIA Daemon (Orchestrierung, Audit-Events, Laufzeitsteuerung)
        │
        ├── daemon_runtime/atheria_daemon_audit.jsonl
        ├── daemon_runtime/core_audit/*.jsonl + *.key
        └── daemon_runtime/lineage/*
                 │
                 ├── aion_chronik.py  → chronik.html
                 ├── atheria_spacetime_reconstruction.py
                 ├── atheria_information_einstein_like.py
                 └── atheria_market_future_projection.py
```

### Kernprinzipien
1. **Kontinuierliche Zustandsbeobachtung:** Zyklische Verarbeitung marktbezogener Signale.
2. **Auditierbarkeit:** Ereignisse werden in JSONL-Strukturen persistiert und kryptografisch verkettet.
3. **Resilienzorientierung:** Anomalie-Detektion und adaptive Reaktionspfade (z. B. Stressprofile).
4. **Analytische Rekonstruktion:** Nachgelagerte Informationsgeometrie und Forecasting auf Auditdaten.

---

## Modulverzeichnis (vollständig)

### Betriebs- und Steuerungsmodule
- **`atheria_daemon.py`** – Laufzeit-Orchestrator für den autonomen Betrieb (Start, Tick-Loop, Auditzyklen, Anomaliepfade).
- **`atheria_core.py`** – Kernlogik des Systems; wird produktiv primär über den Daemon betrieben.
- **`start_atheria_background.ps1`** – Startet den Gesamt-Background-Stack (Daemon, Chronik, optional Webserver/Insight).
- **`status_atheria_background.ps1`** – Liefert Statusinformationen zur aktuellen Hintergrund-Session.
- **`stop_atheria_background.ps1`** – Beendet die Hintergrund-Session regulär oder erzwungen.

### Sensorikmodule (Finance)
- **`finance_sensor_move.py`** – Stress-/Volatilitätsindikationen anhand MOVE-bezogener Signale.
- **`finance_sensor_sector.py`** – Sektorrotations-Analyse (defensiv vs. zyklisch).
- **`finance_sensor_macro_calendar.py`** – Zeitfensterlogik für relevante Makro-Releases.

### Auswertungs- und Rekonstruktionsmodule
- **`aion_chronik.py`** – Generiert Chronik-Reports (inkl. HTML-Ansicht) aus Auditdaten.
- **`atheria_spacetime_reconstruction.py`** – Raumzeit-Projektionsrekonstruktion aus Audit-Information.
- **`atheria_information_einstein_like.py`** – Einstein-like Effektgeometrie mit Deflektions-/Feldanalogie.
- **`atheria_market_future_projection.py`** – Probabilistische Kurzfrist-Marktzukunftsprojektion.
- **`atheria_market_benchmarks.py`** – Rolling-Benchmark gegen ARIMA/GARCH/Transformer/Random-Baselines.

### Wrapper, Dokumentation und Artefakte
- PowerShell-Wrapper:
  - `run_information_raumgeometrie.ps1`
  - `run_information_einstein_like.ps1`
  - `run_information_zukunftsprojektion.ps1`
  - `run_market_benchmarks.ps1`
- Modul-Dokumentation:
  - `MODUL_*.md` (spezifische Start- und Bedienhinweise)
  - `MODUL_INDEX.md` (Index)
- Laufzeit-/Ergebnisartefakte:
  - `daemon_runtime/*`
  - `runtime_audit/*`
  - `*.html` Proof-/Dashboard-Ansichten

---

## Wissenschaftlich-analytischer Rahmen
ATHERIA nutzt eine **informationszentrierte Modellierung**, in der Systemzustände nicht nur als diskrete Ereignisse, sondern als dynamische Struktur im Merkmalsraum betrachtet werden. Daraus ergeben sich drei analytische Ebenen:

1. **Deskriptive Ebene (Chronik):**
   - Was ist passiert?
   - Welche Zustandsübergänge und Audit-Events traten auf?

2. **Geometrische Ebene (Raumzeit / Einstein-like):**
   - Wie formt Informationsdichte die rekonstruierte Struktur des Zustandsraums?
   - Welche Potential- und Krümmungsproxies lassen sich ableiten?

3. **Prädiktive Ebene (Future Projection):**
   - Welche kurzfristorientierten Entwicklungspfade sind probabilistisch plausibel?
   - Wie groß ist das Unsicherheitsband künftiger Signalwerte?

> Hinweis: Die geometrisch-physikalische Terminologie ist modellanaloge Methodik und keine direkte physikalische Messung realer Raumzeit.

---

## Daten- und Auditmodell

### Primäre Laufzeitdaten
- **`daemon_runtime/atheria_daemon_audit.jsonl`**
  - sequenzielle Ereignisse des Daemonbetriebs,
  - Grundlage für Chronik und Rekonstruktionsläufe.

### Core-Auditbereich
- **`daemon_runtime/core_audit/*_safety_audit.jsonl`**
- **`daemon_runtime/core_audit/*_audit.key`**

Die Key-/Signaturstruktur ermöglicht Integritätsprüfungen einzelner Eventketten und unterstützt eine nachvollziehbare Historie.

### Abgeleitete Analyseartefakte
- **`runtime_audit/*.json`**: Rekonstruktionen, konservative Varianten, Forecast-Ausgaben.
- **`*.html`**: visuelle Proof- und Berichtsansichten.

---

## Installation & Voraussetzungen

## 1) Basisvoraussetzungen
- Python 3.10+ empfohlen.
- Betriebssystem: Windows (PowerShell-Wrapper vorhanden), grundsätzlich auch Python-direkt unter Linux/macOS nutzbar.
- Abhängig von den Modulen können externe Python-Pakete notwendig sein (z. B. numerische Bibliotheken).

## 2) Projekt klonen
```bash
git clone <REPO-URL>
cd AFAT-Atheria
```

## 3) Optional: virtuelle Umgebung
```bash
python -m venv .venv
# Windows PowerShell:
.\.venv\Scripts\Activate.ps1
# Linux/macOS:
source .venv/bin/activate
```

---

## Quickstart

### A) Empfohlener Hintergrundbetrieb (PowerShell)
```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\start_atheria_background.ps1 -ReportDir daemon_runtime -MarketProfile finance -MarketTransport poll -AuditHours 1 -OpenBrowser
```

Schneller Event-Aufbau fuer Future-Projection-Training:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\start_atheria_background.ps1 -ReportDir daemon_runtime_live -MarketProfile finance -MarketTransport poll -MarketPollSeconds 5 -AuditHours 0.003 -OpenBrowser
```

Status prüfen:
```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\status_atheria_background.ps1 -ReportDir daemon_runtime
```

Stoppen:
```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\stop_atheria_background.ps1 -ReportDir daemon_runtime
```

### B) Direkter Daemonstart (Python)
```bash
python ./atheria_daemon.py --report-dir daemon_runtime --market-profile finance --market-transport poll --audit-hours 1
```

### C) Chronik generieren
```bash
python ./aion_chronik.py --report-dir daemon_runtime --html-out chronik.html
```

---

## Analyse-Workflows

### 1) Raumzeit-Rekonstruktion
```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\run_information_raumgeometrie.ps1 -ReportFile .\daemon_runtime\atheria_daemon_audit.jsonl -JsonOut .\runtime_audit\spacetime_reconstruction.json
```

### 2) Einstein-like Rekonstruktion
```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\run_information_einstein_like.ps1 -ReportFile .\daemon_runtime\atheria_daemon_audit.jsonl -JsonOut .\runtime_audit\einstein_like_reconstruction.json
```

### 3) Zukunftsprojektion
```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\run_information_zukunftsprojektion.ps1 -ReportFile .\daemon_runtime\atheria_daemon_audit.jsonl -JsonOut .\runtime_audit\market_future_projection.json
```

Empfohlen mit separatem Live-Reportdir:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\run_information_zukunftsprojektion.ps1 -ReportFile .\daemon_runtime_live\atheria_daemon_audit.jsonl -JsonOut .\runtime_audit\market_future_projection.json -OpenBrowser -HttpPort 8000
```

### 4) Baseline-Benchmarks (ARIMA/GARCH/Transformer/Random)
```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\run_market_benchmarks.ps1 -ReportFile .\daemon_runtime_live\atheria_daemon_audit.jsonl -JsonOut .\runtime_audit\market_benchmark_report.json -MarkdownOut .\runtime_audit\market_benchmark_table.md
```

---

## Governance, Sicherheit, Nachvollziehbarkeit
- **Integritätsketten:** Eventverkettung und signaturbasierte Prüfpfade.
- **Reproduzierbarkeit:** Persistente JSONL/JSON-Artefakte für Offline-Analysen.
- **Modularität:** Sensorik, Orchestrierung und Rekonstruktion sind getrennt entwickelbar.
- **Erweiterbarkeit:** Neue Sensoren/Modelle können in die bestehende Pipeline eingebunden werden.

---

## Grenzen des Systems
- Das System ist **kein** Anlageberatungs- oder Trading-Automatismus im regulatorischen Sinn.
- Rekonstruktionen und Projektionen sind modellabhängige Approximationen.
- Ergebnisqualität hängt von Datenqualität, Parametrisierung und Laufzeitkonfiguration ab.

---

## Weiterführende Dokumentation
Für modulgenaue Startbefehle und Parameter siehe:
- `MODUL_INDEX.md`
- `MODUL_ATHERIA_DAEMON.md`
- `MODUL_ATHERIA_CORE.md`
- `MODUL_AION_CHRONIK.md`
- `MODUL_INFORMATION_RAUMGEOMETRIE.md`
- `MODUL_INFORMATION_EINSTEIN_LIKE.md`
- `MODUL_INFORMATION_ZUKUNFTSPROJEKTION.md`
- `MODUL_MARKET_BENCHMARKS.md`
- `MODUL_FINANCE_SENSOR_MOVE.md`
- `MODUL_FINANCE_SENSOR_SECTOR.md`
- `MODUL_FINANCE_SENSOR_MACRO_CALENDAR.md`

---

## Lizenz
Dieses Projekt steht unter der in `LICENSE` definierten Lizenz.

<!-- docs-sync:2026-03-05 -->
## Dokumentations-Sync 2026-03-05

- Finance-Realdatenpfad aktualisiert: Provider-Fallback yahoo -> stooq.
- Daemon-Auditintervall aktualisiert: technisches Minimum 10s.
- Future-Projection-Diagnostik erweitert (has_supervised_fit, Datenabdeckung, Proxy-Anteil).
