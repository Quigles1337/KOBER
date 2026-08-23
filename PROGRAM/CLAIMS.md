# CLAIMS — append-only claim register

Entry schema (§3.3): `ID | informal statement | status | evidence | reading-set deps | axiom print
(if PROVEN) | transitions log`.

Statuses: `UNKNOWN → VERIFIED (externally checked) / PROVEN (kernel-checked) / CONDITIONAL /
FALSIFIED / RETRACTED`.

Rules: append-only — never delete or rewrite an entry or a past transition; a correction is a new
transition line. Transitions require evidence. Downgrades are always permitted and never shameful
(E5, §4.5 honesty check). The **Status** field always reflects the latest transition.

---

## CLAIM-0001 — identity of the 2021 computational fraction-values paper

- **Informal statement:** The 2021 computational paper on the mathematical values of Linear A
  fraction signs is by Corazza, Ferrara, Montecchi, Tamburini & Valério. This is *program memory*
  carried in the constitution (§P0.1), not knowledge: authors, exact title, venue, year, and DOI
  are unestablished until the paper is retrieved this-session and the full citation is verified
  against the retrieved source (E5).
- **Status:** VERIFIED
- **Evidence:** S-0001 in SOURCES.md — Crossref registry record retrieved twice (bibliographic
  search, then exact-DOI fetch stored at `sources/crossref-10.1016-j.jas.2020.105214.json`) and the
  version-of-record PDF retrieved from the University of Florence FLORE repository (stored at
  `sources/corazza-etal-2021-jas-105214.pdf`, SHA-256 in S-0001), whose embedded metadata matches
  Crossref on DOI, title, journal, authors, and license.
- **Reading-set deps:** none
- **Axiom print:** n/a (not a formal claim)
- **Transitions:**
  - 2026-08-22 (Session 1) — seeded UNKNOWN per §P0.1.
  - 2026-08-22 (Session 1) — UNKNOWN → **VERIFIED**. The paper is: Michele Corazza, Silvia
    Ferrara, Barbara Montecchi, Fabio Tamburini, Miguel Valério, "The mathematical values of
    fraction signs in the Linear A script: A computational, statistical and typological approach",
    *Journal of Archaeological Science* 125 (2021), 105214, DOI 10.1016/j.jas.2020.105214 (online
    2020-09-06). The constitution's memory-belief was correct on all five authors and the topic;
    venue/year/DOI now established by retrieval, not memory. Evidence: S-0001.

---

## CLAIM-0002 — what Corazza et al. 2021 actually claims

- **Informal statement:** The paper's result is a *conditional optimality characterization*, not
  a uniqueness theorem. Its Constraints 1–6 alone are "severely underconstrained" (3,794,740
  solutions in Simulation 2, over 12 sign variables with W, X, Y, Ω, L excluded). The headline
  assignment — J = 1/2, E = 1/4, F = 1/8, B = 1/5, D = 1/6, K = 1/10, L2 = 1/20, L3 = 1/30,
  L4 = 1/40, L6 = 1/60 — is asserted only under two further hypotheses (typological attestation
  of values; optimality of the system under the paper's four defined goodness measures), and the
  further assignments H = 1/16, A = 1/24 are stated by the authors to be "tentative". Any KOBER
  theorem must be scoped to this hypothesis form (E3): "given Constraints 1–6 the solution set is
  exactly S", or "relative to the defined measures, the optimum carries exactly these ten
  values" — never "the constraints force unique values".
- **Status:** VERIFIED
- **Evidence:** full-text extraction `analysis/P0.2-constraint-system.md` (page-anchored, §7 for
  the verbatim claim from p. 8 of the stored VOR; §0 for the underconstrainedness quote from
  p. 6), against `sources/corazza-etal-2021-jas-105214.pdf` (SHA-256 in S-0001). Extraction also
  records three model ambiguities (A-1..A-3) and six internal-text observations (OBS-1..OBS-6)
  that replication must resolve.
- **Reading-set deps:** none yet (this is a claim about the paper's content; the paper's own
  reading choices are catalogued in the extraction §1 and become R0 at P0.3).
- **Axiom print:** n/a (not a formal claim)
- **Transitions:**
  - 2026-08-22 (Session 2) — created VERIFIED with retrieval-extraction evidence (P0.2).
