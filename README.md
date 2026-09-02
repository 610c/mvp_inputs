# data_mvp — FOMC September 2026 corpus

Per-participant source corpus for the expected-utility bargaining MVP.
Predicts the **September 2026 dot-plot distribution** and the **dissent vector**.

**Last updated 2026-09-02.** 715 files, 119 MB.

```
Cutoff    2026-09-04    nothing dated later enters this corpus, ever
Blackout  2026-09-05    speech record stops; predictions must be public by now
Decision  2026-09-16    2:00pm ET, SEP released, score within two hours
```

---

## Read in this order

| File | What it answers |
|---|---|
| **`README.md`** (this) | what the corpus is, its state, and its gaps |
| **`_DATASET_MAP.md`** | what is in each folder |
| **`participants/_README.txt`** | extraction rules and per-person gaps |
| `_CORPUS_README.txt` | acquisition status, by requested item number |
| `_BLOCKED_AND_FUTURE.md` | what could not be retrieved, and why |

`_manifest/superseded/` holds the 1 September capture note and the shell scripts
written before it was clear that egress was blocked. Historical only.

---

## Two layers

**`participants/`** is the model layer — 19 people, the only folder the
extraction should open.
**`01_sep/` … `13_jacksonhole/`** are the archive layer, organised by source.
They are the provenance authority. Nothing was moved between them; the model
layer holds copies.

```
participants/<key>/
    speeches/  testimony/  interviews/  background/
    votes.json      full FOMC voting history
    priors.json     role, tenure, SEP/vote status, corpus inventory
```

**Window: 2026-06-18 to 2026-09-04.** `background/` is out of window (Warsh
only) and must never reach a position extractor. Files ending `_NO_TRANSCRIPT`
are stubs: an appearance happened, no text exists.

---

## Rules, non-negotiable

1. **Every document carries a publication date.** Undated material was discarded.
2. **Hard cutoff 2026-09-04.** Nothing later, including retrospectively after the
   outcome is known.
3. **Vote history from primary sources only** — statements through April 2026,
   minutes from June 2026 onward. A wrong vote record poisons everything
   downstream and is the single most likely silent failure.
4. **Read each participant only from their own directory.** No concatenation, no
   committee-level context, no agent seeing two people. This prevents the
   failure that produces nineteen identical HOLDs — the most likely way this
   project returns a confident null.

---

## Roster arithmetic

**19 SEP participants · 12 voters · 18 dots.**

**Warsh submits no dot.** He said so in the 17 June press conference, verbatim in
`10_structural/sep_participant_count_RESOLVED.txt`. Consequences:

- The predicted histogram has **18 dots, not 19**.
- The June median **excludes the Chair**. A model reading the median as
  containing him has read the most important actor out of itself.
- March 2026 (19 dots) and June 2026 (18) sit on opposite sides of a series
  break. Do not compare medians across it.
- June column totals: 2026=18, 2027=18, 2028=17, LR=18. The short 2028 column is
  routine — 29 of 52 historical vintages have uneven columns.
- **The June baseline is independently verified.** The CSV came from the Fed's
  accessible-version HTML table; the counts were then re-derived by pixel-
  counting the published figure and they agree exactly, per column. Same for
  March. 38 of 54 vintages verified this way. Method, results and the 16 that
  the method cannot resolve: `01_sep/_DOT_VERIFICATION.txt`.

Miran left the Board before the June meeting and is not a September participant.

---

## 2026 vote record — complete, from minutes

| Date | Tally | Against | Direction |
|---|---|---|---|
| 2026-01-28 | 10–2 | Miran, Waller | dovish, both wanted a 25bp cut |
| 2026-03-18 | 11–1 | Miran | dovish |
| 2026-04-29 | 8–4 | Miran; Hammack, Kashkari, Logan | Miran dovish on the **rate**; the three presidents hawkish on statement **language** |
| 2026-06-17 | 12–0 | — | first Warsh-chaired meeting |
| 2026-07-29 | 9–3 | Hammack, Kashkari, Logan | hawkish, preferred a 25bp **hike** |

Target range 3.50–3.75% at every 2026 meeting. IORB 3.65%, primary credit 3.75%.

**Direction is not recoverable from the FOR/AGAINST flag.** April had four
dissenters pointing in two directions, and three of the four agreed with the rate
and dissented on statement language. Direction lives in
`participants/_2026_meeting_outcomes.json` and in each `priors.json` under
`record_2026.dissent_detail`.

