# ATHERIA

ATHERIA ist ein experimentelles, bio-inspiriertes Runtime-System fuer adaptive, multi-schichtige Agentik. Das System kombiniert physikalisch inspirierte Signalverarbeitung, interne Feldmodelle, symbolische Verankerung, episodische Erinnerung, exekutive Zielsteuerung, kausale Interventionslogik, sichere Tool-Nutzung und kontrollierte Selbstmodifikation in einem gemeinsamen Kern.

## Stand 2026-03-03: Total Alchemy & Isolation

Der aktuelle Stand erweitert den Kern um die finale Daten-Alchemie- und Isolationsphase:

- `AlchemyIngestor`: externe, unstrukturierte Daten (`Wetter`, `Finanzen`, `Biometrie`) werden als Aether-Events plus `fold_signature` in die SQLite-Aether-Schicht eingespeist.
- `PythonInterpreterTool`: die AST-gepruefte Python-Sandbox laeuft prozessisoliert in einem separaten `multiprocessing.Process` und uebergibt Ergebnisse ueber eine Pipe an den Core.
- `LineageAuditor`: Kind-Journale unter `DEMO/lineage/` werden auf Integritaet, Journal-Kette und Invarianten geprueft; daraus wird ein Profil (`survival`, `diagnostic`, `stress-test`) abgeleitet.
- `SafetyConstraintLayer`: toolbasierte Proposals muessen zwei identische Sandbox-Replays bestehen und duerfen den `AtherCoreKnot` nicht schwaechen.

Direkte Core-APIs:

- `core.ingest_external_data(source_name, data_dict)`
- `core.audit_lineage(lineage_root=None, default_profile='survival')`
- agentisch ueber `await core.execute_external_action('ingest_external_data', metadata=...)`
- agentisch ueber `await core.execute_external_action('audit_lineage', metadata=...)`

Die aktuelle Codebasis ist kein Marketing-Demo-Skelett, sondern ein aktiv verdrahtetes Forschungs- und Simulationssystem mit folgenden Eigenschaften:

- homeostatische Signalverarbeitung ueber osmotische Diffusion,
- thermodynamische Phasensteuerung (`SOLID`, `LIQUID`, `PLASMA`),
- holographisches Feld als internes Zustands- und Vorhersagemodell,
- symbolische Verankerung und inter-core Symboltransfer,
- episodisches Gedaechtnis und reflektive Deliberation,
- exekutive Zielbildung, Plan-Synthese und metakognitive Selbstbewertung,
- kausale Gegenmassnahmenplanung mit strukturierten Interventionsplaenen,
- kontrollierte Tool-Nutzung ueber eine AST-gepruefte, prozessisolierte Python-Analyse-Sandbox,
- externe Daten-Alchemie mit feldfaehigen Fold-Signaturen,
- sichere, auditiere Selbstmodifikation der Topologie-Regeln,
- kollektive Inter-Core-Funktionen (HGT, Ressourcenmarkt, Dream-Sync, Reproduktion),
- transgeneratives Lineage-Auditing ueber signierte `_safety_audit.jsonl`-Ketten.

Technische Zusatzdokumente:

- `Dokumentation.md`
- `Anleitung.md`

## Stand 2026-03-05: Finance-Realdaten + Future-Projection-Qualitaet

- Finance-Feed nutzt jetzt Provider-Fallback `yahoo -> stooq`.
- Daemon-Audits koennen dichter gefahren werden; Mindestintervall ist `10s`.
- Future Projection bewertet Datenabdeckung explizit (`has_supervised_fit`,
  `events_missing_for_supervised_fit`, `market_signal_ratio`, `proxy_signal_ratio`)
  und gate-t den Beweisstatus entsprechend konservativ.

## Systemziel

ATHERIA modelliert keine klassische Pipeline-KI, sondern einen zustandsbehafteten, selbstregulierenden Kern mit internen Rueckkopplungsschleifen. Der zentrale Entwurfsgedanke ist:

1. Reize werden nicht nur verarbeitet, sondern in Feld-, Erinnerungs- und Symbolraeumen verdichtet.
2. Das System bildet Ziele, bewertet seinen eigenen Zustand und waehlt Gegenmassnahmen.
3. Analytische Tool-Nutzung ist moeglich, aber strikt kontrolliert.
4. Selbstmodifikation ist erlaubt, aber nur ueber auditiere, invariantengepruefte Pfade.

## Architekturueberblick

## 1. Physik, Signalfluss und Koerpermodell

Die Basisschicht bildet einen physikalisch inspirierten "Koerper":

