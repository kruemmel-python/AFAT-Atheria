# ATHERIA Whitepaper

Version: 1.0  
Date: 2026-03-05  
Scope: Information dynamics, causal event structure, geometry reconstruction, Einstein-like field effects, and market-field applications

## Abstract

ATHERIA is an event-driven information system that converts signed runtime traces into a structured information field. The method stack combines: (i) information-theoretic event encoding, (ii) directed causal flow estimation, (iii) geometric reconstruction of an emergent manifold, (iv) Einstein-like effective field diagnostics, and (v) probabilistic short-horizon forecasting for market information fields.  
This whitepaper presents the operational model implemented in the current ATHERIA release and defines the verification criteria used by the proof dashboards.

## 1 Motivation

Modern market state estimation is limited by three coupled problems:

1. High-dimensional heterogeneity: market snapshots, internal runtime variables, and risk sensors evolve on different scales.
2. Temporal ambiguity: chronological time does not fully represent informational causality.
3. Weak evidence regimes: short or partially missing market feeds can produce overconfident forecasts if quality is not explicitly gated.

ATHERIA addresses these problems with a unified pipeline:

- Events are encoded as information vectors and transformed into probability distributions.
- Distances are computed in information space (Jensen-Shannon geometry), not raw Euclidean feature space.
- Directed causal flow is extracted from entropy gradients and similarity affinity.
- Geometry is reconstructed as a latent manifold with explicit quality diagnostics.
- Einstein-like field effects are treated as effective analog models, tested by invariant checks.
- Forecast outputs are quality-gated by sample size, fit stability, and real-market coverage.

Design goal: a conservative, auditable, and physically inspired information field model where "Weak" verdicts are explicit and informative, not hidden.

### 1.1 Literature context and scientific positioning

The model is intentionally cross-disciplinary and should be read against four reference lines:

- Information Geometry (Amari): event states are compared as probability objects on a statistical manifold. In implementation, Jensen-Shannon distance is used as a bounded, numerically stable operational proxy for manifold separation.
- Econophysics: market dynamics are treated as non-equilibrium, heavy-tailed, regime-switching processes; stress transitions and volatility clustering motivate robust gating and conservative forecast semantics.
- Causal Set Theory: the event graph follows a "discrete events first" perspective where ordering is reconstructed from local relations. ATHERIA uses this as a methodological analogy for emergent informational time, not as a fundamental spacetime claim.
- Entropic Gravity (Verlinde): entropy gradients are mapped to effective potentials/accelerations in latent space. This is an information-field analogy that supports diagnostics (deflection, coherence, redshift proxy), not a literal gravity theory.

Boundary condition: ATHERIA claims operational predictive and diagnostic value, not proof of underlying physical laws.

## 2 Information dynamics model

### 2.1 Event state representation

Each daemon entry defines an event \(e_t\) with timestamp, market payload, dashboard state, and metadata. ATHERIA maps \(e_t\) to an information vector \(x_t \in \mathbb{R}^d\).  
For finance operation, this vector includes market stress proxies, returns/volatility/imbalance terms, sensor context, and runtime state variables.

### 2.2 Distributional projection

The vector \(x_t\) is transformed into a probability distribution:

\[
p_t = \mathrm{softmax}(x_t)
\]

Event entropy:

\[
H_t = -\sum_k p_{t,k}\log p_{t,k}
\]

This creates scale-stable information objects suitable for cross-event comparison.

### 2.3 Information distance

Pairwise event distance is Jensen-Shannon:

\[
D_{ij} = d_{JS}(p_i,p_j)
\]

The matrix \(D\) is symmetric and bounded, making it suitable for manifold reconstruction and stress diagnostics.

### 2.4 Regime-aware predictability layer

For market future projection, ATHERIA computes:

- latent coordinates (SVD-based),
- local density,
- regime labels (calm/transition/stress from quantiles),
- one-step fit metrics (\(R^2\), MAE, RMSE),
- predictability index:

\[
\text{PI}=0.42\,\hat R^2+0.22\,\hat N+0.20\,S_r+0.16\,S_n
\]

where \(\hat R^2\) is normalized fit quality, \(\hat N\) normalized residual quality, \(S_r\) regime stability, and \(S_n\) sample normalization.

PI is further multiplied by a market coverage factor derived from direct market snapshot ratio to prevent proxy-dominated overconfidence.

### 2.5 Algorithmic complexity

Let \(n\) be event count, \(d\) feature dimension, \(m\) embedding dimension, and \(k\) neighborhood size.

- Event encoding + softmax + entropy: \(O(nd)\)
- Pairwise Jensen-Shannon distance matrix: \(O(n^2 d)\) time, \(O(n^2)\) memory
- Affinity and directed flow graph: \(O(n^2)\)
- Classical MDS (full eigendecomposition): up to \(O(n^3)\); truncated/randomized variants: approximately \(O(n^2 m)\)
- Ridge-based short-horizon fit (feature dimension \(p\)): \(O(np^2 + p^3)\)

