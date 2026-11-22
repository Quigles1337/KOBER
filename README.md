# KOBER

Falsification infrastructure for Linear A: reproducible statistics, a falsification battery, and
machine-checked theorems (Lean 4, zero sorry) about what the Linear A corpus does and does not
support. **KOBER never proposes a decipherment.**

- **Constitution (read first):** [`PROGRAM/KOBER-PROGRAM.md`](PROGRAM/KOBER-PROGRAM.md)
- **Current state:** [`PROGRAM/STATE.md`](PROGRAM/STATE.md)
- **Session log:** [`PROGRAM/HANDOFF.md`](PROGRAM/HANDOFF.md)

Named for Alice Kober, who built the method and never got the answer. She gets the engine.

## Licence

KOBER's original software and technical documentation are licensed under the **PolyForm
Noncommercial License 1.0.0** (SPDX `PolyForm-Noncommercial-1.0.0`; full text in
[`LICENSE`](LICENSE)). Copyright 2026 Alexander David Zalewski.

In plain terms (the licence text governs, not this summary):

- **Noncommercial use is free.** You may use, change and share KOBER for any noncommercial
  purpose. That includes personal research, experiment, testing, study and hobby projects with
  no anticipated commercial application. It also includes use by a charitable organization,
  educational institution, public research organization, public safety or health organization,
  environmental protection organization or government institution, whatever its funding.
- **When you share it,** pass on the licence terms (or their URL) and the `Required Notice:` line
  at the top of [`LICENSE`](LICENSE).
- **Commercial use needs a separate licence.** For commercial licensing, contact Alexander David
  Zalewski at adz@alphx.io.
- **Earlier versions carried no licence.** The repository was public without a licence until
  2026-11-22 UTC. The licence applies from the commit that added it, and none is granted for
  earlier versions.

The licence does not cover third-party material, which keeps the terms recorded in
[`PROGRAM/SOURCES.md`](PROGRAM/SOURCES.md):

- the stored copy of Corazza et al. 2021 under [`sources/`](sources) (© 2020 The Authors,
  published by Elsevier Ltd.; CC BY-NC-ND 4.0), and Crossref's metadata record for it beside
  it (S-0001);
- what the files under [`analysis/`](analysis) quote and transcribe from that paper: its
  words, the counts of its tables and the readings it names, which remain its authors';
- any third-party data added later.

The engineer of record ruled this licence on 2026-11-22 UTC, and
[ADR-0004](PROGRAM/DECISIONS/ADR-0004.md) implements it. The provenance of the licence text is
recorded as S-0006 in the source register.
