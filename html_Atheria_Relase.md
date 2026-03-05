# CodeDump for Project: `html_Atheria_Relase.zip`

_Generated on 2026-03-05T13:15:59.229Z_

## File: `chronik.html`  
- Path: `chronik.html`  
- Size: 12263 Bytes  
- Modified: 2026-03-05 14:03:26 UTC

```html
<!doctype html>
<html lang="de">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Aion-Chronik</title>
  <style>
    :root {
      --bg: #f6f1e8;
      --paper: #fffdf8;
      --ink: #18222d;
      --muted: #66727f;
      --line: #d8cdbd;
      --ok: #2c7a4b;
      --warn: #b7791f;
      --bad: #a43636;
      --reset: #0f6b78;
      --accent: #d7b66f;
    }
    * { box-sizing: border-box; }
    body {
      margin: 0;
      font-family: Georgia, "Times New Roman", serif;
      background:
        radial-gradient(circle at top right, rgba(215,182,111,0.28), transparent 32%),
        linear-gradient(180deg, #efe4cf, var(--bg));
      color: var(--ink);
    }
    .wrap {
      max-width: 1100px;
      margin: 0 auto;
      padding: 32px 20px 64px;
    }
    .topbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 12px;
      margin-bottom: 18px;
      padding: 10px 14px;
      border-radius: 16px;
      border: 1px solid var(--line);
      background: rgba(255,253,248,0.82);
      box-shadow: 0 10px 24px rgba(24,34,45,0.05);
    }
    .nav-links {
      display: flex;
      flex-wrap: wrap;
      gap: 10px;
    }
    .nav-link {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      min-height: 38px;
      padding: 8px 14px;
      border-radius: 999px;
      border: 1px solid rgba(24,34,45,0.08);
      color: var(--ink);
      text-decoration: none;
      text-transform: uppercase;
      letter-spacing: 0.08em;
      font-size: 0.76rem;
      font-weight: 700;
      background: rgba(24,34,45,0.03);
    }
    .nav-link.active {
      color: #f8f2e7;
      background: linear-gradient(135deg, rgba(24,34,45,0.95), rgba(15,107,120,0.92));
      border-color: rgba(255,248,231,0.08);
    }
    .topbar-note {
      font-size: 0.82rem;
      color: var(--muted);
    }
    .hero {
      background: linear-gradient(135deg, rgba(24,34,45,0.95), rgba(15,107,120,0.92));
      color: #f8f2e7;
      padding: 28px;
      border-radius: 18px;
      box-shadow: 0 20px 40px rgba(24,34,45,0.18);
      margin-bottom: 28px;
    }
    .hero-kicker {
      text-transform: uppercase;
      letter-spacing: 0.12em;
      font-size: 0.78rem;
      opacity: 0.78;
    }
    h1, h2, h3 { margin: 0 0 10px; line-height: 1.15; }
    h1 { font-size: clamp(1.7rem, 3vw, 2.7rem); }
    h2 { font-size: 1.3rem; margin-bottom: 16px; }
    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
      gap: 16px;
      margin-bottom: 32px;
    }
    .card, .entry {
      background: rgba(255,253,248,0.92);
      border: 1px solid var(--line);
      border-radius: 16px;
      padding: 18px;
      box-shadow: 0 10px 24px rgba(24,34,45,0.06);
    }
    .badge {
      display: inline-block;
      padding: 4px 10px;
      border-radius: 999px;
      font-size: 0.76rem;
      font-weight: 700;
      letter-spacing: 0.04em;
      margin-bottom: 10px;
      background: rgba(24,34,45,0.08);
    }
    .badge.ok, .entry.ok .verify { color: var(--ok); }
    .badge.warn, .entry.warn .verify { color: var(--warn); }
    .badge.bad, .entry.bad .verify { color: var(--bad); }
    .badge.reset, .entry.reset .verify { color: var(--reset); }
    .entry-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 16px;
    }
    .entry.ok { border-left: 5px solid var(--ok); }
    .entry.warn { border-left: 5px solid var(--warn); }
    .entry.bad { border-left: 5px solid var(--bad); }
    .entry.reset { border-left: 5px solid var(--reset); }
    .entry.muted { border-left: 5px solid var(--muted); }
    .verify {
      font-size: 0.9rem;
      font-weight: 700;
    }
    .discovery {
      color: #5f4312;
      background: rgba(215,182,111,0.16);
      border-radius: 12px;
      padding: 10px 12px;
    }
    .section-title {
      margin: 26px 0 14px;
      color: var(--muted);
      text-transform: uppercase;
      letter-spacing: 0.08em;
      font-size: 0.76rem;
      font-weight: 700;
    }
  </style>
</head>
<body>
  <div class="wrap">
    <nav class="topbar" aria-label="Ansichten">
      <div class="nav-links">
        <a class="nav-link active" id="nav-chronik" href="chronik.html">Chronik</a>
        <a class="nav-link" id="nav-finance" href="finance_dashboard.html">Atheria-Finance</a>
      </div>
      <div class="topbar-note" id="topbar-note">Verknuepft mit der Finance-Ansicht</div>
    </nav>
    <section class="hero"><div class="hero-kicker">Letzter Zustand</div><h1>ATHERIA erwachte und band sich an den Markt (Profil: finance, Transport: poll). Temperatur 25.00, Ressourcen 3.00.</h1><p>Signatur verifiziert</p></section>
    <div class="section-title">Inter-Core-Resonanz</div><div class="grid"><section class="card" id="chronik-resonance-card"><div class="badge reset" id="chronik-resonance-badge">Wartet</div><p id="chronik-resonance-statement">Noch keine gelernte Invariante im Resonanz-Journal gefunden.</p><p class="verify" id="chronik-resonance-meta">Erwartet unter core_audit/*_inter_core_resonance.jsonl</p><p class="verify" id="chronik-resonance-source"></p></section></div>
    <div class="section-title">Tageszusammenfassung</div>
    <div class="grid">
      <section class="card"><div class="badge ok">2026-03-05</div><p>2026-03-05: 1 Eintraege | 1 Start | 0 Stop | 0 Audits | 0 Alerts | 0 Anomalien | max. Trauma 0.00</p></section>
    </div>
    <div class="section-title">Chronik</div>
    <div class="entry-grid">
      <article class="entry ok"><h3>2026-03-05 14:03:23</h3><p>ATHERIA erwachte und band sich an den Markt (Profil: finance, Transport: poll). Temperatur 25.00, Ressourcen 3.00.</p><p class="verify">Signatur verifiziert</p></article>
    </div>
  </div>
  
  <script>
    (function () {
      var defaultReportDir = "D:/Atheria-main/Atheria_Relase/daemon_runtime";
      var reportDir = resolveReportDir(defaultReportDir);
      var navChronik = document.getElementById("nav-chronik");
      var navFinance = document.getElementById("nav-finance");
      var topbarNote = document.getElementById("topbar-note");
      var resonanceBadge = document.getElementById("chronik-resonance-badge");
      var resonanceStatement = document.getElementById("chronik-resonance-statement");
      var resonanceMeta = document.getElementById("chronik-resonance-meta");
      var resonanceSource = document.getElementById("chronik-resonance-source");

      function resolveReportDir(fallback) {
        var raw = "";
        try {
          raw = String(new URLSearchParams(window.location.search).get("reportDir") || "");
        } catch (error) {
          raw = "";
        }
        raw = raw.trim().replace(/\\/g, "/");
        raw = raw.split("/").filter(function (part) {
          return part && part !== "." && part !== "..";
        }).join("/");
        return raw || fallback;
      }

      function parseLatestJsonLine(text) {
        var lines = String(text || "").split(/\r?\n/);
        for (var index = lines.length - 1; index >= 0; index -= 1) {
          var line = lines[index].trim();
          if (!line) {
            continue;
          }
          try {
            return JSON.parse(line);
          } catch (error) {
            continue;
          }
        }
        return null;
      }

      function setBadge(tone, text) {
        if (!resonanceBadge) {
          return;
        }
        resonanceBadge.className = "badge " + tone;
        resonanceBadge.textContent = text;
      }

      function applyViewContext(activeReportDir) {
        var suffix = activeReportDir === defaultReportDir
          ? ""
          : ("?reportDir=" + encodeURIComponent(activeReportDir));
        if (navChronik) {
          navChronik.href = "chronik.html" + suffix;
        }
        if (navFinance) {
          navFinance.href = "finance_dashboard.html" + suffix;
        }
        if (topbarNote) {
          if (activeReportDir === defaultReportDir) {
            topbarNote.textContent = "Verknuepft mit der Finance-Ansicht | Report-Root " + activeReportDir;
          } else {
            topbarNote.textContent =
              "Statische Chronik aus " + defaultReportDir + " | Resonanz-Overlay liest " + activeReportDir;
          }
        }
      }

      function setResonanceFallback(message, activeReportDir) {
        setBadge("reset", "Wartet");
        if (resonanceStatement) {
          resonanceStatement.textContent = message;
        }
        if (resonanceMeta) {
          resonanceMeta.textContent =
            "Erwartet unter " + activeReportDir + "/core_audit/<core_id>_inter_core_resonance.jsonl";
        }
        if (resonanceSource) {
          resonanceSource.textContent = "";
        }
      }

      function updateResonance(record, resonanceFile) {
        if (!record || !record.invariant) {
          setResonanceFallback("Resonanz-Datei gefunden, aber noch ohne auswertbare Invariante.", reportDir);
          return;
        }
        var invariant = record.invariant || {};
        var confidence = Number(invariant.confidence || 0);
        var tone = confidence >= 0.75 ? "ok" : "warn";
        var triggerAsset = String(invariant.trigger_asset || "MARKET");
        var targetAsset = String(invariant.target_asset || "BTC");
        var lagMinutes = Number(invariant.lag_minutes || 0);
        var effectSize = Number(invariant.mean_effect_size || 0);
        var samples = Math.round(Number(invariant.samples || 0));
        setBadge(tone, "Invariante");
        if (resonanceStatement) {
          resonanceStatement.textContent = String(
            invariant.statement ||
            ("Wenn " + triggerAsset + " triggert, reagiert " + targetAsset + " nach " + lagMinutes + " Minuten.")
          );
        }
        if (resonanceMeta) {
          resonanceMeta.textContent =
            "Confidence " + Math.round(confidence * 100) + "%, Effekt " + effectSize.toFixed(3) +
            ", Samples " + samples + ", Lag " + lagMinutes.toFixed(0) + " min.";
        }
        if (resonanceSource) {
          resonanceSource.textContent = "Quelle: " + resonanceFile;
        }
      }

      function loadResonance(activeReportDir) {
        var auditFile = activeReportDir + "/atheria_daemon_audit.jsonl";
        fetch(auditFile, { cache: "no-store" })
          .then(function (response) {
            if (!response.ok) {
              throw new Error("HTTP " + response.status);
            }
            return response.text();
          })
          .then(function (text) {
            var entry = parseLatestJsonLine(text);
            var coreId = String(entry && entry.core_id || "").trim().toLowerCase();
            if (!coreId) {
              setResonanceFallback(
                "Kein `core_id` im Daemon-Report gefunden. Resonanz-Journal kann nicht aufgeloest werden.",
                activeReportDir
              );
              return;
            }
            var resonanceFile = activeReportDir + "/core_audit/" + coreId + "_inter_core_resonance.jsonl";
            return fetch(resonanceFile, { cache: "no-store" })
              .then(function (resonanceResponse) {
                if (!resonanceResponse.ok) {
                  throw new Error("HTTP " + resonanceResponse.status);
                }
                return resonanceResponse.text();
              })
              .then(function (resonanceText) {
                updateResonance(parseLatestJsonLine(resonanceText), resonanceFile);
              });
          })
          .catch(function () {
            setResonanceFallback(
              "Resonanz-Overlay konnte fuer den gewaehlten Report-Root nicht geladen werden.",
              activeReportDir
            );
          });
      }

      applyViewContext(reportDir);
      loadResonance(reportDir);
    }());
  </script>

</body>
</html>

```