Therefore, the practical bottleneck is correctly identified as the pairwise structure (\(O(n^2)\)) and, for full MDS, potentially \(O(n^3)\).

Current mitigation strategy in production mode:

- sliding analysis windows to keep \(n\) bounded,
- optional sparse graph use via top-\(k\) neighbors,
- conservative horizon settings when evidence is thin,
- strict quality gating instead of forcing high-capacity fits on low-\(n\) data.

Recommended next optimization step: switch the dense distance stage to approximate kNN graph construction for near-linear scaling in long-running streams.

## 3 Event causal graph

### 3.1 Directed causal flow

ATHERIA defines affinity:

\[
A_{ij} = e^{-D_{ij}}
\]

and directed entropy-gradient flow:

\[
F_{ij} = A_{ij}\cdot \max(H_i-H_j,0), \quad i\neq j
\]

For each event \(i\):

\[
\mathrm{out}_i=\sum_j F_{ij}, \quad \mathrm{in}_i=\sum_j F_{ji}, \quad c_i=\mathrm{out}_i-\mathrm{in}_i
\]

Top weighted edges form the event causal graph used in reconstruction outputs.

### 3.2 Emergent time

Two clocks are combined:

- chronological time rank,
- causal rank from \(c_i\).

Spacetime reconstruction uses:

\[
\tau_i = 0.7\,t_i + 0.3\,\mathrm{rank}(c_i)
\]

Einstein-like reconstruction uses an entropy-curvature-time blend:

\[
\tau_i = 0.62\,\hat t_i + 0.26\,\widehat{\mathrm{rank}}(H_i) + 0.12\,\widehat{\mathrm{rank}}(\kappa_i)
\]

This separates informational order from wall-clock order.

### 3.3 Causal graph interpretation

High \(F_{ij}\) means event \(i\) is both close in information space and has higher local entropy potential than \(j\).  
The graph is not a structural causal model in the strict interventionist sense; it is an operational causal flow estimator for runtime diagnostics and downstream geometry.

## 4 Geometry reconstruction

### 4.1 Latent manifold

Given \(D\), ATHERIA applies classical MDS:

\[
G = -\frac{1}{2}J D^2 J,\quad J=I-\frac{1}{n}\mathbf{1}\mathbf{1}^\top
\]

Coordinates are obtained from leading eigenpairs of \(G\), yielding spatial embedding \(z_i \in \mathbb{R}^m\) (typically \(m=3\)).

### 4.2 Curvature proxy and metric

Local curvature proxy at event \(i\):

\[
\kappa_i = \frac{1}{k}\sum_{j\in \mathcal{N}_k(i)} D_{ij}
\]

A diagonal metric proxy is estimated from latent variance (spacetime module) or from effective potential (Einstein-like module).

### 4.3 Reconstruction quality

Spacetime quality uses:

- reconstruction stress:
\[
\sqrt{\frac{\lVert D-\hat D\rVert^2}{\lVert D\rVert^2}}
\]
- temporal consistency: rank correlation between emergent time and timestamps.

Outputs include pointwise entropy, curvature proxy, emergent time, top causal links, and global quality indicators.

## 5 Einstein-like effects

### 5.1 Effective source field

From entropy and curvature:

\[
m_i = m_0 + \alpha\,\widehat{H_i} + \beta\,\widehat{\kappa_i}
\]

with safety floors and mode-dependent coupling.

### 5.2 Potential and acceleration

In latent space:

\[
\Phi_i = -G\sum_j \frac{m_j}{\sqrt{r_{ij}^2+\epsilon^2}}
\]

\[
a_i = G\sum_{j\neq i} m_j\frac{(z_j-z_i)}{(r_{ij}^2+\epsilon^2)^{3/2}}
\]

This defines an effective field, not a claim about physical spacetime.

### 5.3 Metric proxy

The Einstein-like module derives:

\[
g_{00}=-(1+0.32\,\phi), \quad g_{ii}=1-0.18\,\phi
\]

with bounded ranges for numerical stability.

### 5.4 Probe geodesics and invariants

Deterministic probes are fired through the effective field. Measured invariants include:

- source-potential correlation \( \mathrm{corr}(\rho_{\mathrm{eff}},-\Phi) \),
- mean and max deflection (deg),
- lensing ratio above threshold,
- geodesic coherence,
- redshift proxy.

Verdict criteria are conservative:

- `Verified`: sufficient events and jointly strong stress/correlation/deflection/lensing conditions.
- `Partial`: moderate but usable evidence.
- `Weak`: insufficient or unstable evidence.

## 6 Applications (market information field)

### 6.1 Operational objective

In finance profile, ATHERIA transforms market and runtime telemetry into a market information field for:

- short-horizon probabilistic scenario projection,
- stress and regime diagnostics,
- anomaly-aware monitoring,
- auditable decision support.

### 6.2 Data path and reliability

Current live feed path is:

- provider chain: `yahoo -> stooq` (fallback),
- poll transport for finance runtime,
- signed daemon audit stream as source of truth.

Daemon scheduled audit minimum is 10 seconds, enabling faster evidence accumulation.

