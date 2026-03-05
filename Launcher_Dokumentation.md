# Autonome Launcher Dokumentation

Diese Datei beschreibt den autonomen Dauerbetrieb mit `atheria_daemon.py` und die zugehoerige Beobachtung mit `aion_chronik.py`.

## Zweck

Der Dauerbetrieb besteht aus zwei Werkzeugen:

- `atheria_daemon.py`: startet und steuert ATHERIA autonom im Hintergrund
- `aion_chronik.py`: liest die signierten Daemon-Berichte und uebersetzt sie in lesbare Chronik-Eintraege

Der Daemon uebernimmt drei Kernaufgaben:

- automatische Marktanbindung direkt beim Start
- periodische Integritaets-Reports als signierte JSONL-Eintraege
- automatische Offspring-Erzeugung bei schweren Marktanomalien

Die Chronik uebernimmt drei Beobachtungsaufgaben:

- Uebersetzung der JSONL-Berichte in lesbare Tagebucheintraege
- Tageszusammenfassung mit Neustarts, Alerts, Anomalien und Entdeckungen
- Ausgabe als Text, farbige TUI oder HTML

## Laufzeitverhalten

Beim Start fuehrt der Launcher folgende Schritte aus:

1. Er erstellt einen neuen `AtheriaCore`.
2. Er ruft `bootstrap_default_mesh()` auf.
3. Er konfiguriert die Audit-Ausgabe in das gewaehlte `report_dir`.
4. Er startet den Core-Loop.
5. Er verbindet `MarketAlchemy` sofort mit dem Marktfeed.
6. Er schreibt einen signierten Start-Report.

Waehrend des Betriebs laufen zwei Hintergrundschleifen:

- Audit-Schleife: schreibt in festen Intervallen Integritaets-Reports.
- Anomalie-Schleife: bewertet Marktstress und triggert bei Bedarf neue Generationen.

Beim Shutdown:

1. Der Marktfeed wird gestoppt.
2. Ein finaler Shutdown-Report wird geschrieben.
3. Der Core inklusive Lineage-Offspring wird sauber beendet.

## Marktanbindung

`--market-transport` steuert den Feed-Modus:

- `auto`: versucht zuerst WebSocket, faellt bei Fehlern auf Polling zurueck
- `websocket`: erzwingt den Binance-WebSocket-Pfad
- `poll`: nutzt ausschliesslich den REST-Polling-Pfad

Provider-Verhalten (Finance, Stand 2026-03-05):

- Finance nutzt `yahoo` mit Fallback auf `stooq`.
- Dadurch bleiben Realdaten auch bei Yahoo-`401` verfuegbar.

Standard-Symbole:

- `BTCUSDT`
- `ETHUSDT`
- `BNBUSDT`
- `SOLUSDT`

## Integritaets-Reports

Die Reports werden in `report_dir/atheria_daemon_audit.jsonl` geschrieben.

Jeder Eintrag enthaelt:

- Zeitstempel
- Grund des Reports (`daemon_startup`, `scheduled_integrity_audit`, `market_alert`, `market_anomaly::...`, `daemon_shutdown`)
- `dashboard` Snapshot
- `market` Snapshot
- `safety` Snapshot
- `lineage` Snapshot
- HMAC-Signatur (`journal_signature`)
- Verkettung auf den vorherigen Report (`previous`)

Die Signatur nutzt einen aus dem Safety-Audit-Key abgeleiteten Schluessel. Dadurch bleibt die Report-Kette kryptographisch an den Core gebunden.

## Anomalie-Reaktion

Der Daemon bewertet laufend:

- `trauma_pressure` aus `MarketAlchemy`
- letzten BTC-Return
- BTC-Volatilitaet

Bei erhoehter Anomalie:

- es wird ein `market_alert` Report geschrieben

Bei schwerer Anomalie:

- es wird sofort ein Offspring erzeugt
- das Profil wird auf `stress-test` oder `survival` festgesetzt
- das Kind bekommt eine angepasste Runtime-Initialisierung
- das Kind startet seinen eigenen Marktfeed
- es wird ein zusaetzlicher Anomalie-Report geschrieben