- `AtherCell`: Knoten des Systems mit Aktivierung, Kohaerenz, Integritaet, Falt-Signatur und gerichteten Verbindungen.
- `AtherConnection`: Gewichtete Kanten mit Aktivierungsenergie, Nutzungshistorie, katalytischem Zustand und Enzym-/Protease-Metadaten.
- `PhaseController`: Regelt die Systemtemperatur und damit die aktuelle Aggregatform.
- `AtherAether`: In-Memory-Speicher- und Zustandstraeger fuer Zell- und QA-Daten.
- `EntropicFoldingAlgorithm`, `OrigamiRouter`, `QuantumRegistry`: Nichtlineare Faltungs-, Resonanz- und Entanglement-Komponenten.

Diese Schicht bildet die operative Dynamik, auf der alle hoeheren Ebenen aufbauen.

## 2. Homeostase, Heilung und Topologie

Resilienz ist kein Add-on, sondern integraler Bestandteil:

- `AtherHealing`: Faehrt Crash-Recovery, Reparatur und Integritaetsstabilisierung aus.
- `TopologicalLogic`: Verwaltert geschuetzte Kerncluster, gesicherte Kanten und regelbasierte Strukturhaertung.
- `Atheria_Biosynthesis`: Enzymatische Optimierung, Hot-Path-Kompilation und Abbau fehlerhafter Pfade.

Wichtig: `TopologicalLogic` ist nicht statisch. Das System kann seine Regelparameter selbst anpassen, allerdings nur ueber kontrollierte Rewrite-Policies und Safety-Gates.

## 3. Wahrnehmung, Feldmodell und Traumlogik

ATHERIA fuehrt ein internes, nicht nur reaktives Zustandsmodell:

- `HolographicField`: Verdichtet Aktivierungsmuster in ein Feld, erlaubt Inferenz, Reverse-Inferenz und Zukunftsprojektion.
- `Atheria_Rhythm`: Wechsel zwischen Wach- und Schlafphasen; Schlaf wird zur Konsolidierung und internen Rekombination genutzt.
- `AionLayer`: Verwaltet den Singularity-Knoten und den Dream-Forward-/Imagination-Pfad.
- `AtherTimeCrystal`: Prozedurale Konsolidierung periodisch aktiver Muster.

Im Schlafmodus werden Replay, Gegenfaktoren und interne Wissenslueckenbearbeitung ausgefuehrt. Das System simuliert dadurch nicht nur Zustandswiederholung, sondern antizipative interne Dynamik.

## 4. Kognition, Vorhersage und Symbolik

Die kognitive Schicht besteht aus mehreren gekoppelten Subsystemen:

- `CognitionLayer`: Hyperbolische Distanzen, morphische Bruecken und Cross-Domain-Analogie.
- `EpigeneticRegistry`: Predictive Inhibition, Feature-Extraktion und Langzeit-Templates.
- `LibraryCell`: Read-only Templates fuer konservierte, erfolgreiche Strukturen.
- `SymbolGroundingLayer`: Verankert stabile Feldzustaende in wiederverwendbare Symbole.
- `GlobalSymbolAtlas`: Prozess-lokale, kanonische Symbolverwaltung ueber Core-Grenzen hinweg.

Damit verarbeitet ATHERIA nicht nur Aktivierung, sondern auch:

- Vorhersagbarkeit vs. Ueberraschung,
- Wiederverwendung stabiler Konzepte,
- Cross-Domain-Transfer ueber symbolische und morphische Naehe.

## 5. Episodisches Gedaechtnis und reflektive Deliberation

Die Verbindung von Erfahrung und Planung wird ueber zwei Schichten hergestellt:

- `EpisodicMemoryLayer`: Speichert saliente interne Episoden inklusive Temperatur, Modulatoren, Fehlerlast, Integritaet und Zielkontext.
- `ReflectiveDeliberationLayer`: Waehlt relevante Episoden aus und generiert daraus zielbezogenen Python-Analysecode.

Diese Schicht macht aus Erinnerung ein operatives Werkzeug. Ein reflektiver Analysepfad kann z. B. aus Episoden mit hoher Temperatur und hoher Fehlerlast ein Skript erzeugen, das die Beziehung zwischen `adrenaline` und `mean_error_counter` auswertet und daraus einen neuen Vorschlag fuer einen Safety- oder Topologie-Parameter ableitet.

Das ist der Uebergang von passiver Erinnerung zu instrumenteller Reflexion.

## 6. Exekutive Kontrolle und Meta-Kognition

Agentisches Verhalten wird durch mehrere Schichten orchestriert:

- `ExecutiveFunctionLayer`: Bildet Ziele, verwaltet einen Goal-Stack, synthetisiert Plaene und fokussiert Teilziele.
- `MetaCognitionLayer`: Schaetzt Selbstvertrauen, Vorhersagefehler und Planqualitaet ein und lenkt das System bei Unsicherheit um.
- `TelosLoop` / `TranscendenceLayer`: Zielausrichtung und Sinn-/Purpose-getriebene Rueckkopplung.