### 6.3 Forecast output semantics

Future projection returns:

- landscape topology (`explained_variance`, `regime_stability`, entropy transitions),
- forecast trajectories with confidence bands,
- scenario probabilities (`stress_up`, `sideways`, `stress_down`),
- quality block:
  - `sample_count`,
  - `has_supervised_fit`,
  - `events_missing_for_supervised_fit`,
  - `signal_mode_counts`,
  - `market_signal_ratio`, `proxy_signal_ratio`,
  - `proof_verdict`, `statement`.

Interpretation rules:

- \(n<8\): baseline mode, no robust supervised fit.
- `Weak` is expected when real-market coverage is too low, even if isolated fit metrics look strong.
- `Partial` and `Verified` require both sample depth and market-snapshot dominance.

### 6.4 Practical deployment protocol

1. Start clean runtime report directory.
2. Run daemon in finance poll mode with short audit interval.
3. Accumulate event history (target >=20 for medium evidence, >=40 for robust evidence).
4. Run future projection and inspect coverage diagnostics before using forecast outputs.

### 6.5 Baseline benchmarking protocol

To support strong claims, ATHERIA should be benchmarked against four baseline families on identical windows:

1. Random baseline  
   - Random walk / permutation / class-prior forecast as lower bound.
2. ARIMA baseline  
   - Univariate return/stress projection baseline for linear autocorrelation structure.
3. GARCH baseline  
   - Volatility and conditional variance benchmark in stress-sensitive regimes.
4. Transformer baseline  
   - Sequence model baseline for nonlinear temporal interactions.

Minimum evaluation protocol:

- rolling-origin backtest (no leakage),
- same horizon (\(H=12\) steps in current setup),
- point metrics: MAE, RMSE, \(R^2\),
- probabilistic metrics: calibration, Brier/CRPS for scenario probabilities,
- significance test on forecast loss (e.g., Diebold-Mariano) for pairwise model comparison.

Operational acceptance rule:

- "Verified" evidence should require outperforming random and classical baselines (ARIMA/GARCH) on multiple contiguous windows with stable calibration, not only a single high-variance segment.

### 6.5.1 Current benchmark snapshot (2026-03-05)

Execution command:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\run_market_benchmarks.ps1 -Threads 1 -ReportFile .\daemon_runtime_live\atheria_daemon_audit.jsonl -JsonOut .\runtime_audit\market_benchmark_report.json -MarkdownOut .\runtime_audit\market_benchmark_table.md
```

Snapshot metadata (run at 2026-03-05 19:15:34 UTC):

- events used: 186
- folds (expanding one-step): 162
- market signal ratio: 0.9892
- proxy signal ratio: 0.0108

Measured metrics:

| Model | MAE | RMSE | R2 | Direction Acc | Brier | CRPS |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| ATHERIA field model | 0.0016 | 0.0033 | n/a | 1.0000 | 0.0230 | 0.0053 |
| Random baseline | 0.0231 | 0.0288 | n/a | 0.7160 | 0.1458 | 0.0158 |
| ARIMA(1,1,0) baseline | 0.0009 | 0.0011 | n/a | 1.0000 | 0.0488 | 0.0068 |
| GARCH(1,1) baseline | 0.0008 | 0.0013 | n/a | 1.0000 | 0.0141 | 0.0046 |
| Transformer baseline | 0.0007 | 0.0008 | n/a | 1.0000 | 0.0000 | 0.0007 |

Interpretation note:

- This run is class-imbalanced (`majority_target_class=sideways`, ratio=1.0, `delta_std=0.0` on benchmark folds).  
  Therefore, this table is a pipeline validation snapshot, not yet a strong scientific performance claim.
- ATHERIA is intentionally tied to real market snapshots and conservative quality gates. If the live stream is sparse or shows near-zero variation, ATHERIA does not inject synthetic movement just to improve benchmark rank.
- For that reason, single short windows can understate ATHERIA's relative performance. A robust comparison requires longer runtime across multiple regimes (calm, transition, stress) with sustained real-market coverage.
- In zero-variance target windows, \(R^2\) is reported as `n/a` (undefined), not as `0.0000`.

### 6.6 Research and production implications

ATHERIA provides a bridge between information theory, causal flow modeling, geometric reconstruction, and conservative forecasting.  
Its key practical contribution is not maximal optimism in prediction, but calibrated evidence: the system explicitly encodes when the field is informative and when it is not.

## References (selected)

1. Amari, S.-I. (2016). *Information Geometry and Its Applications*. Springer.
2. Mantegna, R. N., and Stanley, H. E. (1999). *An Introduction to Econophysics: Correlations and Complexity in Finance*. Cambridge University Press.
3. Bombelli, L., Lee, J., Meyer, D., and Sorkin, R. D. (1987). Space-time as a causal set. *Physical Review Letters*, 59(5), 521-524.
4. Verlinde, E. (2011). On the origin of gravity and the laws of Newton. *Journal of High Energy Physics*, 2011(4), 29.