## Wichtige Parameter

- `--report-dir`: Zielverzeichnis fuer Reports, Core-Audits und Lineage-Artefakte
- `--market-transport`: `auto`, `websocket` oder `poll`
- `--market-poll-seconds`: Poll-Intervall oder Flush-Anker fuer den Feed
- `--audit-hours`: Abstand der regulaeren Integritaets-Reports
  - technisch gilt ein Minimum von `10s` zwischen scheduled audits
- `--anomaly-seconds`: Abstand der Markt-Anomaliepruefung
- `--anomaly-cooldown-minutes`: Mindestabstand zwischen zwei anomaly-getriggerten Generationen
- `--tick-interval`: Takt des Core
- `--max-runtime-seconds`: optionales Laufzeitlimit fuer beaufsichtigte Sessions
- `--log-level`: Logging-Level

## PowerShell Befehle

### Hilfe und Parameter anzeigen

```powershell
python atheria_daemon.py --help
```

Zeigt alle verfuegbaren Parameter des autonomen Launchers.

```powershell
python aion_chronik.py --help
```

Zeigt alle Ausgabemodi der Chronik, inklusive TUI und HTML-Export.

### Daemon starten

```powershell
python atheria_daemon.py --report-dir daemon_runtime --market-transport auto --audit-hours 4
```

Standardstart fuer den Dauerbetrieb. Der Daemon nutzt zuerst WebSocket und faellt bei Bedarf auf Polling zurueck.

```powershell
python atheria_daemon.py --report-dir daemon_runtime --market-transport websocket --audit-hours 4
```

Erzwingt den WebSocket-Pfad. Sinnvoll, wenn du explizit den Live-Stream bevorzugst.

```powershell
python atheria_daemon.py --report-dir daemon_runtime --market-transport poll --market-poll-seconds 5
```

Erzwingt den sicheren REST-Polling-Betrieb. Gut fuer stabile, vorhersagbare Testumgebungen.

```powershell
python atheria_daemon.py --report-dir daemon_runtime --market-transport poll --max-runtime-seconds 60
```

Begrenzter Testlauf fuer 60 Sekunden. Nuetzlich fuer kontrollierte Verifikation ohne unbegrenzten Dauerbetrieb.

```powershell
python atheria_daemon.py --report-dir daemon_runtime_live --market-profile finance --market-transport poll --market-poll-seconds 5 --audit-hours 0.003 --max-runtime-seconds 600
```

Schneller Realdaten-Aufbau fuer Future-Projection. `0.003h` entspricht ca. `10.8s` und liegt nahe am technischen Audit-Minimum.

```powershell
python atheria_daemon.py ^
  --report-dir daemon_runtime ^
  --market-transport auto ^
  --market-poll-seconds 5 ^
  --audit-hours 4 ^
  --anomaly-seconds 15 ^
  --anomaly-cooldown-minutes 15 ^
  --log-level INFO
```

Produktionsnaher Start mit expliziten Intervallen fuer Markt, Audit und Anomaliepruefung.

### Daemon im PowerShell-Fenster stoppen

Kein eigener Befehl noetig:

- `Strg + C` beendet den laufenden Prozess kontrolliert.

Der Daemon schreibt dabei noch den finalen `daemon_shutdown` Report und beendet den Core sauber.

### Chronik als Text lesen

```powershell
python aion_chronik.py --report-dir daemon_runtime --limit 60
```

Zeigt die letzten 60 Chronik-Eintraege als lesbaren Text.

```powershell
python aion_chronik.py --report-dir daemon_runtime --limit 60 --summary
```

Zeigt vor den Eintraegen zusaetzlich eine kompakte Tageszusammenfassung.

### Chronik als farbige TUI anzeigen

```powershell
python aion_chronik.py --report-dir daemon_runtime --limit 20 --tui
```

Rendert eine kompakte Terminalansicht mit Statuskopf, Tageszusammenfassung und farbig markierten Eintraegen.