## File: `einstein_like_proof.html`  
- Path: `einstein_like_proof.html`  
- Size: 31227 Bytes  
- Modified: 2026-03-05 14:06:34 UTC

```html
<!doctype html>
<html lang="de">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Atheria Einstein-like Proof</title>
  <style>
    :root {
      --bg: #ece8de;
      --paper: #fffaf2;
      --ink: #15232d;
      --muted: #63707a;
      --line: rgba(21, 35, 45, 0.14);
      --ok: #20774a;
      --warn: #ad6a1e;
      --bad: #9d2f2f;
      --accent: #0c5b72;
      --shadow: 0 14px 30px rgba(21, 35, 45, 0.14);
    }

    * { box-sizing: border-box; }
    body {
      margin: 0;
      color: var(--ink);
      font-family: Georgia, "Palatino Linotype", "Book Antiqua", serif;
      background:
        radial-gradient(circle at 13% 10%, rgba(198, 154, 84, 0.16), transparent 26%),
        radial-gradient(circle at 84% 8%, rgba(18, 114, 141, 0.13), transparent 22%),
        linear-gradient(180deg, #ebe4d5, var(--bg));
    }

    .shell {
      width: min(1220px, calc(100% - 32px));
      margin: 0 auto;
      padding: 24px 0 54px;
    }

    .hero {
      border-radius: 24px;
      padding: 24px;
      margin-bottom: 16px;
      color: #f6f2e8;
      background: linear-gradient(128deg, rgba(17, 30, 42, 0.96), rgba(12, 91, 114, 0.92) 56%, rgba(173, 106, 30, 0.87));
      box-shadow: var(--shadow);
    }
    .eyebrow {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      border: 1px solid rgba(246, 242, 232, 0.26);
      border-radius: 999px;
      padding: 6px 12px;
      font-size: 0.74rem;
      letter-spacing: 0.1em;
      text-transform: uppercase;
      margin-bottom: 12px;
      color: rgba(246, 242, 232, 0.84);
    }
    h1, h2, h3, p { margin: 0; }
    h1 {
      font-size: clamp(1.8rem, 4.2vw, 3.2rem);
      line-height: 0.95;
      margin-bottom: 10px;
      max-width: 14ch;
    }
    .hero p {
      line-height: 1.52;
      color: rgba(246, 242, 232, 0.9);
      max-width: 78ch;
    }
    code {
      font-family: Consolas, "Courier New", monospace;
      background: rgba(255, 255, 255, 0.16);
      border-radius: 6px;
      padding: 1px 6px;
      font-size: 0.9em;
    }

    .layout {
      display: grid;
      grid-template-columns: 1.2fr 0.8fr;
      gap: 16px;
    }
    .stack {
      display: grid;
      gap: 16px;
      align-content: start;
    }
    .panel {
      border-radius: 18px;
      border: 1px solid var(--line);
      background: var(--paper);
      box-shadow: 0 8px 18px rgba(21, 35, 45, 0.06);
      padding: 16px;
    }
    .panel h2 {
      font-size: 1.1rem;
      margin-bottom: 12px;
    }
    .panel-head {
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 10px;
      flex-wrap: wrap;
      margin-bottom: 10px;
    }
    .controls {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      flex-wrap: wrap;
    }
    .btn {
      border: 1px solid var(--line);
      background: #fffdf8;
      color: var(--ink);
      border-radius: 999px;
      padding: 6px 11px;
      font-size: 0.78rem;
      letter-spacing: 0.04em;
      text-transform: uppercase;
      cursor: pointer;
      font-weight: 700;
    }
    .btn:hover {
      border-color: rgba(12, 91, 114, 0.45);
      background: rgba(12, 91, 114, 0.08);
    }
    .toggle {
      display: inline-flex;
      align-items: center;
      gap: 6px;
      color: var(--muted);
      font-size: 0.8rem;
      user-select: none;
    }

    .proof {
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 10px;
      border-radius: 12px;
      border: 1px solid var(--line);
      background: #fffdf7;
      padding: 12px 14px;
      margin-bottom: 14px;
    }
    .badge {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      min-width: 110px;
      border-radius: 999px;
      padding: 6px 12px;
      font-size: 0.8rem;
      letter-spacing: 0.06em;
      text-transform: uppercase;
      font-weight: 700;
    }
    .badge.ok { color: var(--ok); background: rgba(32, 119, 74, 0.14); }
    .badge.warn { color: var(--warn); background: rgba(173, 106, 30, 0.14); }
    .badge.bad { color: var(--bad); background: rgba(157, 47, 47, 0.14); }

    .metrics {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(130px, 1fr));
      gap: 10px;
    }
    .metric {
      border: 1px solid var(--line);
      border-radius: 12px;
      background: #fffdf8;
      padding: 10px;
    }
    .metric .label {
      color: var(--muted);
      font-size: 0.75rem;
      text-transform: uppercase;
      letter-spacing: 0.08em;
      margin-bottom: 5px;
    }
    .metric .value {
      color: var(--accent);
      font-size: 1.16rem;
      font-weight: 700;
    }
    .meta {
      margin-top: 12px;
      color: var(--muted);
      font-size: 0.88rem;
      line-height: 1.48;
    }

    .canvas-wrap {
      border: 1px solid var(--line);
      border-radius: 14px;
      padding: 10px;
      background:
        radial-gradient(circle at 18% 20%, rgba(57, 201, 255, 0.09), transparent 34%),
        radial-gradient(circle at 82% 82%, rgba(109, 240, 191, 0.11), transparent 28%),
        linear-gradient(180deg, rgba(6, 30, 46, 0.9), rgba(9, 42, 56, 0.88));
      position: relative;
    }
    #proof-canvas {
      width: 100%;
      height: 420px;
      display: block;
      border-radius: 10px;
      background: transparent;
      touch-action: none;
      cursor: grab;
    }
    #proof-canvas.dragging { cursor: grabbing; }

    .tip {
      position: fixed;
      z-index: 20;
      pointer-events: none;
      display: none;
      max-width: 340px;
      padding: 7px 9px;
      border-radius: 9px;
      background: rgba(17, 33, 45, 0.92);
      color: #f1f5f7;
      font-size: 0.78rem;
      line-height: 1.35;
      border: 1px solid rgba(241, 245, 247, 0.2);
      box-shadow: 0 10px 22px rgba(0, 0, 0, 0.26);
    }

    .list {
      display: grid;
      gap: 8px;
      max-height: 300px;
      overflow: auto;
      padding-right: 4px;
    }
    .item {
      border: 1px solid var(--line);
      border-radius: 10px;
      background: #fffdf8;
      padding: 9px 10px;
      font-size: 0.9rem;
      line-height: 1.42;
    }
    .item small {
      display: block;
      margin-top: 3px;
      color: var(--muted);
      font-size: 0.78rem;
    }

    .footer {
      margin-top: 16px;
      color: var(--muted);
      font-size: 0.85rem;
      line-height: 1.55;
      padding: 12px 14px;
      border-radius: 14px;
      border: 1px solid var(--line);
      background: rgba(255, 252, 246, 0.76);
    }

    @media (max-width: 980px) {
      .layout { grid-template-columns: 1fr; }
      #proof-canvas { height: 300px; }
    }
  </style>
</head>
<body>
  <main class="shell">
    <section class="hero">
      <div class="eyebrow">Information -> Effective Geometry</div>
      <h1>Einstein-like Rekonstruktion: Proof-Dashboard</h1>
      <p>
        Die Ansicht verarbeitet <code>atheria_information_einstein_like.py</code> und zeigt,
        ob aus Informationsdynamik gravitationsähnliche Effekte (Potential, Deflektion, Lensing) entstehen.
      </p>
    </section>

    <section class="layout">
      <div class="stack">
        <section class="panel">
          <h2>Beweisstatus</h2>
          <div class="proof">
            <div>
              <strong id="proof-title">Warte auf Einstein-like Daten...</strong>
              <div class="meta" id="proof-text">
                Erwartete Datei: <code id="json-path">runtime_audit/einstein_like_reconstruction.json</code>
              </div>
            </div>
            <span class="badge warn" id="proof-badge">Pending</span>
          </div>

          <div class="metrics">
            <article class="metric">
              <div class="label">Events</div>
              <div class="value" id="m-events">-</div>
            </article>
            <article class="metric">
              <div class="label">Stress</div>
              <div class="value" id="m-stress">-</div>
            </article>
            <article class="metric">
              <div class="label">Source-Phi Corr</div>
              <div class="value" id="m-corr">-</div>
            </article>
            <article class="metric">
              <div class="label">Deflection</div>
              <div class="value" id="m-deflect">-</div>
            </article>
            <article class="metric">
              <div class="label">Lensing Ratio</div>
              <div class="value" id="m-lens">-</div>
            </article>
            <article class="metric">
              <div class="label">g00 Range</div>
              <div class="value" id="m-g00">-</div>
            </article>
          </div>
          <div class="meta" id="window-line"></div>
        </section>

        <section class="panel">
          <div class="panel-head">
            <h2>Holo-Raumzeit (3D)</h2>
            <div class="controls">
              <button class="btn" id="btn-auto" type="button">Auto-Rotate: On</button>
              <button class="btn" id="btn-reset" type="button">Reset View</button>
              <label class="toggle">
                <input id="toggle-paths" type="checkbox" checked>
                Probe-Pfade
              </label>
            </div>
          </div>
          <div class="canvas-wrap">
            <canvas id="proof-canvas" width="760" height="420" aria-label="Einstein-like Holoansicht"></canvas>
          </div>
          <div class="meta">
            Ziehen fuer Rotation, Mausrad fuer Zoom, Hover auf Ereignisse fuer Details.
          </div>
        </section>
      </div>

      <aside class="stack">
        <section class="panel">
          <h2>Invarianten</h2>
          <div class="list" id="inv-list">
            <article class="item">Keine Invarianten geladen.</article>
          </div>
        </section>

        <section class="panel">
          <h2>Top-Attractors</h2>
          <div class="list" id="attr-list">
            <article class="item">Keine Attractors geladen.</article>
          </div>
        </section>

        <section class="panel">
          <h2>Probe-Spektrum</h2>
          <div class="list" id="probe-list">
            <article class="item">Keine Probes geladen.</article>
          </div>
        </section>
      </aside>
    </section>

    <section class="footer">
      Startsequenz:
      <code>powershell -NoProfile -ExecutionPolicy Bypass -File .\run_information_einstein_like.ps1 -ReportFile ..\daemon_runtime\atheria_daemon_audit.jsonl -JsonOut .\runtime_audit\einstein_like_reconstruction.json</code>
    </section>
  </main>

  <div class="tip" id="plot-tip"></div>

  <script>
    (function () {
      var params = new URLSearchParams(window.location.search || "");
      var jsonPath = String(params.get("json") || "runtime_audit/einstein_like_reconstruction.json").trim();

      var proofTitle = document.getElementById("proof-title");
      var proofText = document.getElementById("proof-text");
      var proofBadge = document.getElementById("proof-badge");
      var jsonPathNode = document.getElementById("json-path");
      var mEvents = document.getElementById("m-events");
      var mStress = document.getElementById("m-stress");
      var mCorr = document.getElementById("m-corr");
      var mDeflect = document.getElementById("m-deflect");
      var mLens = document.getElementById("m-lens");
      var mG00 = document.getElementById("m-g00");
      var windowLine = document.getElementById("window-line");
      var invList = document.getElementById("inv-list");
      var attrList = document.getElementById("attr-list");
      var probeList = document.getElementById("probe-list");
      var canvas = document.getElementById("proof-canvas");
      var tip = document.getElementById("plot-tip");
      var btnAuto = document.getElementById("btn-auto");
      var btnReset = document.getElementById("btn-reset");
      var togglePaths = document.getElementById("toggle-paths");
      var ctx = canvas ? canvas.getContext("2d") : null;

      var view = {
        yaw: 0.55,
        pitch: -0.35,
        distance: 3.15,
        autoRotate: true,
        dragging: false,
        dragX: 0,
        dragY: 0,
        hoverIndex: -1,
        projected: [],
        lastTs: 0,
        showPaths: true
      };
      var scene = {
        points: [],
        paths: [],
        pathMeta: [],
        hasData: false
      };
      var animHandle = 0;

      if (jsonPathNode) {
        jsonPathNode.textContent = jsonPath;
      }

      function fmt(value, digits) {
        var n = Number(value);
        return Number.isFinite(n) ? n.toFixed(digits) : "-";
      }

      function clamp(value, low, high) {
        return Math.min(high, Math.max(low, value));
      }

      function setBadge(tone, text) {
        proofBadge.className = "badge " + tone;
        proofBadge.textContent = text;
      }

      function placeTip(clientX, clientY) {
        var offset = 12;
        var left = clientX + offset;
        var top = clientY + offset;
        var maxLeft = window.innerWidth - tip.offsetWidth - 8;
        var maxTop = window.innerHeight - tip.offsetHeight - 8;
        tip.style.left = String(Math.max(8, Math.min(maxLeft, left))) + "px";
        tip.style.top = String(Math.max(8, Math.min(maxTop, top))) + "px";
      }

      function showTip(text, clientX, clientY) {
        tip.textContent = text;
        tip.style.display = "block";
        placeTip(clientX, clientY);
      }

      function hideTip() {
        tip.style.display = "none";
      }

      function fitCanvas() {
        if (!canvas || !ctx) {
          return { w: 0, h: 0 };
        }
        var dpr = Math.max(1, window.devicePixelRatio || 1);
        var w = Math.max(1, Math.round(canvas.clientWidth || 760));
        var h = Math.max(1, Math.round(canvas.clientHeight || 420));
        var rw = Math.round(w * dpr);
        var rh = Math.round(h * dpr);
        if (canvas.width !== rw || canvas.height !== rh) {
          canvas.width = rw;
          canvas.height = rh;
        }
        ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
        return { w: w, h: h };
      }

      function project(point, w, h) {
        var cosY = Math.cos(view.yaw);
        var sinY = Math.sin(view.yaw);
        var cosX = Math.cos(view.pitch);
        var sinX = Math.sin(view.pitch);

        var rx = point.x * cosY - point.z * sinY;
        var rz = point.x * sinY + point.z * cosY;
        var ry = point.y * cosX - rz * sinX;
        var rz2 = point.y * sinX + rz * cosX;

        var depth = clamp(view.distance - rz2, 0.3, 40);
        var focal = Math.min(w, h) * 0.66;
        var scale = focal / depth;
        return {
          x: w * 0.5 + rx * scale,
          y: h * 0.5 - ry * scale,
          z: rz2,
          depth: depth
        };
      }

      function prepareScene(payload) {
        var points = Array.isArray(payload.points) ? payload.points : [];
        var probes = Array.isArray(payload.probes) ? payload.probes : [];
        if (!points.length) {
          scene.points = [];
          scene.paths = [];
          scene.pathMeta = [];
          scene.hasData = false;
          return;
        }

        var all = [];
        for (var i = 0; i < points.length; i += 1) {
          var p = points[i];
          var s = Array.isArray(p.spatial) ? p.spatial : [0, 0, 0];
          all.push([Number(s[0]) || 0, Number(s[1]) || 0, Number(s[2]) || 0]);
        }
        for (var j = 0; j < probes.length; j += 1) {
          var path = Array.isArray(probes[j].path) ? probes[j].path : [];
          for (var k = 0; k < path.length; k += 1) {
            all.push([
              Number(path[k][0]) || 0,
              Number(path[k][1]) || 0,
              Number(path[k][2]) || 0
            ]);
          }
        }

        var maxR = 0.0001;
        for (var t = 0; t < all.length; t += 1) {
          var row = all[t];
          var r = Math.sqrt(row[0] * row[0] + row[1] * row[1] + row[2] * row[2]);
          if (r > maxR) {
            maxR = r;
          }
        }
        var scale = 1 / maxR;

        scene.points = points.map(function (p) {
          var s = Array.isArray(p.spatial) ? p.spatial : [0, 0, 0];
          return {
            eventId: String(p.event_id || "event"),
            x: (Number(s[0]) || 0) * scale,
            y: (Number(s[1]) || 0) * scale,
            z: (Number(s[2]) || 0) * scale,
            mass: Number(p.mass) || 0,
            potential: Number(p.potential) || 0,
            entropy: Number(p.entropy) || 0,
            curvature: Number(p.curvature_proxy) || 0
          };
        });

        scene.paths = probes.map(function (probe) {
          var path = Array.isArray(probe.path) ? probe.path : [];
          return path.map(function (row) {
            return {
              x: (Number(row[0]) || 0) * scale,
              y: (Number(row[1]) || 0) * scale,
              z: (Number(row[2]) || 0) * scale
            };
          });
        });
        scene.pathMeta = probes.map(function (probe) {
          return {
            probeId: String(probe.probe_id || "probe"),
            deflection: Number(probe.deflection_deg) || 0
          };
        });
        scene.hasData = scene.points.length > 0;
      }

      function drawAxes(w, h) {
        var axes = [
          { x: 1, y: 0, z: 0, color: "rgba(255, 143, 123, 0.72)" },
          { x: 0, y: 1, z: 0, color: "rgba(132, 232, 169, 0.72)" },
          { x: 0, y: 0, z: 1, color: "rgba(124, 197, 255, 0.72)" }
        ];
        for (var i = 0; i < axes.length; i += 1) {
          var origin = project({ x: 0, y: 0, z: 0 }, w, h);
          var tipPoint = project(axes[i], w, h);
          ctx.beginPath();
          ctx.strokeStyle = axes[i].color;
          ctx.lineWidth = 1.2;
          ctx.moveTo(origin.x, origin.y);
          ctx.lineTo(tipPoint.x, tipPoint.y);
          ctx.stroke();
        }
      }

      function drawScene() {
        if (!ctx || !canvas) {
          return;
        }
        var size = fitCanvas();
        var w = size.w;
        var h = size.h;
        ctx.clearRect(0, 0, w, h);

        drawAxes(w, h);
        if (!scene.hasData) {
          view.projected = [];
          return;
        }

        if (view.showPaths) {
          for (var i = 0; i < scene.paths.length; i += 1) {
            var path = scene.paths[i];
            if (path.length < 2) {
              continue;
            }
            var deflection = scene.pathMeta[i] ? scene.pathMeta[i].deflection : 0;
            var hue = clamp(188 - deflection * 7, 12, 200);
            ctx.beginPath();
            for (var j = 0; j < path.length; j += 1) {
              var proj = project(path[j], w, h);
              if (j === 0) {
                ctx.moveTo(proj.x, proj.y);
              } else {
                ctx.lineTo(proj.x, proj.y);
              }
            }
            ctx.strokeStyle = "hsla(" + hue.toFixed(0) + ", 82%, 64%, 0.25)";
            ctx.lineWidth = 1.0;
            ctx.stroke();
          }
        }

        var projected = scene.points.map(function (p, index) {
          var proj = project(p, w, h);
          return {
            index: index,
            eventId: p.eventId,
            mass: p.mass,
            potential: p.potential,
            entropy: p.entropy,
            curvature: p.curvature,
            x: proj.x,
            y: proj.y,
            depth: proj.depth
          };
        });
        projected.sort(function (a, b) { return b.depth - a.depth; });

        for (var k = 0; k < projected.length; k += 1) {
          var point = projected[k];
          var hover = point.index === view.hoverIndex;
          var radius = clamp((1.08 / point.depth) * 8.5, 2.0, 8.8) + (hover ? 1.8 : 0);
          var alpha = clamp(1.02 - point.depth * 0.21, 0.25, 0.95);
          var massGlow = clamp(point.mass * 100, 0, 100);
          var hue = clamp(205 - massGlow * 1.35, 24, 205);

          ctx.beginPath();
          ctx.fillStyle = hover
            ? "rgba(255, 215, 141, 0.96)"
            : "hsla(" + hue.toFixed(0) + ", 82%, 62%, " + alpha.toFixed(3) + ")";
          ctx.strokeStyle = hover ? "rgba(255, 249, 236, 0.95)" : "rgba(6, 30, 44, 0.74)";
          ctx.lineWidth = hover ? 2.1 : 1.0;
          ctx.arc(point.x, point.y, radius, 0, Math.PI * 2);
          ctx.fill();
          ctx.stroke();
        }

        view.projected = projected;
      }

      function renderInvariants(invariants) {
        if (!Array.isArray(invariants) || invariants.length === 0) {
          invList.innerHTML = "<article class='item'>Keine Invarianten geladen.</article>";
          return;
        }
        invList.innerHTML = invariants.map(function (inv) {
          var status = String(inv.status || "weak");
          var tone = status === "ok" ? "ok" : "warn";
          return (
            "<article class='item'><strong>" + String(inv.name || "Invariant") + "</strong>" +
            "<small><span class='badge " + tone + "' style='min-width:0;padding:2px 8px;margin-right:6px;'>" + status + "</span>" +
            " " + String(inv.formula || "") + " = " + fmt(inv.value, 4) + "</small></article>"
          );
        }).join("");
      }

      function renderAttractors(items) {
        if (!Array.isArray(items) || items.length === 0) {
          attrList.innerHTML = "<article class='item'>Keine Attractors geladen.</article>";
          return;
        }
        attrList.innerHTML = items.map(function (item, index) {
          return (
            "<article class='item'><strong>#" + (index + 1) + " " + String(item.event_id || "?") + "</strong>" +
            "<small>mass=" + fmt(item.mass, 4) + " | potential=" + fmt(item.potential, 4) +
            " | entropy=" + fmt(item.entropy, 4) + "</small></article>"
          );
        }).join("");
      }

      function renderProbes(probes) {
        if (!Array.isArray(probes) || probes.length === 0) {
          probeList.innerHTML = "<article class='item'>Keine Probes geladen.</article>";
          return;
        }
        var sorted = probes.slice().sort(function (a, b) {
          return (Number(b.deflection_deg) || 0) - (Number(a.deflection_deg) || 0);
        });
        probeList.innerHTML = sorted.slice(0, 20).map(function (probe) {
          return (
            "<article class='item'><strong>" + String(probe.probe_id || "probe") + "</strong>" +
            "<small>delta=" + fmt(probe.deflection_deg, 3) + " deg | arc=" + fmt(probe.arc_length, 3) +
            " | z~" + fmt(probe.redshift_proxy, 3) + "</small></article>"
          );
        }).join("");
      }

      function renderStatus(payload) {
        var quality = payload.quality || {};
        var fields = payload.field_summary || {};
        var points = Array.isArray(payload.points) ? payload.points : [];
        var modeName = String(quality.mode || fields.mode || "standard");
        var coupling = Number(quality.coupling_strength);
        if (!Number.isFinite(coupling)) {
          coupling = Number(fields.coupling_strength);
        }
        var autoTuneUsed = Boolean(quality.auto_tune_used || fields.auto_tune_used);
        var autoTrials = Number(quality.auto_tune_trials || fields.auto_tune_trials || 0);
        var verdict = String(quality.verdict || "Weak");
        if (quality.verified === true || verdict === "Verified") {
          setBadge("ok", "Verified");
          proofTitle.textContent = "Einstein-like Effekt sichtbar: Informationsfeld erzeugt kohärente Deflektion.";
          proofText.textContent = "Quell-Potential-Kopplung, Lensing und Geodätik liegen im Zielbereich.";
        } else if (verdict === "Partial") {
          setBadge("warn", "Partial");
          proofTitle.textContent = "Einstein-like Effekt teilweise stabil.";
          proofText.textContent = "Geometrie reagiert bereits, aber mindestens ein Qualitätskriterium bleibt unter Zielwert.";
        } else {
          setBadge("bad", "Weak");
          proofTitle.textContent = "Noch kein robuster Einstein-like Nachweis.";
          proofText.textContent = "Mehr Events oder längere Probe-Integration erhöhen die Aussagekraft.";
        }

        mEvents.textContent = String(quality.event_count || points.length || 0);
        mStress.textContent = fmt(quality.stress, 4);
        mCorr.textContent = fmt(quality.mass_potential_correlation, 4);
        mDeflect.textContent = fmt(quality.mean_deflection_deg, 3) + " deg";
        mLens.textContent = fmt(quality.lensing_ratio, 3) + " (> " + fmt(quality.lensing_threshold_deg, 1) + " deg)";
        mG00.textContent = fmt(fields.g00_min, 3) + " .. " + fmt(fields.g00_max, 3);

        if (points.length > 1) {
          windowLine.textContent =
            "Zeitfenster: " + fmt(points[0].timestamp, 3) + " -> " + fmt(points[points.length - 1].timestamp, 3) +
            " | Modus: " + modeName +
            " | Kopplung: " + fmt(coupling, 3) +
            (autoTuneUsed ? (" | AutoTune: on (" + String(Math.max(0, Math.round(autoTrials))) + " trials)") : "");
        } else {
          windowLine.textContent =
            "Zeitfenster: zu wenige Punkte. | Modus: " + modeName + " | Kopplung: " + fmt(coupling, 3) +
            (autoTuneUsed ? (" | AutoTune: on (" + String(Math.max(0, Math.round(autoTrials))) + " trials)") : "");
        }
      }

      function pickPoint(clientX, clientY) {
        if (!canvas || !view.projected.length) {
          return null;
        }
        var rect = canvas.getBoundingClientRect();
        var x = clientX - rect.left;
        var y = clientY - rect.top;
        var nearest = null;
        var best = 14;
        for (var i = 0; i < view.projected.length; i += 1) {
          var p = view.projected[i];
          var dx = p.x - x;
          var dy = p.y - y;
          var d = Math.sqrt(dx * dx + dy * dy);
          if (d < best) {
            best = d;
            nearest = p;
          }
        }
        return nearest;
      }

      function setAutoButton() {
        btnAuto.textContent = "Auto-Rotate: " + (view.autoRotate ? "On" : "Off");
      }

      function bindInteractions() {
        if (!canvas || canvas.getAttribute("data-bound") === "1") {
          return;
        }
        canvas.setAttribute("data-bound", "1");
        setAutoButton();
        view.showPaths = Boolean(togglePaths && togglePaths.checked);

        btnAuto.addEventListener("click", function () {
          view.autoRotate = !view.autoRotate;
          setAutoButton();
        });
        btnReset.addEventListener("click", function () {
          view.yaw = 0.55;
          view.pitch = -0.35;
          view.distance = 3.15;
          view.hoverIndex = -1;
          drawScene();
        });
        if (togglePaths) {
          togglePaths.addEventListener("change", function () {
            view.showPaths = Boolean(togglePaths.checked);
            drawScene();
          });
        }

        canvas.addEventListener("wheel", function (event) {
          event.preventDefault();
          var factor = event.deltaY < 0 ? 0.9 : 1.1;
          view.distance = clamp(view.distance * factor, 1.4, 10.0);
          drawScene();
        }, { passive: false });

        canvas.addEventListener("pointerdown", function (event) {
          if (event.pointerType === "mouse" && event.button !== 0) {
            return;
          }
          view.dragging = true;
          view.dragX = event.clientX;
          view.dragY = event.clientY;
          canvas.classList.add("dragging");
          if (canvas.setPointerCapture) {
            canvas.setPointerCapture(event.pointerId);
          }
        });

        canvas.addEventListener("pointermove", function (event) {
          if (view.dragging) {
            var dx = event.clientX - view.dragX;
            var dy = event.clientY - view.dragY;
            view.dragX = event.clientX;
            view.dragY = event.clientY;
            view.yaw += dx * 0.009;
            view.pitch = clamp(view.pitch + dy * 0.007, -1.38, 1.38);
            drawScene();
            return;
          }

          var hit = pickPoint(event.clientX, event.clientY);
          view.hoverIndex = hit ? hit.index : -1;
          if (hit) {
            showTip(
              hit.eventId +
                " | mass=" + fmt(hit.mass, 4) +
                " | potential=" + fmt(hit.potential, 4) +
                " | entropy=" + fmt(hit.entropy, 4),
              event.clientX,
              event.clientY
            );
          } else {
            hideTip();
          }
          drawScene();
        });

        function stopDrag(event) {
          if (!view.dragging) {
            return;
          }
          view.dragging = false;
          canvas.classList.remove("dragging");
          if (canvas.releasePointerCapture) {
            try {
              canvas.releasePointerCapture(event.pointerId);
            } catch (_err) {
              // noop
            }
          }
        }

        canvas.addEventListener("pointerup", stopDrag);
        canvas.addEventListener("pointercancel", stopDrag);
        canvas.addEventListener("pointerleave", function () {
          if (!view.dragging) {
            view.hoverIndex = -1;
            hideTip();
            drawScene();
          }
        });
        window.addEventListener("resize", function () {
          drawScene();
        });
      }

      function tick(ts) {
        if (!view.lastTs) {
          view.lastTs = ts;
        }
        var dt = (ts - view.lastTs) / 1000;
        view.lastTs = ts;
        if (view.autoRotate && !view.dragging) {
          view.yaw += dt * 0.38;
        }
        drawScene();
        animHandle = window.requestAnimationFrame(tick);
      }

      function ensureLoop() {
        if (!animHandle) {
          animHandle = window.requestAnimationFrame(tick);
        }
      }

      bindInteractions();

      fetch(jsonPath, { cache: "no-store" })
        .then(function (response) {
          if (!response.ok) {
            throw new Error("HTTP " + response.status);
          }
          return response.json();
        })
        .then(function (payload) {
          payload = payload || {};
          renderStatus(payload);
          renderInvariants(payload.invariants || []);
          renderAttractors(payload.attractors || []);
          renderProbes(payload.probes || []);
          prepareScene(payload);
          drawScene();
          ensureLoop();
        })
        .catch(function () {
          setBadge("warn", "Missing");
          proofTitle.textContent = "Rekonstruktionsdatei nicht gefunden.";
          proofText.textContent = "Fuehre run_information_einstein_like.ps1 aus und lade die Seite danach neu.";
          windowLine.textContent = "Zeitfenster: keine Daten.";
          mEvents.textContent = "-";
          mStress.textContent = "-";
          mCorr.textContent = "-";
          mDeflect.textContent = "-";
          mLens.textContent = "-";
          mG00.textContent = "-";
          renderInvariants([]);
          renderAttractors([]);
          renderProbes([]);
          scene.hasData = false;
          drawScene();
        });
    }());
  </script>
</body>
</html>

```