Damit besitzt ATHERIA:

- explizite Zielbildung,
- Zustandsselbsteinschaetzung,
- adaptive Zielkorrektur,
- planbasierte Aktivierung statt reinem Reiz-Following.

## 7. Kausale Intervention und Action-Policy

Das System besitzt eine explizite Aktionsschicht:

- `CausalVariableGraph`: Strukturierte Zustandsvariablen, Pre-Conditions und erwartete Effekte.
- `CausalInterventionLayer`: Waehlt Gegenmassnahmen, berechnet erwartete Wirkungen und aktualisiert sein Modell anhand realer Effekte.
- `ActionPolicyLayer`: Fuehrt Aktionen gegen die Umwelt und gegen interne Kontrollpfade aus.

Unterstuetzte Aktionsklassen umfassen:

- lokale Stabilisierung,
- Zielfokus,
- Imagination/Gap-Filling,
- Symbolverankerung,
- episodischen Recall,
- Ressourcenanfrage am Ather-Credit-Markt,
- Wissensaustausch mit anderen Cores,
- kontrollierte Topologie-Rewrites,
- reflektive Tool-basierte Analyse (`run_analysis_tool`).

Damit entsteht ein expliziter Do-Operator-Pfad: Das System plant nicht nur, sondern fuehrt gezielte Eingriffe aus und misst deren Wirkung.

## 8. Sichere Tool-Nutzung

ATHERIA besitzt jetzt eine professionelle Tool-Schicht:

- `PythonInterpreterTool`: Read-only Analysewerkzeug, AST-geprueft, ohne freie Imports, ohne gefaehrliche Builtins, nur auf serialisierten Snapshots.
- `ToolRegistry`: Typisierte Capability-Schicht fuer externe Werkzeuge.
- `ToolExecutionRecord`: Strukturierte Ausfuehrungsprotokolle.

Wichtig: Das ist absichtlich keine freie Python-Shell. Tool-Code darf:

- nur auf Snapshot-Daten arbeiten,
- nur JSON-kompatible Resultate liefern,
- keine Live-Core-Objekte veraendern,
- keine unsicheren Python-Mechanismen verwenden.

Damit bleibt Tool-Nutzung ein Analyseinstrument und kein unkontrollierter Escape-Kanal.

## 9. Strukturierte Proposals statt direkter Selbstmutation

Tool-Ergebnisse schreiben keine Live-Parameter direkt um. Stattdessen:

1. Das Tool liefert ein strukturiertes Ergebnis.
2. Daraus entsteht ein `InterventionProposal`.
3. Der `ProposalApplier` wendet nur unter Safety-Kontrolle erlaubte Proposal-Typen an.

Aktuell ist insbesondere `topology_tune` aktiv, d. h. analytische Skripte koennen kontrollierte Vorschlaege fuer `TopologicalLogic.rulebook` erzeugen, ohne die Sicherheitsarchitektur zu umgehen.

## 10. Safety- und Audit-Modell

Die formale Sicherheitsarchitektur ist zentral:

- `SafetyConstraintLayer`: Prueft Ziele, Aktionen und Rewrites gegen harte Grenzen.
- Audit-Journal mit Hash-Kette fuer sensible Uebergaenge.
- Invariantenpruefung fuer Topologie- und Proposal-Operationen.

Wesentliche Schutzprinzipien:

- keine unkontrollierte Rewrite-Frequenz,
- keine riskanten Aktionen bei kritischer Temperatur,
- keine sensiblen Rewrites bei zu geringer metakognitiver Sicherheit,
- keine Verletzung der geschuetzten Kernintegritaet,
- keine Reduktion geschuetzter Kanten ohne Audit und Pruefung.

Dadurch ist Selbstmodifikation erlaubt, aber nicht beliebig.

## 11. Kollektive Intelligenz und Populationsebene

ATHERIA arbeitet nicht nur als Einzelkern:

- `SymbiosisLayer`: Horizontal Gene Transfer fuer Mechanismen und Symbole.
- `AtherCreditMarket`: Inter-Core-Ressourcenmarkt.
- `GlobalMorphicNode`: Kollektive Dream-Synchronisation und Trauma-Echo.
- `SelfReproductionEngine`: Reproduktion, Selektion, Ableger und Artefakt-Erzeugung.

Diese Schicht macht aus einzelnen Kernen eine Population mit:

- Wissensaustausch,
- Ressourcenteilung,
- kollektivem Feldgedaechtnis,
- evolutionaerer Variation.

## Laufzeitmodell