**The escalation is the signal.** Hammack, Kashkari and Logan dissented on
easing-bias language in April; by July all three wanted a hike. That is the
strongest dissent signal in the record. It also confirms the July account the
execution plan flagged as doubtful — the minutes say exactly 9–3 with three
preferring a hike.

Miran's three dovish dissents leave the committee with him, which mechanically
shifts the dissent base rate hawkish.

---

## Corrections you should know about

- **January 2026 was 10–2, not 11–1.** Waller dissented alongside Miran.
- **Waller has 3 career dissents, not 1** — 2025-03-19 (balance-sheet runoff, not
  the rate), 2025-07-30 and 2026-01-28 (both preferring a cut). Earlier counts
  were reading a PDF parsing gap, not his record. A model treating him as
  near-zero dissent risk is wrong.
- **The Board speech index undercounts appearances, and not at random.** It omits
  "Discussion" events, which have no prepared text. Corrected: **13 indexed + 6
  calendar-only = 19** in-window Board appearances, including Warsh at the ECB
  forum in Sintra on 1 July. Any frequency-based salience measure must use
  `12_calendars/` as the denominator and the speech index as the numerator. The
  bias is largest for people who favour unscripted formats — which is exactly why
  Goolsbee has two appearances and zero transcripts.
- **The statement format broke at the June 2026 meeting.** Statements name every
  voter through April, then give only an aggregate tally. Minutes lag ~3 weeks,
  so there is now a blind window per meeting that did not exist under Powell.
- **Dissenters publish first-person explanations at meeting+2 days**, on their
  *district bank* sites, not federalreserve.gov. Fastest attributable per-person
  signal available. Index: `_manifest/dissent_statements_index.json`.

---

## Gaps — handle before extraction, not during

- **Powell: zero in-window documents.** Sitting governor and voter, silent since
  handing over the chair. A real salience signal, but his position is
  unextractable from his own record. Do not substitute chair-era remarks — those
  were institutional, not personal, and out of window. Report an explicit
  no-signal prior and let the sensitivity sweep show how much rides on him.
- **Goolsbee: two appearances, no transcript for either.** Non-voter, submits a dot.
- **Warsh: four in-window documents** and he is the most important actor.
  `background/` holds his 2014 Bank of England MPC transparency review, his April
  confirmation statement, and a pre-Fed bibliography — for clout and framing,
  never for a September position. His agenda power is unestablished at one
  meeting as Chair: model it high and low and publish both.
- **Venable: no voting record at all.** Interim, non-voting district in 2026. Her
  one in-window document is a quarterly essay, not a policy speech.
- **President tenure dates are not in this corpus.** `priors.json` leaves them
  null rather than filling from memory. `first_fomc_vote` is a sourced lower bound.
- **No futures/OIS quotes.** Licensed data, no public primary source. The
  Treasury curve and the Committee's own readings from the minutes are in
  `11_market_context/`.
- **No speech or hearing Q&A.** Structural: the Fed publishes "Discussion" events
  calendar-only, and congressional Q&A appears in the printed record months later.
- **No charts.** There are zero image files in this corpus. The dot plots exist
  as CSV and JSON counts, not as plots. Nothing here is ready to paste into a
  deck; figures have to be drawn from the data.
- **16 archive dot vintages are unverified** — 2012-01 through 2015-09, where the
  older chart rendering defeats pixel counting, and 2016-12, where dots overlap
  too heavily to resolve. No discrepancy was found in any of them; they are
  simply unchecked by the second method. They are context, not the baseline.

---

## Open

**Waller, Reuters NEXT "Economic Outlook", 2026-09-03.** A voting governor, on the
outlook, two days before blackout. The last material input before the cutoff.
Capture into `participants/waller/speeches/`.

---

## Conventions

- Every file states its source URL and capture date in a header.
- Where a document could not be retrieved, a file says so and why, with the URL.
  **Nothing was silently substituted.**
- Where something was inferred and later proved wrong, the wrong file was kept
  and annotated `SUPERSEDED` rather than deleted, so the failed reasoning stays
  visible. See `10_structural/` and `_manifest/superseded/`.
- Bracketed `[NOTES]` inside document files are mine, not the Fed's. The document
  text itself is verbatim.
- Shell egress to federalreserve.gov and district bank sites is blocked by the
  session proxy. Everything here was pulled verbatim through the browser DOM.
