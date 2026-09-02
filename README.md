# data_mvp — FOMC per-participant scoring corpus

Captured 2026-09-01. Shell egress to federalreserve.gov and district bank sites is
blocked by the session proxy, so everything here was pulled verbatim through the
browser DOM. Run `./fetch_all.sh` once the domains in
`_manifest/allowlist_domains.txt` are allowlisted to fill in the bulk items.

## What's here

| Path | Item(s) | Contents |
|---|---|---|
| `01_sep/2026-06/` | 1 | June 2026 Figure 2 dot plot, exact counts per eighth, CSV + JSON |
| `01_sep/2026-03/` | 2 | March 2026 Figure 2 dot plot, same format |
| `02_statements/2026/voting_lines_2026.json` | 4 | All five 2026 meetings: verbatim voting lines, rosters, parsing guidance |
| `05_speeches/board/` | 15,17,20 | Full 2026 Board speech index, 57 entries, in-window flags |
| `05_speeches/districts/` | 16,19 | Dissent statements: Hammack, Kashkari, Logan |
| `08_warsh/` | 8 | Jackson Hole keynote "In Our Time", full text + footnotes |
| `11_market_context/` | 26,30 | Macro state as of 2026-08-28 |
| `_manifest/` | — | Allowlist domains, dissent statement index |

## Three findings that change how you should score

**1. Statement format broke at the June 2026 meeting (first under Warsh).**
Through 29 Apr, statements name every voter. From 17 Jun they give only an aggregate
tally ("by a 12 - 0 vote"). Parse the named roster from the STATEMENT through April,
from the MINUTES from June onward: regex `Voting (for|against) this action:`.
Cost is timing, not availability — minutes lag ~3 weeks, so there is now a blind
window per meeting that did not exist under Powell.

**2. Dissenters publish their own statements at meeting+2 days.**
All three July dissenters posted first-person explanations on their district bank
sites on 2026-07-31. Same practice after April. These are NOT on federalreserve.gov
and are the fastest attributable per-participant signal available. See
`_manifest/dissent_statements_index.json`.

**3. Roster changed: Miran out, Warsh in.**
The only difference between the April and June voting rosters. Miran dissented in
Jan, Mar and Apr — always for easier policy — and has not spoken publicly since
26 March. Drop him from the current participant universe; do not score him as silent.
Powell remains on the Board and still votes.

## Current policy state
Target range 3.50-3.75%, held since Dec 2025. IORB 3.65%. Primary credit 3.75%.
PCE 12m 3.7%, 6m annualized 4.1%. Unemployment 4.1%.
July vote 9-3, three dissents all preferring +25bp — a hawkish minority, direction
flipped from the dovish dissents of Jan/Mar.

## Not yet captured
Items 3, 5 (full text), 6, 7 (full text), 9-14, 16 (11 of 12 banks), 18, 21-29.
`fetch_all.sh` covers most of these once egress opens.
