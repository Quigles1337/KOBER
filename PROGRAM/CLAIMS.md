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
- **Status:** UNKNOWN
- **Evidence:** none yet
- **Reading-set deps:** none
- **Axiom print:** n/a (not a formal claim)
- **Transitions:**
  - 2026-08-22 (Session 1) — seeded UNKNOWN per §P0.1.