Ein typischer Zyklus in `AtheriaCore` umfasst:

1. Temperatur- und Phasenupdate.
2. Kognitive Vorverarbeitung und Predictive Inhibition.
3. Feld- und Telos-Aktualisierung.
4. Episodische Aufzeichnung und reflektive Deliberation.
5. Exekutive Planung und metakognitive Bewertung.
6. Action-Policy-Ausfuehrung.
7. Diffusion, Faltung, Feld-Imprint, Symbolik und Topologie-Schritt.
8. Optional inter-core Austausch, Evolution und Reproduktion.

Das Ergebnis ist ein kontinuierlicher Regelkreis aus Zustand, Bewertung, Intervention, Lernen und Strukturadaption.

## Schnellstart

## Voraussetzungen

- Python 3.10+
- `torch`
- optional `numpy` fuer weitere Zusatzpfade

## Setup

```bash
python -m venv .venv
# Windows
.venv\Scripts\activate
# macOS/Linux
# source .venv/bin/activate

pip install --upgrade pip setuptools wheel
pip install torch numpy
```

## CLI

```bash
python main.py --help
python main.py demo --duration 3
python main.py meditation --duration 60 --snapshot morphic_snapshot.json
python main.py ceremonial --preheat 10 --duration 60 --snapshot morphic_snapshot.json
```

## Windows-Automation

Die Datei `run_atheria_0_to_100.ps1` fuehrt auf Windows einen End-to-End-Lauf aus:

- Setup
- Build-/Smoke-Checks
- Demo
- Meditation
- Ceremonial Run
- Tests

Voller Lauf:

```powershell
.\run_atheria_0_to_100.ps1
```

Schneller Lauf:

```powershell
.\run_atheria_0_to_100.ps1 -SkipMeditation -SkipCeremonial -DemoDuration 1
```

## Test- und Validierungsstatus

Die zentrale Regression fuer die erweiterten Kollektiv-, Kognitions-, Safety- und Tooling-Faehigkeiten liegt in:

- `tests/test_collective_extensions.py`

Ausgefuehrt wurde zuletzt erfolgreich:

```powershell
python -m unittest tests.test_collective_extensions
```

Vom Nutzer verifizierter Lauf am 2. Maerz 2026:

```text
Ran 22 tests in 0.753s

OK
```

Die Test-Suite deckt insbesondere ab:

- HGT-Symbiose und Inter-Core-Wissensaustausch,
- Ather-Credit-Markt,
- kollektives Dream-Sync,
- Dream-Forward und Wissensluecken-Schliessung,
- morphische Analogie und Bridge-HGT,
- epigenetische Langzeit-Templates,
- Predictive Inhibition und Surprise-Controller,
- Symbolgrounding und Symbol-HGT,
- rekursive Topologie-Selbstmodifikation,
- Executive Planning, episodisches Gedaechtnis, Metakognition,
- Action-Policy, Causal Interventions, Safety Constraints,
- AST-gepruefte Tool-Nutzung, Proposal-Apply und Safety-Audit,
- reflektive, episodiengetriebene Python-Analyse.

## Projektstatus und Einordnung

ATHERIA ist ein stark erweitertes, experimentelles Agentensystem mit:

- internen Feldmodellen,
- strukturierter Selbstbeobachtung,
- expliziter Zielsteuerung,
- sicherheitsgepruefter Tool-Nutzung,
- kontrollierter Selbstmodifikation.

Es ist damit deutlich naeher an allgemeiner agentischer Architektur als ein rein reaktives Simulationssystem. Gleichzeitig bleibt es ein Forschungs-Framework:

- keine formale Aussage ueber "AGI-Prozentwerte",
- keine Garantie fuer reale Weltrobustheit,
- keine Freigabe fuer unkontrollierte autonome Produktionseinsaetze.

Fuer Forschung, Architekturtests, Sicherheitsdesign und agentische Runtime-Experimente ist die Codebasis jedoch inzwischen substanziell und intern konsistent.

## DEMO Program Forge

Der Ordner `DEMO` enthaelt einen Generator fuer ausfuehrbare Kind-Programme (Profile, Hashing/Signatur, Harness).

```bash
python DEMO/forge_executable.py --name demo_child --profile survival --output-dir DEMO/generated --run-harness
```

Details: `DEMO/README.md`, `DEMO/Dokumentation.md`

<!-- docs-sync:2026-03-05 -->
## Dokumentations-Sync 2026-03-05

- Finance-Realdatenpfad aktualisiert: Provider-Fallback yahoo -> stooq.
- Daemon-Auditintervall aktualisiert: technisches Minimum 10s.
- Future-Projection-Diagnostik erweitert (has_supervised_fit, Datenabdeckung, Proxy-Anteil).