## File: `spacetime_proof.html`  
- Path: `spacetime_proof.html`  
- Size: 43307 Bytes  
- Modified: 2026-03-05 13:28:56 UTC

```html
<!doctype html>
<html lang="de">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Atheria Spacetime Proof</title>
  <style>
    :root {
      --bg: #f3efe7;
      --paper: #fff9f0;
      --ink: #16232c;
      --muted: #66727d;
      --line: rgba(22, 35, 44, 0.12);
      --ok: #1f7a4b;
      --warn: #b06a1c;
      --bad: #a03333;
      --accent: #0f5e74;
      --accent-soft: rgba(15, 94, 116, 0.14);
      --shadow: 0 14px 34px rgba(22, 35, 44, 0.12);
    }

    * { box-sizing: border-box; }
    body {
      margin: 0;
      color: var(--ink);
      font-family: Georgia, "Palatino Linotype", "Book Antiqua", serif;
      background:
        radial-gradient(circle at 15% 12%, rgba(203, 162, 92, 0.18), transparent 28%),
        radial-gradient(circle at 85% 8%, rgba(15, 94, 116, 0.12), transparent 24%),
        linear-gradient(180deg, #ede6d7, var(--bg));
    }

    .shell {
      width: min(1160px, calc(100% - 32px));
      margin: 0 auto;
      padding: 26px 0 54px;
    }

    .hero {
      padding: 24px;
      border-radius: 24px;
      color: #f9f3e8;
      background: linear-gradient(130deg, rgba(22, 35, 44, 0.96), rgba(15, 94, 116, 0.92) 56%, rgba(176, 106, 28, 0.86));
      box-shadow: var(--shadow);
      margin-bottom: 20px;
    }

    .eyebrow {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      border: 1px solid rgba(249, 243, 232, 0.26);
      border-radius: 999px;
      padding: 6px 12px;
      font-size: 0.74rem;
      letter-spacing: 0.11em;
      text-transform: uppercase;
      color: rgba(249, 243, 232, 0.82);
      margin-bottom: 12px;
    }

    h1, h2, h3, p { margin: 0; }
    h1 {
      font-size: clamp(1.8rem, 4.2vw, 3.4rem);
      line-height: 0.96;
      margin-bottom: 10px;
      max-width: 12ch;
    }
    .hero p {
      color: rgba(249, 243, 232, 0.9);
      line-height: 1.55;
      max-width: 72ch;
    }
    code {
      font-family: Consolas, "Courier New", monospace;
      font-size: 0.9em;
      background: rgba(255, 255, 255, 0.16);
      border-radius: 6px;
      padding: 1px 6px;
    }

    .layout {
      display: grid;
      grid-template-columns: 1.15fr 0.85fr;
      gap: 16px;
    }

    .stack {
      display: grid;
      gap: 16px;
      align-content: start;
    }

    .panel {
      background: var(--paper);
      border: 1px solid var(--line);
      border-radius: 18px;
      padding: 16px;
      box-shadow: 0 8px 20px rgba(22, 35, 44, 0.06);
    }

    .panel h2 {
      font-size: 1.1rem;
      margin-bottom: 12px;
    }

    .panel-head {
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 10px;
      flex-wrap: wrap;
      margin-bottom: 10px;
    }

    .plot-controls {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      flex-wrap: wrap;
    }

    .control-btn {
      border: 1px solid var(--line);
      background: #fffdf8;
      color: var(--ink);
      border-radius: 999px;
      padding: 6px 11px;
      font-size: 0.78rem;
      letter-spacing: 0.04em;
      text-transform: uppercase;
      cursor: pointer;
      font-weight: 700;
    }

    .control-btn:hover {
      border-color: rgba(15, 94, 116, 0.45);
      background: rgba(15, 94, 116, 0.08);
    }

    .control-toggle {
      display: inline-flex;
      align-items: center;
      gap: 6px;
      color: var(--muted);
      font-size: 0.8rem;
      user-select: none;
    }

    .proof {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 10px;
      padding: 12px 14px;
      border-radius: 12px;
      border: 1px solid var(--line);
      background: #fffdf7;
      margin-bottom: 14px;
    }

    .proof .badge {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      min-width: 98px;
      border-radius: 999px;
      padding: 6px 12px;
      font-size: 0.8rem;
      letter-spacing: 0.06em;
      text-transform: uppercase;
      font-weight: 700;
    }
    .badge.ok { color: var(--ok); background: rgba(31, 122, 75, 0.14); }
    .badge.warn { color: var(--warn); background: rgba(176, 106, 28, 0.14); }
    .badge.bad { color: var(--bad); background: rgba(160, 51, 51, 0.14); }

    .metrics {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(130px, 1fr));
      gap: 10px;
    }

    .metric {
      border: 1px solid var(--line);
      border-radius: 12px;
      background: #fffdf8;
      padding: 10px;
    }
    .metric .label {
      color: var(--muted);
      font-size: 0.76rem;
      text-transform: uppercase;
      letter-spacing: 0.08em;
      margin-bottom: 6px;
    }
    .metric .value {
      font-size: 1.18rem;
      font-weight: 700;
      color: var(--accent);
    }

    .meta-line {
      margin-top: 12px;
      color: var(--muted);
      font-size: 0.88rem;
      line-height: 1.5;
    }

    .matrix {
      width: 100%;
      border-collapse: collapse;
      font-family: Consolas, "Courier New", monospace;
      font-size: 0.82rem;
    }
    .matrix th, .matrix td {
      border: 1px solid var(--line);
      padding: 6px 8px;
      text-align: right;
    }
    .matrix th {
      background: rgba(15, 94, 116, 0.09);
      color: var(--muted);
      font-weight: 700;
    }

    .list {
      display: grid;
      gap: 8px;
      max-height: 320px;
      overflow: auto;
      padding-right: 4px;
    }

    .item {
      border: 1px solid var(--line);
      border-radius: 10px;
      padding: 9px 10px;
      background: #fffdf8;
      font-size: 0.9rem;
      line-height: 1.44;
    }

    .item small {
      color: var(--muted);
      display: block;
      margin-top: 3px;
      font-size: 0.78rem;
    }

    .canvas-wrap {
      border: 1px solid var(--line);
      border-radius: 14px;
      background: linear-gradient(180deg, rgba(15, 94, 116, 0.06), rgba(176, 106, 28, 0.05));
      padding: 10px;
      position: relative;
    }

    svg {
      width: 100%;
      height: 320px;
      display: block;
      border-radius: 10px;
      background: rgba(255, 255, 255, 0.7);
      touch-action: none;
      cursor: grab;
    }

    svg.dragging {
      cursor: grabbing;
    }

    .holo-wrap {
      background:
        radial-gradient(circle at 18% 20%, rgba(57, 201, 255, 0.1), transparent 34%),
        radial-gradient(circle at 82% 82%, rgba(109, 240, 191, 0.12), transparent 28%),
        linear-gradient(180deg, rgba(6, 30, 46, 0.9), rgba(9, 42, 56, 0.88));
    }

    #holo-canvas {
      width: 100%;
      height: 340px;
      display: block;
      border-radius: 10px;
      background: transparent;
      touch-action: none;
      cursor: grab;
    }

    #holo-canvas.dragging {
      cursor: grabbing;
    }

    .plot-tip {
      position: fixed;
      z-index: 20;
      pointer-events: none;
      display: none;
      max-width: 340px;
      padding: 7px 9px;
      border-radius: 9px;
      background: rgba(17, 33, 45, 0.92);
      color: #f1f5f7;
      font-size: 0.78rem;
      line-height: 1.35;
      border: 1px solid rgba(241, 245, 247, 0.2);
      box-shadow: 0 10px 22px rgba(0, 0, 0, 0.26);
    }

    .axis {
      stroke: rgba(22, 35, 44, 0.18);
      stroke-width: 1;
    }

    .dot {
      fill: #c16e28;
      stroke: #0f5e74;
      stroke-width: 1.2;
    }

    .dot-label {
      font-size: 10px;
      fill: #1b2b33;
      font-family: Consolas, "Courier New", monospace;
    }

    .footer {
      margin-top: 16px;
      color: var(--muted);
      font-size: 0.85rem;
      line-height: 1.55;
      padding: 12px 14px;
      border-radius: 14px;
      border: 1px solid var(--line);
      background: rgba(255, 252, 246, 0.76);
    }

    @media (max-width: 980px) {
      .layout { grid-template-columns: 1fr; }
      svg { height: 270px; }
      #holo-canvas { height: 280px; }
    }
  </style>
</head>
<body>
  <main class="shell">
    <section class="hero">
      <div class="eyebrow">Information -> Raumzeit</div>
      <h1>Spacetime-Rekonstruktion: technischer Nachweis</h1>
      <p>
        Diese Seite liest die Ausgabe von <code>atheria_spacetime_reconstruction.py</code> und bewertet automatisch,
        ob die Rekonstruktion aus Informationstraces konsistent ist.
      </p>
    </section>

    <section class="layout">
      <div class="stack">
        <section class="panel">
          <h2>Beweisstatus</h2>
          <div class="proof">
            <div>
              <strong id="proof-title">Warte auf Rekonstruktionsdaten...</strong>
              <div class="meta-line" id="proof-text">
                Erwartete Datei: <code id="json-path">runtime_audit/spacetime_reconstruction.json</code>
              </div>
            </div>
            <span class="badge warn" id="proof-badge">Pending</span>
          </div>

          <div class="metrics">
            <article class="metric">
              <div class="label">Events</div>
              <div class="value" id="metric-events">-</div>
            </article>
            <article class="metric">
              <div class="label">Stress</div>
              <div class="value" id="metric-stress">-</div>
            </article>
            <article class="metric">
              <div class="label">Temporal</div>
              <div class="value" id="metric-temporal">-</div>
            </article>
            <article class="metric">
              <div class="label">Causal Links</div>
              <div class="value" id="metric-links">-</div>
            </article>
          </div>

          <div class="meta-line" id="window-line"></div>
        </section>

        <section class="panel">
          <div class="panel-head">
            <h2>Emergente Raumprojektion (2D)</h2>
            <div class="plot-controls">
              <button class="control-btn" id="zoom-in-btn" type="button">Zoom +</button>
              <button class="control-btn" id="zoom-out-btn" type="button">Zoom -</button>
              <button class="control-btn" id="reset-2d-btn" type="button">Reset</button>
              <label class="control-toggle">
                <input id="toggle-labels" type="checkbox">
                Labels
              </label>
            </div>
          </div>
          <div class="canvas-wrap">
            <svg id="space-svg" viewBox="0 0 560 320" role="img" aria-label="Raeumliche Projektion"></svg>
          </div>
          <div class="meta-line">
            Zoom mit Mausrad. Ziehen fuer Pan. Labels optional zuschaltbar.
          </div>
        </section>

        <section class="panel">
          <div class="panel-head">
            <h2>Holo-Ansicht (3D)</h2>
            <div class="plot-controls">
              <button class="control-btn" id="toggle-auto-3d-btn" type="button">Auto-Rotate: On</button>
              <button class="control-btn" id="reset-3d-btn" type="button">Reset 3D</button>
            </div>
          </div>
          <div class="canvas-wrap holo-wrap">
            <canvas id="holo-canvas" width="560" height="340" aria-label="3D Holoansicht"></canvas>
          </div>
          <div class="meta-line">
            Ziehen fuer Rotation, Mausrad fuer Zoom, Hover fuer Detailpunkte.
          </div>
        </section>
      </div>

      <aside class="stack">
        <section class="panel">
          <h2>Metrik-Tensor</h2>
          <table class="matrix" id="metric-table">
            <thead><tr><th>Index</th><th>Wert</th></tr></thead>
            <tbody><tr><td colspan="2">Keine Daten</td></tr></tbody>
          </table>
        </section>

        <section class="panel">
          <h2>Staerkste Kausallinks</h2>
          <div class="list" id="links-list">
            <article class="item">Noch keine Links geladen.</article>
          </div>
        </section>

        <section class="panel">
          <h2>Ereignisachse</h2>
          <div class="list" id="events-list">
            <article class="item">Noch keine Punkte geladen.</article>
          </div>
        </section>
      </aside>
    </section>

    <section class="footer">
      Startsequenz:
      <code>powershell -NoProfile -ExecutionPolicy Bypass -File .\run_information_raumgeometrie.ps1 -ReportFile ..\daemon_runtime\atheria_daemon_audit.jsonl -JsonOut .\runtime_audit\spacetime_reconstruction.json</code>
    </section>
  </main>
  <div class="plot-tip" id="space-tip"></div>
  <div class="plot-tip" id="holo-tip"></div>

  <script>
    (function () {
      var params = new URLSearchParams(window.location.search || "");
      var jsonPath = String(params.get("json") || "runtime_audit/spacetime_reconstruction.json").trim();

      var proofTitle = document.getElementById("proof-title");
      var proofText = document.getElementById("proof-text");
      var proofBadge = document.getElementById("proof-badge");
      var jsonPathNode = document.getElementById("json-path");
      var eventsMetric = document.getElementById("metric-events");
      var stressMetric = document.getElementById("metric-stress");
      var temporalMetric = document.getElementById("metric-temporal");
      var linksMetric = document.getElementById("metric-links");
      var windowLine = document.getElementById("window-line");
      var metricTable = document.getElementById("metric-table").querySelector("tbody");
      var linksList = document.getElementById("links-list");
      var eventsList = document.getElementById("events-list");
      var spaceSvg = document.getElementById("space-svg");
      var zoomInBtn = document.getElementById("zoom-in-btn");
      var zoomOutBtn = document.getElementById("zoom-out-btn");
      var reset2DBtn = document.getElementById("reset-2d-btn");
      var toggleLabels = document.getElementById("toggle-labels");
      var auto3DBtn = document.getElementById("toggle-auto-3d-btn");
      var reset3DBtn = document.getElementById("reset-3d-btn");
      var holoCanvas = document.getElementById("holo-canvas");
      var spaceTip = document.getElementById("space-tip");
      var holoTip = document.getElementById("holo-tip");
      var holoCtx = holoCanvas ? holoCanvas.getContext("2d") : null;
      var view2D = {
        scale: 1,
        tx: 0,
        ty: 0,
        dragging: false,
        dragX: 0,
        dragY: 0,
        minScale: 0.35,
        maxScale: 22
      };
      var spatialState = {
        points: [],
        raw: [],
        showLabels: false
      };
      var view3D = {
        yaw: 0.45,
        pitch: -0.32,
        distance: 2.85,
        dragging: false,
        dragX: 0,
        dragY: 0,
        autoRotate: true,
        hoverIndex: -1,
        lastTs: 0,
        projected: []
      };
      var holoState = { points: [] };
      var holoAnimHandle = 0;

      if (jsonPathNode) {
        jsonPathNode.textContent = jsonPath;
      }

      function setBadge(tone, text) {
        proofBadge.className = "badge " + tone;
        proofBadge.textContent = text;
      }

      function toNumber(value, fallback) {
        var n = Number(value);
        return Number.isFinite(n) ? n : fallback;
      }

      function fmt(num, digits) {
        return toNumber(num, 0).toFixed(digits);
      }

      function clamp(value, low, high) {
        return Math.min(high, Math.max(low, value));
      }

      function sortNumbers(values) {
        return values.slice().sort(function (a, b) { return a - b; });
      }

      function quantile(sortedValues, q) {
        if (!sortedValues.length) {
          return 0;
        }
        var pos = (sortedValues.length - 1) * clamp(q, 0, 1);
        var lo = Math.floor(pos);
        var hi = Math.ceil(pos);
        if (lo === hi) {
          return sortedValues[lo];
        }
        var t = pos - lo;
        return sortedValues[lo] * (1 - t) + sortedValues[hi] * t;
      }

      function compressAxis(value, center, spread) {
        var safeSpread = Math.max(spread, 1e-6);
        var normalized = (toNumber(value, 0) - center) / safeSpread;
        var sign = normalized < 0 ? -1 : 1;
        return sign * Math.log(1 + Math.abs(normalized));
      }

      function extractPoint(point, index) {
        var s = Array.isArray(point && point.spatial) ? point.spatial : [];
        return {
          eventId: String((point && point.event_id) || ("event_" + index)),
          timestamp: toNumber(point && point.timestamp, 0),
          emergentTime: toNumber(point && point.emergent_time, index),
          entropy: toNumber(point && point.entropy, 0),
          curvature: toNumber(point && point.curvature_proxy, 0),
          x: toNumber(s[0], 0),
          y: toNumber(s[1], 0),
          z: toNumber(s[2], 0)
        };
      }

      function placeTip(node, clientX, clientY) {
        if (!node) {
          return;
        }
        var offset = 12;
        var left = clientX + offset;
        var top = clientY + offset;
        var maxLeft = window.innerWidth - node.offsetWidth - 8;
        var maxTop = window.innerHeight - node.offsetHeight - 8;
        node.style.left = String(Math.max(8, Math.min(maxLeft, left))) + "px";
        node.style.top = String(Math.max(8, Math.min(maxTop, top))) + "px";
      }

      function showTip(node, text, clientX, clientY) {
        if (!node) {
          return;
        }
        node.textContent = text;
        node.style.display = "block";
        placeTip(node, clientX, clientY);
      }

      function moveTip(node, clientX, clientY) {
        if (!node || node.style.display !== "block") {
          return;
        }
        placeTip(node, clientX, clientY);
      }

      function hideTip(node) {
        if (node) {
          node.style.display = "none";
        }
      }

      function toSvgCoord(event) {
        if (!spaceSvg) {
          return { x: 0, y: 0 };
        }
        var rect = spaceSvg.getBoundingClientRect();
        if (!rect.width || !rect.height) {
          return { x: 0, y: 0 };
        }
        return {
          x: ((event.clientX - rect.left) / rect.width) * 560,
          y: ((event.clientY - rect.top) / rect.height) * 320
        };
      }

      function apply2DTransform() {
        if (!spaceSvg) {
          return;
        }
        var layer = spaceSvg.querySelector("g[data-layer='viewport']");
        if (!layer) {
          return;
        }
        layer.setAttribute(
          "transform",
          "matrix(" +
            view2D.scale.toFixed(5) +
            " 0 0 " +
            view2D.scale.toFixed(5) +
            " " +
            view2D.tx.toFixed(3) +
            " " +
            view2D.ty.toFixed(3) +
            ")"
        );
      }

      function reset2DView() {
        view2D.scale = 1;
        view2D.tx = 0;
        view2D.ty = 0;
        apply2DTransform();
      }

      function zoom2DAt(anchorX, anchorY, factor) {
        var oldScale = view2D.scale;
        var nextScale = clamp(oldScale * factor, view2D.minScale, view2D.maxScale);
        if (Math.abs(nextScale - oldScale) < 1e-6) {
          return;
        }
        view2D.tx = anchorX - ((anchorX - view2D.tx) / oldScale) * nextScale;
        view2D.ty = anchorY - ((anchorY - view2D.ty) / oldScale) * nextScale;
        view2D.scale = nextScale;
        apply2DTransform();
      }

      function reset3DView() {
        view3D.yaw = 0.45;
        view3D.pitch = -0.32;
        view3D.distance = 2.85;
        view3D.hoverIndex = -1;
      }

      function setAuto3DButton() {
        if (auto3DBtn) {
          auto3DBtn.textContent = "Auto-Rotate: " + (view3D.autoRotate ? "On" : "Off");
        }
      }

      function evaluateProof(payload) {
        var quality = payload && payload.quality ? payload.quality : {};
        var points = payload && payload.points ? payload.points : [];
        var stress = toNumber(quality.stress, 9);
        var temporal = toNumber(quality.temporal_consistency, 0);
        var enoughEvents = points.length >= 3;
        var stable = stress <= 0.15;
        var coherent = temporal >= 0.6;

        if (enoughEvents && stable && coherent) {
          setBadge("ok", "Verified");
          proofTitle.textContent = "Rekonstruktion konsistent: Raumzeit aus Information darstellbar.";
          proofText.textContent = "Kriterien erfuellt: Event-Menge, niedriger Stress, hohe zeitliche Konsistenz.";
          return;
        }

        if (enoughEvents && (stable || coherent)) {
          setBadge("warn", "Partial");
          proofTitle.textContent = "Rekonstruktion teilweise stabil, aber noch nicht voll belastbar.";
          proofText.textContent = "Mindestens eines der Qualitätskriterien liegt unter dem Zielbereich.";
          return;
        }

        setBadge("bad", "Failed");
        proofTitle.textContent = "Zu wenig Evidenz fuer einen robusten Raumzeit-Nachweis.";
        proofText.textContent = "Bitte mehr Events sammeln oder Rekonstruktion mit groesserem Fenster erneut ausfuehren.";
      }

      function renderMetricTensor(metricTensor) {
        if (!Array.isArray(metricTensor) || metricTensor.length === 0) {
          metricTable.innerHTML = "<tr><td colspan='2'>Keine Daten</td></tr>";
          return;
        }
        var lines = [];
        for (var i = 0; i < metricTensor.length; i += 1) {
          var row = metricTensor[i];
          var diag = Array.isArray(row) ? row[i] : row;
          lines.push("<tr><th>g[" + i + "," + i + "]</th><td>" + fmt(diag, 6) + "</td></tr>");
        }
        metricTable.innerHTML = lines.join("");
      }

      function renderLinks(links) {
        if (!Array.isArray(links) || links.length === 0) {
          linksList.innerHTML = "<article class='item'>Keine Kausallinks im Top-Set.</article>";
          return;
        }
        var html = links.map(function (link, index) {
          return (
            "<article class='item'><strong>#"+ (index + 1) + " " +
            String(link.source || "?") + " -> " + String(link.target || "?") +
            "</strong><small>Gewicht: " + fmt(link.weight, 6) + "</small></article>"
          );
        }).join("");
        linksList.innerHTML = html;
      }

      function renderEvents(points) {
        if (!Array.isArray(points) || points.length === 0) {
          eventsList.innerHTML = "<article class='item'>Keine Ereignisse gefunden.</article>";
          return;
        }
        var html = points.slice(-24).map(function (point) {
          return (
            "<article class='item'><strong>" + String(point.event_id || "event") + "</strong>" +
            "<small>emergent_time=" + fmt(point.emergent_time, 4) +
            " | entropy=" + fmt(point.entropy, 4) +
            " | curvature=" + fmt(point.curvature_proxy, 4) + "</small></article>"
          );
        }).join("");
        eventsList.innerHTML = html;
      }

      function renderSpatial(points, resetView) {
        if (!spaceSvg) {
          return;
        }
        while (spaceSvg.firstChild) {
          spaceSvg.removeChild(spaceSvg.firstChild);
        }

        spatialState.raw = Array.isArray(points) ? points : [];
        spatialState.showLabels = Boolean(toggleLabels && toggleLabels.checked);

        if (!spatialState.raw.length) {
          return;
        }

        var raw = spatialState.raw.map(extractPoint);
        var xs = sortNumbers(raw.map(function (p) { return p.x; }));
        var ys = sortNumbers(raw.map(function (p) { return p.y; }));
        var xCenter = quantile(xs, 0.5);
        var yCenter = quantile(ys, 0.5);
        var xSpread = Math.max(1e-4, quantile(xs, 0.75) - quantile(xs, 0.25));
        var ySpread = Math.max(1e-4, quantile(ys, 0.75) - quantile(ys, 0.25));

        var compressed = raw.map(function (p) {
          return {
            eventId: p.eventId,
            timestamp: p.timestamp,
            emergentTime: p.emergentTime,
            entropy: p.entropy,
            curvature: p.curvature,
            x: compressAxis(p.x, xCenter, xSpread),
            y: compressAxis(p.y, yCenter, ySpread)
          };
        });

        var cx = compressed.map(function (p) { return p.x; });
        var cy = compressed.map(function (p) { return p.y; });
        var minX = Math.min.apply(null, cx);
        var maxX = Math.max.apply(null, cx);
        var minY = Math.min.apply(null, cy);
        var maxY = Math.max.apply(null, cy);
        var pad = 28;
        var w = 560;
        var h = 320;
        var spanX = Math.max(1e-6, maxX - minX);
        var spanY = Math.max(1e-6, maxY - minY);
        var zoomPadX = spanX * 0.14;
        var zoomPadY = spanY * 0.14;

        function sx(v) {
          return pad + ((v - (minX - zoomPadX)) / (spanX + 2 * zoomPadX)) * (w - 2 * pad);
        }

        function sy(v) {
          return h - pad - ((v - (minY - zoomPadY)) / (spanY + 2 * zoomPadY)) * (h - 2 * pad);
        }

        spatialState.points = compressed.map(function (p) {
          return {
            eventId: p.eventId,
            timestamp: p.timestamp,
            emergentTime: p.emergentTime,
            entropy: p.entropy,
            curvature: p.curvature,
            plotX: sx(p.x),
            plotY: sy(p.y)
          };
        });

        var ns = "http://www.w3.org/2000/svg";
        function createLine(x1, y1, x2, y2, cls) {
          var el = document.createElementNS(ns, "line");
          el.setAttribute("x1", String(x1));
          el.setAttribute("y1", String(y1));
          el.setAttribute("x2", String(x2));
          el.setAttribute("y2", String(y2));
          el.setAttribute("class", cls);
          return el;
        }

        function createText(x, y, cls, value) {
          var el = document.createElementNS(ns, "text");
          el.setAttribute("x", String(x));
          el.setAttribute("y", String(y));
          el.setAttribute("class", cls);
          el.textContent = value;
          return el;
        }

        var viewport = document.createElementNS(ns, "g");
        viewport.setAttribute("data-layer", "viewport");
        spaceSvg.appendChild(viewport);
        viewport.appendChild(createLine(pad, h - pad, w - pad, h - pad, "axis"));
        viewport.appendChild(createLine(pad, h - pad, pad, pad, "axis"));

        for (var i = 0; i < spatialState.points.length; i += 1) {
          (function (point) {
            var circle = document.createElementNS(ns, "circle");
            circle.setAttribute("cx", String(point.plotX));
            circle.setAttribute("cy", String(point.plotY));
            circle.setAttribute("r", "4.2");
            circle.setAttribute("class", "dot");
            viewport.appendChild(circle);

            circle.addEventListener("mouseenter", function (event) {
              showTip(
                spaceTip,
                point.eventId +
                  " | t=" + fmt(point.emergentTime, 4) +
                  " | entropy=" + fmt(point.entropy, 4) +
                  " | curvature=" + fmt(point.curvature, 4),
                event.clientX,
                event.clientY
              );
            });
            circle.addEventListener("mousemove", function (event) {
              moveTip(spaceTip, event.clientX, event.clientY);
            });
            circle.addEventListener("mouseleave", function () {
              hideTip(spaceTip);
            });

            if (spatialState.showLabels) {
              var tag = point.eventId.length > 16 ? point.eventId.slice(0, 16) + "..." : point.eventId;
              viewport.appendChild(createText(point.plotX + 6, point.plotY - 6, "dot-label", tag));
            }
          }(spatialState.points[i]));
        }

        if (resetView) {
          reset2DView();
        } else {
          apply2DTransform();
        }
      }

      function normalizeHoloPoints(rawPoints) {
        if (!rawPoints.length) {
          return [];
        }
        var xs = sortNumbers(rawPoints.map(function (p) { return p.x; }));
        var ys = sortNumbers(rawPoints.map(function (p) { return p.y; }));
        var zs = sortNumbers(rawPoints.map(function (p) { return p.z; }));

        var cx = quantile(xs, 0.5);
        var cy = quantile(ys, 0.5);
        var cz = quantile(zs, 0.5);
        var sx = Math.max(1e-4, quantile(xs, 0.75) - quantile(xs, 0.25));
        var sy = Math.max(1e-4, quantile(ys, 0.75) - quantile(ys, 0.25));
        var sz = Math.max(1e-4, quantile(zs, 0.75) - quantile(zs, 0.25));

        var compact = rawPoints.map(function (p) {
          return {
            eventId: p.eventId,
            timestamp: p.timestamp,
            emergentTime: p.emergentTime,
            entropy: p.entropy,
            curvature: p.curvature,
            x: compressAxis(p.x, cx, sx),
            y: compressAxis(p.y, cy, sy),
            z: compressAxis(p.z, cz, sz)
          };
        });

        var meanX = compact.reduce(function (acc, p) { return acc + p.x; }, 0) / compact.length;
        var meanY = compact.reduce(function (acc, p) { return acc + p.y; }, 0) / compact.length;
        var meanZ = compact.reduce(function (acc, p) { return acc + p.z; }, 0) / compact.length;
        var radius = 0;
        for (var i = 0; i < compact.length; i += 1) {
          var dx = compact[i].x - meanX;
          var dy = compact[i].y - meanY;
          var dz = compact[i].z - meanZ;
          radius = Math.max(radius, Math.sqrt(dx * dx + dy * dy + dz * dz));
        }
        var safeRadius = Math.max(radius, 1e-6);
        return compact.map(function (p) {
          return {
            eventId: p.eventId,
            timestamp: p.timestamp,
            emergentTime: p.emergentTime,
            entropy: p.entropy,
            curvature: p.curvature,
            x: (p.x - meanX) / safeRadius,
            y: (p.y - meanY) / safeRadius,
            z: (p.z - meanZ) / safeRadius
          };
        });
      }

      function fitHoloCanvas() {
        if (!holoCanvas || !holoCtx) {
          return { w: 0, h: 0 };
        }
        var dpr = Math.max(1, window.devicePixelRatio || 1);
        var displayW = Math.max(1, Math.round(holoCanvas.clientWidth || 560));
        var displayH = Math.max(1, Math.round(holoCanvas.clientHeight || 340));
        var targetW = Math.round(displayW * dpr);
        var targetH = Math.round(displayH * dpr);
        if (holoCanvas.width !== targetW || holoCanvas.height !== targetH) {
          holoCanvas.width = targetW;
          holoCanvas.height = targetH;
        }
        holoCtx.setTransform(dpr, 0, 0, dpr, 0, 0);
        return { w: displayW, h: displayH };
      }

      function project3D(point, width, height) {
        var cosY = Math.cos(view3D.yaw);
        var sinY = Math.sin(view3D.yaw);
        var cosX = Math.cos(view3D.pitch);
        var sinX = Math.sin(view3D.pitch);

        var rx = point.x * cosY - point.z * sinY;
        var rz = point.x * sinY + point.z * cosY;
        var ry = point.y * cosX - rz * sinX;
        var rz2 = point.y * sinX + rz * cosX;

        var depth = clamp(view3D.distance - rz2, 0.35, 30);
        var focal = Math.min(width, height) * 0.66;
        var scale = focal / depth;
        return {
          x: width * 0.5 + rx * scale,
          y: height * 0.5 - ry * scale,
          depth: depth,
          z: rz2
        };
      }

      function drawHoloFrame() {
        if (!holoCtx || !holoCanvas) {
          return;
        }
        var size = fitHoloCanvas();
        var w = size.w;
        var h = size.h;
        holoCtx.clearRect(0, 0, w, h);

        if (!holoState.points.length) {
          view3D.projected = [];
          return;
        }

        var projected = [];
        for (var i = 0; i < holoState.points.length; i += 1) {
          var p = holoState.points[i];
          var proj = project3D(p, w, h);
          projected.push({
            index: i,
            eventId: p.eventId,
            entropy: p.entropy,
            curvature: p.curvature,
            emergentTime: p.emergentTime,
            timestamp: p.timestamp,
            x: proj.x,
            y: proj.y,
            depth: proj.depth,
            z: proj.z
          });
        }

        holoCtx.save();
        holoCtx.strokeStyle = "rgba(109, 240, 191, 0.22)";
        holoCtx.lineWidth = 1.1;
        for (var j = 1; j < projected.length; j += 1) {
          var prev = projected[j - 1];
          var cur = projected[j];
          holoCtx.globalAlpha = clamp(0.2 + (1 / Math.max(1, cur.depth)) * 0.22, 0.18, 0.55);
          holoCtx.beginPath();
          holoCtx.moveTo(prev.x, prev.y);
          holoCtx.lineTo(cur.x, cur.y);
          holoCtx.stroke();
        }
        holoCtx.restore();

        projected.sort(function (a, b) { return b.depth - a.depth; });
        for (var k = 0; k < projected.length; k += 1) {
          var point = projected[k];
          var isHover = point.index === view3D.hoverIndex;
          var radius = clamp((1.2 / point.depth) * 9, 2.2, 9.2) + (isHover ? 1.8 : 0);
          var alpha = clamp(1.08 - point.depth * 0.22, 0.28, 0.96);

          holoCtx.beginPath();
          holoCtx.fillStyle = isHover ? "rgba(255, 214, 143, 0.95)" : "rgba(57, 201, 255, " + alpha.toFixed(3) + ")";
          holoCtx.strokeStyle = isHover ? "rgba(255, 248, 229, 0.95)" : "rgba(8, 33, 46, 0.78)";
          holoCtx.lineWidth = isHover ? 2.1 : 1.1;
          holoCtx.arc(point.x, point.y, radius, 0, Math.PI * 2);
          holoCtx.fill();
          holoCtx.stroke();
        }

        view3D.projected = projected;
      }

      function holoLoop(ts) {
        if (!view3D.lastTs) {
          view3D.lastTs = ts;
        }
        var dt = (ts - view3D.lastTs) / 1000;
        view3D.lastTs = ts;
        if (view3D.autoRotate && !view3D.dragging) {
          view3D.yaw += dt * 0.42;
        }
        drawHoloFrame();
        holoAnimHandle = window.requestAnimationFrame(holoLoop);
      }

      function ensureHoloLoop() {
        if (!holoAnimHandle) {
          holoAnimHandle = window.requestAnimationFrame(holoLoop);
        }
      }

      function renderHolo(points, resetView) {
        var raw = Array.isArray(points) ? points.map(extractPoint) : [];
        holoState.points = normalizeHoloPoints(raw);
        if (resetView) {
          reset3DView();
        }
        drawHoloFrame();
        if (holoState.points.length) {
          ensureHoloLoop();
        } else if (holoAnimHandle) {
          window.cancelAnimationFrame(holoAnimHandle);
          holoAnimHandle = 0;
          view3D.lastTs = 0;
        }
      }

      function pickHoloPoint(clientX, clientY) {
        if (!holoCanvas || !view3D.projected.length) {
          return null;
        }
        var rect = holoCanvas.getBoundingClientRect();
        var x = clientX - rect.left;
        var y = clientY - rect.top;
        var nearest = null;
        var best = 14;
        for (var i = 0; i < view3D.projected.length; i += 1) {
          var p = view3D.projected[i];
          var dx = p.x - x;
          var dy = p.y - y;
          var dist = Math.sqrt(dx * dx + dy * dy);
          if (dist < best) {
            best = dist;
            nearest = p;
          }
        }
        return nearest;
      }

      function bind2DInteractions() {
        if (!spaceSvg || spaceSvg.getAttribute("data-bound") === "1") {
          return;
        }
        spaceSvg.setAttribute("data-bound", "1");

        if (toggleLabels) {
          spatialState.showLabels = Boolean(toggleLabels.checked);
          toggleLabels.addEventListener("change", function () {
            spatialState.showLabels = Boolean(toggleLabels.checked);
            renderSpatial(spatialState.raw, false);
          });
        }

        if (zoomInBtn) {
          zoomInBtn.addEventListener("click", function () {
            zoom2DAt(280, 160, 1.25);
          });
        }
        if (zoomOutBtn) {
          zoomOutBtn.addEventListener("click", function () {
            zoom2DAt(280, 160, 0.8);
          });
        }
        if (reset2DBtn) {
          reset2DBtn.addEventListener("click", function () {
            reset2DView();
          });
        }

        spaceSvg.addEventListener("wheel", function (event) {
          event.preventDefault();
          var pos = toSvgCoord(event);
          var factor = event.deltaY < 0 ? 1.12 : 0.89;
          zoom2DAt(pos.x, pos.y, factor);
        }, { passive: false });

        spaceSvg.addEventListener("pointerdown", function (event) {
          if (event.pointerType === "mouse" && event.button !== 0) {
            return;
          }
          view2D.dragging = true;
          view2D.dragX = event.clientX;
          view2D.dragY = event.clientY;
          spaceSvg.classList.add("dragging");
          if (spaceSvg.setPointerCapture) {
            spaceSvg.setPointerCapture(event.pointerId);
          }
        });

        spaceSvg.addEventListener("pointermove", function (event) {
          if (!view2D.dragging) {
            return;
          }
          var rect = spaceSvg.getBoundingClientRect();
          if (!rect.width || !rect.height) {
            return;
          }
          var dx = ((event.clientX - view2D.dragX) / rect.width) * 560;
          var dy = ((event.clientY - view2D.dragY) / rect.height) * 320;
          view2D.dragX = event.clientX;
          view2D.dragY = event.clientY;
          view2D.tx += dx;
          view2D.ty += dy;
          apply2DTransform();
        });

        function stop2DDrag(event) {
          if (!view2D.dragging) {
            return;
          }
          view2D.dragging = false;
          spaceSvg.classList.remove("dragging");
          if (spaceSvg.releasePointerCapture) {
            try {
              spaceSvg.releasePointerCapture(event.pointerId);
            } catch (_err) {
              // noop
            }
          }
        }

        spaceSvg.addEventListener("pointerup", stop2DDrag);
        spaceSvg.addEventListener("pointercancel", stop2DDrag);
        spaceSvg.addEventListener("pointerleave", function () {
          if (!view2D.dragging) {
            hideTip(spaceTip);
          }
        });
      }

      function bindHoloInteractions() {
        if (!holoCanvas || holoCanvas.getAttribute("data-bound") === "1") {
          return;
        }
        holoCanvas.setAttribute("data-bound", "1");
        setAuto3DButton();

        if (auto3DBtn) {
          auto3DBtn.addEventListener("click", function () {
            view3D.autoRotate = !view3D.autoRotate;
            setAuto3DButton();
          });
        }

        if (reset3DBtn) {
          reset3DBtn.addEventListener("click", function () {
            reset3DView();
            drawHoloFrame();
          });
        }

        holoCanvas.addEventListener("wheel", function (event) {
          event.preventDefault();
          var factor = event.deltaY < 0 ? 0.9 : 1.1;
          view3D.distance = clamp(view3D.distance * factor, 1.45, 9.5);
          drawHoloFrame();
        }, { passive: false });

        holoCanvas.addEventListener("pointerdown", function (event) {
          if (event.pointerType === "mouse" && event.button !== 0) {
            return;
          }
          view3D.dragging = true;
          view3D.dragX = event.clientX;
          view3D.dragY = event.clientY;
          holoCanvas.classList.add("dragging");
          if (holoCanvas.setPointerCapture) {
            holoCanvas.setPointerCapture(event.pointerId);
          }
        });

        holoCanvas.addEventListener("pointermove", function (event) {
          if (view3D.dragging) {
            var dx = event.clientX - view3D.dragX;
            var dy = event.clientY - view3D.dragY;
            view3D.dragX = event.clientX;
            view3D.dragY = event.clientY;
            view3D.yaw += dx * 0.009;
            view3D.pitch = clamp(view3D.pitch + dy * 0.007, -1.38, 1.38);
            drawHoloFrame();
            return;
          }

          var hit = pickHoloPoint(event.clientX, event.clientY);
          view3D.hoverIndex = hit ? hit.index : -1;
          if (hit) {
            showTip(
              holoTip,
              hit.eventId +
                " | t=" + fmt(hit.emergentTime, 4) +
                " | entropy=" + fmt(hit.entropy, 4) +
                " | curvature=" + fmt(hit.curvature, 4),
              event.clientX,
              event.clientY
            );
          } else {
            hideTip(holoTip);
          }
          drawHoloFrame();
        });

        function stop3DDrag(event) {
          if (!view3D.dragging) {
            return;
          }
          view3D.dragging = false;
          holoCanvas.classList.remove("dragging");
          if (holoCanvas.releasePointerCapture) {
            try {
              holoCanvas.releasePointerCapture(event.pointerId);
            } catch (_err) {
              // noop
            }
          }
        }

        holoCanvas.addEventListener("pointerup", stop3DDrag);
        holoCanvas.addEventListener("pointercancel", stop3DDrag);
        holoCanvas.addEventListener("pointerleave", function () {
          if (!view3D.dragging) {
            view3D.hoverIndex = -1;
            hideTip(holoTip);
            drawHoloFrame();
          }
        });

        window.addEventListener("resize", function () {
          drawHoloFrame();
        });
      }

      function render(payload) {
        var points = Array.isArray(payload.points) ? payload.points : [];
        var quality = payload.quality || {};
        var links = Array.isArray(payload.causal_links) ? payload.causal_links : [];
        var metricTensor = Array.isArray(payload.metric_tensor) ? payload.metric_tensor : [];
        var resetView = !spatialState.raw.length && !holoState.points.length;

        eventsMetric.textContent = String(points.length);
        stressMetric.textContent = fmt(quality.stress, 4);
        temporalMetric.textContent = fmt(quality.temporal_consistency, 4);
        linksMetric.textContent = String(links.length);

        if (points.length > 1) {
          windowLine.textContent =
            "Zeitfenster: " + fmt(points[0].timestamp, 3) + " -> " + fmt(points[points.length - 1].timestamp, 3);
        } else {
          windowLine.textContent = "Zeitfenster: zu wenige Punkte.";
        }

        evaluateProof(payload);
        renderMetricTensor(metricTensor);
        renderLinks(links);
        renderEvents(points);
        renderSpatial(points, resetView);
        renderHolo(points, resetView);
      }

      bind2DInteractions();
      bindHoloInteractions();
      setAuto3DButton();

      fetch(jsonPath, { cache: "no-store" })
        .then(function (response) {
          if (!response.ok) {
            throw new Error("HTTP " + response.status);
          }
          return response.json();
        })
        .then(function (payload) {
          render(payload || {});
        })
        .catch(function () {
          setBadge("warn", "Missing");
          proofTitle.textContent = "Rekonstruktionsdatei nicht gefunden.";
          proofText.textContent =
            "Fuehre zuerst run_information_raumgeometrie.ps1 aus und lade die Seite danach neu.";
          windowLine.textContent = "Zeitfenster: keine Daten.";
          renderMetricTensor([]);
          renderLinks([]);
          renderEvents([]);
          renderSpatial([], true);
          renderHolo([], true);
        });
    }());
  </script>
</body>
</html>

```