```powershell
python aion_chronik.py --report-dir daemon_runtime --follow --tui --start-at-end
```

Startet die TUI im Live-Modus und zeigt nur neue Eintraege ab dem Moment des Starts. Das ist das beste "Fenster" in den laufenden Daemon.

### Chronik live als Text verfolgen

```powershell
python aion_chronik.py --report-dir daemon_runtime --follow
```

Beobachtet neue JSONL-Eintraege fortlaufend und gibt sie als Text aus.

```powershell
python aion_chronik.py --report-dir daemon_runtime --follow --start-at-end
```

Beobachtet nur neue Eintraege ab jetzt und ignoriert den bisherigen Verlauf.

### Chronik als HTML erzeugen

```powershell
python aion_chronik.py --report-dir daemon_runtime --limit 60 --html-out chronik.html
```

Erzeugt eine eigenstaendige HTML-Ansicht mit Statusbereich, Tageskarten und formatierten Chronik-Eintraegen.

```powershell
Start-Process .\chronik.html
```

Oeffnet die erzeugte HTML-Datei direkt im Standardbrowser.

### Chronik mit TUI und HTML gleichzeitig aktualisieren

```powershell
python aion_chronik.py --report-dir daemon_runtime --follow --tui --start-at-end --html-out chronik_live.html
```

Zeigt live die farbige Terminalansicht und aktualisiert parallel bei jedem neuen Report die HTML-Datei.

### Live Binance Smoke Test

```powershell
$env:ATHERIA_ENABLE_LIVE_BINANCE_SMOKE='1'
$env:ATHERIA_LIVE_BINANCE_SMOKE_TIMEOUT='8'
python -m unittest tests.test_collective_extensions.TestCollectiveExtensions.test_27_live_binance_websocket_smoke_if_enabled
```

Fuehrt den opt-in Live-Smoke-Test gegen den Binance-WebSocket aus. Das ist ein gezielter Verifikationstest fuer den Feed, nicht fuer den regulaeren Dauerbetrieb.

## Beispiel fuer produktionsnahen Betrieb mit Beobachtung

Erstes PowerShell-Fenster:

```powershell
python atheria_daemon.py ^
  --report-dir daemon_runtime ^
  --market-transport auto ^
  --market-poll-seconds 5 ^
  --audit-hours 4 ^
  --anomaly-seconds 15 ^
  --anomaly-cooldown-minutes 15 ^
  --log-level INFO
```

Startet den autonomen Dauerbetrieb.

Zweites PowerShell-Fenster:

```powershell
python aion_chronik.py --report-dir daemon_runtime --follow --tui --start-at-end --html-out chronik_live.html
```

Zeigt live die Chronik im Terminal und aktualisiert parallel die HTML-Ansicht.

Drittes PowerShell-Fenster optional:

```powershell
Start-Process .\chronik_live.html
```

Oeffnet die fortlaufend aktualisierte HTML-Ansicht im Browser.

## Hinweise

- Fuer echten Dauerbetrieb sollte der Launcher ueber Task Scheduler oder einen Service-Wrapper gestartet werden.
- `report_dir` enthaelt sowohl die Daemon-Reports als auch die Core-Audit-Dateien und Lineage-Artefakte.
- Der Launcher ist fuer unbeaufsichtigten Betrieb gedacht; `--max-runtime-seconds` ist nur fuer kontrollierte Testlaeufe sinnvoll.
- Die farbige TUI zeigt Farben nur in einer echten interaktiven Konsole. Bei Umleitung oder nicht-interaktiver Ausgabe bleibt der Inhalt lesbar, aber ohne ANSI-Farben.

<!-- docs-sync:2026-03-05 -->
## Dokumentations-Sync 2026-03-05

- Finance-Realdatenpfad aktualisiert: Provider-Fallback yahoo -> stooq.
- Daemon-Auditintervall aktualisiert: technisches Minimum 10s.
- Future-Projection-Diagnostik erweitert (has_supervised_fit, Datenabdeckung, Proxy-Anteil).
