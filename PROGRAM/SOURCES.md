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
  derivatives. ~~Repo is currently private/local, so storage is compliant~~ **Updated
  2026-08-25 (Session 4):** the repo has been **public** since Session 3 (2026-08-22);
  the pre-push compliance audit is recorded in ADR-0000's addendum (non-commercial
  redistribution of the unmodified VOR with attribution via this entry). Re-examine at P4.3
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
  ~~Page-level rendering is not yet possible on this machine~~ **Resolved 2026-08-22 (Session
  2):** poppler 26.02.0 installed at `C:\Users\LEET\tools\poppler-26.02.0` (and added to user
  PATH); `pdfinfo` confirms **14 pages** and reproduces title/DOI/keywords from the PDF
  dictionary. The `file` utility's "1 page(s)" readout was a linearized-PDF heuristic artifact,
  as suspected. Full text extracted and all pages rendered; page-anchored extraction lives at
  `analysis/P0.2-constraint-system.md`. **Note for replication:** the PDF references no
  supplementary code or data anywhere; MiniZinc + Gecode are named (p. 4) but the model must be
  reconstructed from prose.
- **Terms, read again 2026-11-22 (Session 8, for ADR-0004; nothing under `sources/` changed):**
  - *The stored PDF's own statement,* on its first page (text of the stored copy by
    `pdftotext`, line breaks removed):
    "0305-4403/© 2020 The Authors. Published by Elsevier Ltd. This is an open access article
    under the CC BY-NC-ND license (http://creativecommons.org/licenses/by-nc-nd/4.0/)."
  - *CC BY-NC-ND 4.0, the legal code:*
    <https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode.txt>, HTTP 200 at
    2026-11-22T20:24:55Z, 19,127 bytes, SHA-256
    `38762e3777f4ec00a6f769062a7c3f704fb78ce08303ecff88558da4c49cf9ea` (local copy, not
    committed). Its Section 2(a)(1) grants the right to "reproduce and Share the Licensed
    Material, in whole or in part, for NonCommercial purposes only" and to "produce and
    reproduce, but not Share, Adapted Material for NonCommercial purposes only". ADR-0004
    quotes the grant, the definition of Adapted Material and the clause on exceptions whole.
  - *The stored Crossref record's own terms.* None was recorded here when the record was
    stored on 2026-08-22: an E10 gap, found by Session 8. Crossref's documentation of its REST
    API, <https://www.crossref.org/documentation/retrieve-metadata/rest-api/>, HTTP 200 at
    2026-11-22T20:25:24Z (70,812 bytes as served, SHA-256
    `a2d2153a85a3514930250c66c503717ab777805179595a69d334950d3f267870`; a web page, so the
    digest pins that retrieval and nothing more), says:
    "No sign-up is required to use the REST API, and almost none of the metadata is subject to
    copyright, and you may use it for any purpose. Some abstracts contained in the metadata may
    be subject to copyright by publishers or authors."
    The stored record holds no abstract. The statement is about the metadata the API returns
    in general. It is not a statement about each field of this record, which also carries the
    publisher's copyright assertion for the article and 59 deposited references.
  - *Still retrievable.* The FLORE URL above returned HTTP 200 at 2026-11-22T20:30:42Z:
    2,672,215 bytes, byte for byte the stored copy (the same SHA-256). The Crossref API URL
    above returned HTTP 200 at 20:30:44Z with a record of 16,721 bytes that differs from the
    stored one (16,719 bytes): the API serves live data, and the stored file is the record as
    it was on 2026-08-22.
  - *KOBER's own licence* (ADR-0004; S-0006) covers neither stored file, nor what `analysis/`
    transcribes from this paper: each keeps the terms above (ADR-0004 D2). Whether the stored
    copy stays in the tree is put to Al (K16; STATE, Standing escalations).

---

## S-0002 — GORILA: Godart & Olivier, *Recueil des inscriptions en linéaire A* (P0.6 survey)

- **State:** SURVEYED (print edition; nothing ingested)
- **What it is:** the canonical print corpus edition of Linear A. Louis Godart & Jean-Pierre
  Olivier, *Recueil des inscriptions en linéaire A* ("GORILA"), École française d'Athènes,
  Études crétoises 21, five volumes; the ISPC-CNR page describes them as published 1976–1985.
- **Retrieval evidence (access date 2026-08-22):**
  - Persée review notices naming individual volumes verbatim: vol. 2 *Nodules, scellés et
    rondelles édités avant 1970* (<https://www.persee.fr/doc/reg_0035-2039_1981_num_94_445_1276_t1_0222_0000_2>);
    vol. 4 *Autres Documents*, Études Crétoises XXI,4, nov. 1982
    (<https://www.persee.fr/doc/reg_0035-2039_1983_num_96_455_1366_t2_0293_0000_3>);
    vol. 5 *Addenda, Corrigenda, Concordances, Index et Planches des signes*, XXI,5, sept. 1985
    (<https://www.persee.fr/doc/reg_0035-2039_1986_num_99_472_1481_t2_0369_0000_4>).
  - CEFAEL (École française d'Athènes digital library) hosts scans, e.g. vol. 4 summary:
    <https://cefael.efa.gr/window.php?ce=tfvurrr0ikn6i61f6192qdrf20pf3akh&site_id=1&actionID=summary&serie_id=EtCret&volume_number=21&issue_number=4&new_lang=fr_FR>
  - ISPC-CNR descriptive page: <https://www.ispc.cnr.it/en/2025/05/23/recueil-des-inscriptions-en-lineaire-a/>
- **License:** copyrighted print edition (École française d'Athènes). Reuse terms of the CEFAEL
  scans not established. **E10: no ingestion of GORILA editorial apparatus without an
  edition-choice ADR and a license check; escalate ambiguities to Al.** Expected role: canonical
  reference identity for R0 provenance (tablet IDs, readings cited via licensed secondary sources).

---

## S-0003 — John Younger's Linear A pages (P0.6 survey)

- **State:** SURVEYED (nothing ingested). **Original host is dead.**
- **What it was** (per the Aegeus Society resource page, retrieved 2026-08-22,
  <https://www.aegeussociety.org/en/useful_websites/linear-a-texts-in-phonetic-transcription/>):
  "transliterations of all the major Linear A texts from Crete and the Aegean, a comprehensive
  bibliography of related publications from 1980 and a series of free downloadable fonts", plus a
  rudimentary grammar/vocabulary. Original URL as listed there:
  `http://people.ku.edu/%7Ejyounger/LinearA`.
- **Status verified 2026-08-22:** DNS lookup for `people.ku.edu` fails outright
  (`getaddrinfo ENOTFOUND`) — the host no longer exists, not merely the page.
- **Reported but not directly retrieved:** search-level summaries (drawing on Younger's
  academia.edu "Linear A folder, introduction",
  <https://www.academia.edu/117949722/Younger_JG_Linear_A_folder_introduction>, which returned
  HTTP 403 to tooling) state the University of Kansas eliminated the hosting server in early 2024
  and Younger reposted the material as PDFs on academia.edu. Treat as plausible secondary report
  until the introduction document is retrieved. lineara.xyz (retrieved 2026-08-22) links an
  "archived web version" of the site — a Wayback path likely exists.
- **License:** UNKNOWN — no terms retrieved. E10: no ingestion without clarification.
- **Charter note (§0.2):** Younger's material is *phonetic transliteration* using conventional
  Linear B-derived values. If ever used, it must be consumed as sign-identity labels only, never
  as sound-value claims.

---

## S-0004 — SigLA, "The signs of Linear A: a palæographical database" (P0.6 survey)

- **State:** SURVEYED (nothing ingested). **Live, open access, explicitly licensed.**
- **Retrieved 2026-08-22:** <https://sigla.phis.me/> — site self-describes as "The signs of
  Linear A: a paleographical database", by **Ester Salgarella and Simon Castellan**; open access;
  **license stated on the site: CC BY-NC-SA 4.0** (dataset and drawings). An About page and a
  companion paper are linked (<https://sigla.phis.me/paper.html>).
- **Reported coverage** (search-level descriptions + companion-paper listings, to be confirmed
  against the site/paper at ingestion time): ~400 inscriptions hand-copied, a list of ~300
  standard signs, >3,000 individual sign occurrences searchable. Companion paper also indexed at
  the Cambridge repository
  (<https://www.repository.cam.ac.uk/items/25c5d712-6e4c-4435-86a5-30f769ea4072>) and as PDF
  (<https://www.fluxus-editions.fr/gla5-salg.pdf>).
- **Assessment:** strongest ingestion candidate so far for Phase 2 — explicit CC license
  (non-commercial, share-alike), academic provenance, palaeographic granularity. Ingestion
  decision remains an edition-choice ADR at P0.3/P2.2.

---

## S-0005 — lineara.xyz (P0.6 survey)

- **State:** SURVEYED (nothing ingested).
- **Retrieved 2026-08-22:** <https://lineara.xyz/> — live digital database of Linear A
  inscriptions; hundreds of catalogued items visible with standard site-prefixed IDs (HT, KH, PH,
  …; e.g. a HTWa1001–HTWa1860 range). Links to "John Younger's Linear A Site (archived web
  version)" and to SigLA — suggesting derivation, unconfirmed.
- **License / authorship:** **none found** — no creator, copyright, terms, about, or credits
  visible on the landing page as retrieved. License UNKNOWN. E10: no ingestion without
  clarification; if this source is ever wanted, finding its author/terms becomes an escalation.

---

## S-0006 — PolyForm Noncommercial License 1.0.0 — the repository licence text (ADR-0004; K15)

- **State:** INGESTED (the text is stored unchanged, inside `LICENSE`)
- **Citation:** PolyForm Project. "PolyForm Noncommercial License 1.0.0." File
  `PolyForm-Noncommercial-1.0.0.md` in the GitHub repository `polyformproject/polyform-licenses`,
  whose README at the pinned commit describes it as the "official texts of PolyForm Project
  licenses". The text names its own canonical URL,
  `https://polyformproject.org/licenses/noncommercial/1.0.0`.
- **URL:**
  <https://raw.githubusercontent.com/polyformproject/polyform-licenses/a2316cfa35d3947fdc5af4bcc1f321662bfd79d8/PolyForm-Noncommercial-1.0.0.md>
  — pinned by commit, as K15 orders. `a2316cfa…` was the head of that repository's default
  branch on the access date (GitHub API at 2026-11-22T20:24:16Z; committed
  2026-11-19T17:34:25Z, "Move meta license to LICENSE.md"). The branch is named `1.0.0`. It is
  a branch, and the API lists no tag of that name, so a URL through the name can move and the
  pinned URL cannot. The file last changed in commit
  `9c032bcb6b44a68f90efddd1060cf71d4e6fd7ce` (2020-05-14, "Version 1.0.0s").
- **Access date:** 2026-11-22 (curl; HTTP 200 at 20:24:37Z by the pinned commit, at 20:24:37Z
  at `9c032bcb…`, and at 20:24:38Z by the branch name). The three copies are byte-identical:
  4,563 bytes, 73 lines, LF only, no byte-order mark. The canonical URL returned HTTP 200 at
  20:24:40Z as an HTML page titled "NonCommercial 1.0.0"; that page was not compared with the
  text.
- **License (of the text itself):** the same repository's `LICENSE.md` at the pinned commit
  (HTTP 200 at 2026-11-22T20:24:38Z, 475 bytes, SHA-256
  `d04a8527e90a7f7fe36083fa1fd25db16b0e43c2244f4f6880f7a2c5d18c631e`):
  "Each contributor licenses you to do everything with PolyForm licenses that would otherwise
  infringe that contributor's copyright in it. If you make changes to a PolyForm license, you
  must remove all mention of "PolyForm" and polyformproject.org, as well."
  The text is used unchanged, so its terms allow it to be stored and passed on. Stored copy,
  inside `LICENSE`:
  - SHA-256 `c0ea4a896d2c8c394b29f9427589996db826cd501c512279ff0ed3ef48fabbe5` (4,563 bytes,
    the text as retrieved).
  - `LICENSE` at the repo root is the line
    `Required Notice: Copyright 2026 Alexander David Zalewski (https://github.com/Quigles1337/KOBER)`,
    one blank line, and then those bytes: 4,660 bytes, SHA-256
    `bfcfd77d3cf20c785705de07a26be0f9176514e78394b9cdeb27221011dfcb5c`. Its bytes from the third
    line on hash to the digest of the text (checked by script).
- **SPDX:** `PolyForm-Noncommercial-1.0.0`. The SPDX License List entry
  <https://spdx.org/licenses/PolyForm-Noncommercial-1.0.0.json> (HTTP 200 at
  2026-11-22T20:24:39Z) gives that `licenseId`, the name "PolyForm Noncommercial License 1.0.0",
  and `isDeprecatedLicenseId: false`. The `license` lines in `engine/Cargo.toml` and
  `lean/lakefile.toml` use this identifier.
- **Cross-check, not a source:** the sibling program's record (FR13DMAN S-0006 and ADR-0005,
  read at `Quigles1337/FR13DMAN` commit `2ffa3e7bd56087f79bdcfe4b9649e2d86844b305`, the commit
  K15 names) gives the same pinned commit, the same size and the same SHA-256 for the text it
  retrieved earlier on 2026-11-22, and that repository's `LICENSE` at that commit, from its
  third line on, is byte-identical to this copy.
- **Role:** the licence under which KOBER's original software and technical documentation are
  offered (ADR-0004 D1). No CLAIM depends on it.
