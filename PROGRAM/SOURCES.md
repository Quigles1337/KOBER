# SOURCES — bibliography and data provenance

Rules: **E5** — an entry exists only after this-session retrieval and verification, with URL and
access date; SHA-256 for every stored copy. **E10** — license terms are recorded *before* any data
ingestion; when license is ambiguous, escalate to Al and do not ingest.

Entry states: **SURVEYED** (existence/coverage/license noted, nothing ingested) vs **INGESTED**
(data imported into the repo under the recorded license, with audit trail).

Stored copies live under `sources/` at the repo root; every stored file's SHA-256 is recorded in its
entry here.

---

## S-0001 — Corazza et al. 2021, the fraction-values paper (CLAIM-0001 anchor)

- **State:** INGESTED (stored copy of the version of record)
- **Full citation** (verified against the Crossref registry record and the stored PDF's embedded
  metadata, which agree on every field): Michele Corazza, Silvia Ferrara, Barbara Montecchi,
  Fabio Tamburini, Miguel Valério, "The mathematical values of fraction signs in the Linear A
  script: A computational, statistical and typological approach", *Journal of Archaeological
  Science* 125 (2021), art. 105214. DOI:
  [10.1016/j.jas.2020.105214](https://doi.org/10.1016/j.jas.2020.105214). Published online
  2020-09-06; print volume dated January 2021.
- **License:** **CC BY-NC-ND 4.0** for the version of record — stated in Crossref's license field
  (content-version `vor`, `http://creativecommons.org/licenses/by-nc-nd/4.0/`) *and* embedded in
  the stored PDF's own metadata. Redistribution requires attribution, non-commercial use, no
  derivatives. Repo is currently private/local, so storage is compliant; re-examine at P4.3
  publication packaging (which escalates to Al regardless).
- **Retrieved** (access date 2026-08-22):
  - Stored PDF `sources/corazza-etal-2021-jas-105214.pdf`, retrieved from the University of
    Florence FLORE institutional repository:
    <https://flore.unifi.it/retrieve/e398c382-1e6d-179a-e053-3705fe0a4cff/Ferrara-Montecchi-Val%C3%A9rio_JAS_125_2021.pdf>
    — SHA-256 `b08c56357cda7fb1cf53b8bf6a97982b8f8fec9c6938032f00c345d8b1c83e39`
  - Stored Crossref record `sources/crossref-10.1016-j.jas.2020.105214.json`, retrieved from
    <https://api.crossref.org/works/10.1016/j.jas.2020.105214>
    — SHA-256 `7dc89d5ebce168c8bb5c5d5d65d6726f3d82e200847e9f5000f45762374100cb`
  - Publisher landing page (Elsevier ScienceDirect, PII `S0305440320301357`):
    <https://www.sciencedirect.com/science/article/pii/S0305440320301357> — returned HTTP 403 to
    tooling on 2026-08-22 (bot-blocked). Citation verification therefore rests on Crossref + the
    retrieved PDF.
- **Verification notes:** byte-level grep of the stored PDF shows the DOI, the full title,
  "Journal of Archaeological Science", author-name strings (Corazza, Valério), the keyword block
  "Fraction signs, Constraint programming, Numerical notations", and the CC BY-NC-ND license URL.
  Page-level rendering is not yet possible on this machine (`pdftoppm`/poppler absent), so a visual
  read of the title page is pending P0.2 tooling; the `file` utility's "1 page(s)" readout on this
  PDF is a linearized-PDF heuristic artifact, not a page count.
