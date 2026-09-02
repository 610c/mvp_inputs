# data_mvp — dataset map

**What is in each folder, what it is for, and what not to trust.**
Built 2026-09-02. Corpus root: `/Users/vineel/Desktop/thebloc/data_mvp`.

Four docs sit at the root and do different jobs:

| File | Job |
|---|---|
| `README.md` | **start there** — what the corpus is, its state, its gaps |
| `_DATASET_MAP.md` | **this file** — folder-by-folder contents |
| `_CORPUS_README.txt` | acquisition manifest, organised by requested item number |
| `_BLOCKED_AND_FUTURE.md` | what could not be retrieved and why |

The 1 September capture note, the pre-egress shell scripts and two stray
`default.htm` files are in `_manifest/superseded/`. Historical only.

---

## The two layers

The corpus has an **archive layer** (numbered folders, organised by source and
document type, the provenance authority) and a **model layer**
(`participants/`, organised by person, what the extraction actually reads).
Nothing was moved between them — the model layer holds copies.

```
data_mvp/
├── participants/          MODEL LAYER — the extraction entry point
└── 01_sep/ … 13_jacksonhole/   ARCHIVE LAYER — provenance
```

---

## participants/ — 19 people, 75 files

The only folder the extraction layer should open.

```
participants/
├── _README.txt                    rules, per-person gaps, cutoff. Read first.
├── _2026_meeting_outcomes.json    committee 2026 record, dissent DIRECTIONS
└── <key>/                         19 dirs: warsh jefferson bowman barr cook
    ├── speeches/                  powell waller williams hammack kashkari
    ├── testimony/                 logan paulson barkin daly goolsbee venable
    ├── interviews/                collins musalem schmid
    ├── background/
    ├── votes.json                 full FOMC voting history
    └── priors.json                role, tenure, SEP/vote status, corpus inventory
```

- **Window: 2026-06-18 to 2026-09-04.** Nothing dated later, ever.
- `background/` is **out of window** — currently Warsh only. Never feed it to a
  position extractor.
- Files ending `_NO_TRANSCRIPT.txt` are **stubs**: an appearance happened, no
  transcript exists. Count them for frequency; they carry no position signal.
- 12 of the 19 vote. 18 of the 19 submit a dot (not Warsh).
- **Read each person only from their own directory.** Concatenating directories
  is the failure mode that produces nineteen identical HOLDs.

---

## Archive layer

### `01_sep/` — Summary of Economic Projections (35 MB, 112 files)
The dot plots. This is where the primary test's ground truth comes from.

| Path | Contents |
|---|---|
| `2026-06/` | **the baseline.** `fomcprojtabl20260617.pdf` + `figure2_dots.csv/.json` — exact dot counts per eighth. Column totals 2026=18, 2027=18, 2028=17, LR=18 |
| `2026-03/` | same three files for March. **19 dots** — the last vintage that includes a Chair |
| `archive/` | 53 raw SEP PDFs, every vintage 2012-01-25 → 2025-12-10, plus `dots/` with per-vintage CSVs for all 52 |
| `_DOT_VERIFICATION.txt` | **independent re-derivation of every dot count** by pixel-counting the figures. 38 of 54 vintages verified exact, both 2026 vintages among them. Names the 16 the method cannot resolve |

The March→June break is real: Warsh submits no dot. Do not compare medians
across it. See `10_structural/sep_participant_count_RESOLVED.txt`.

### `02_statements/` — 2026 policy statements (1.5 MB)
`2026/` holds all five meetings as `.txt`, `.htm` and `.pdf`, plus
`voting_lines_2026.json` which labels the **format change**: statements name
every voter through April, then give only an aggregate tally ("12 - 0") from
June. That is why 2026 vote attribution comes from minutes, not statements.

### `03_minutes/` — FOMC minutes (52 MB, 140 files)
| Path | Contents |
|---|---|
| `2026/` | all five 2026 meetings (Jan/Apr/Jul text, Mar/Jun PDF) + `_2026_vote_record_VERBATIM.txt` |
| `archive/` | 134 historical minutes PDFs, 2007 onward |

**The authority for every vote from June 2026 onward.**

### `04_statements_archive/` — statements 1999–2026 (12 MB, 267 files)
| Path | Contents |
|---|---|
| `text/` | 185 extracted statement texts, 1999–2020 |
| root | 78 raw `.htm`/`.pdf`, 2021–2025 plus some 2011–12 |
| `dissents_2002_2026.tsv/.csv` | dissent series |
| `_COVERAGE_README.txt` | **read this** — dissent count, sign and subject are three different variables |

This is what `votes.json` was parsed from.

### `05_speeches/` — per-participant text (420 KB)
| Path | Contents |
|---|---|
| `board/` | 12 in-window Board speech texts (Barr 2, Bowman 3, Cook 3, Jefferson 1, Waller 3) + `board_speeches_2026_index.csv/.json` + `_DENOMINATOR_CORRECTION.txt` |
| `districts/` | one folder per Reserve Bank (12) + per-district indexes |

**`_DENOMINATOR_CORRECTION.txt` matters for salience.** The Board's speech index
lists "Speech" events but not "Discussion" events, so it undercounts appearances
and not at random — six in-window appearances are missing from it, including
Warsh at the ECB forum in Sintra on 1 July. Corrected total: 14 indexed + 6
calendar-only = 20. Any frequency-based salience measure built on the index
alone has the wrong denominator. Corrected: **13 indexed + 6 calendar-only = 19
in-window Board appearances.** 12 of the 13 indexed are captured as text; the
13th is Waller's 3 September Reuters NEXT speech, which has not happened yet.
Treat the speech index as the *numerator* (documents available) and the monthly
calendars in `12_calendars/` as the denominator.

### `06_press_conf/` — Warsh press conferences (76 KB)
Full transcripts, 17 June and 29 July. The only extended Q&A with the Chair in
the window, and the source of the "I did not submit a dot" quote.

### `07_mpr_testimony/` — Monetary Policy Report (52 KB)
July 2026 MPR summary and Part 2, Warsh's 14 July semiannual statement, a
testimony index, and `_mpr_202607_status.txt` recording that Part 1 was deferred.
Hearing **Q&A is not published as text** by either chamber.

### `08_warsh/` — the Chair (2.8 MB)
Jackson Hole keynote "In Our Time" (28 Aug), April confirmation opening
statement, pre-Fed writings bibliography, and the **2014 Bank of England MPC
transparency review** (PDF + full 174k-char text).

The BoE review is the best evidence on his priors: he redesigned another central
bank's disclosure of committee deliberations, recommending that individual votes
be published *and* the deliberative record be deferred five to eight years. Those
pull in opposite directions for this dataset. He also never dissented once in his
own five years as a governor.

### `09_beigebook/` — July 2026 Beige Book (156 KB)
Summary + all twelve districts + index. District-level conditions, useful for
reading a president's regional framing against what their own bank reported.

### `10_structural/` — who is who (44 KB)
| File | Contents |
|---|---|
| `sep_participant_count_RESOLVED.txt` | **Warsh submits no dot.** Verbatim quotes, arithmetic closes both ways |
| `fomc_membership_2026-07-29_from_minutes.txt` | full roster from the minutes attendance section. Contains a **superseded** wrong inference, kept and annotated |
| `CRS_R48233_board_membership.txt` | governor appointment dates, terms, confirmation votes. Presidents are **not** in it |
| `standing_situation_2026-09-02.txt` | chair transition, Miran resignation, Cook litigation, the five task forces |
| `board_committee_assignments_2026.txt` | committee assignments |

### `11_market_context/` — macro (32 KB)
Treasury yield curve May–Sep (84 business days × 14 tenors), macro release
calendar, macro state as of 28 Aug. `_rate_expectations_README.txt` explains why
there are no futures/OIS quotes: **licensed data, no public primary source.**

### `12_calendars/` — Fed calendars, June–September 2026 (16 KB)
The source for appearances the speech index omits.

### `13_jacksonhole/` — 2026 symposium (15 MB, 19 files)
Full program + 18 papers, handouts and slide decks. "General Discussion"
sessions appear only in the bound proceedings volume, published months later.

### `_manifest/` — capture bookkeeping (24 KB)
Allowlist domains and `dissent_statements_index.json` — dissenters publish
first-person explanations on their **district bank** sites at meeting+2 days, not
on federalreserve.gov, and it is the fastest attributable per-person signal
available.

`superseded/` holds the 1 September capture note, the merged corpus-state doc,
`fetch_all.sh` and `cleanup_downloads.sh` (written for a shell that turned out to
have no egress; never needed), an empty `data.txt`, and two stray `default.htm`
files. All historical. Nothing here is an input.

---

## Conventions

- Every file states its source URL and capture date in a header.
- Where a document could not be retrieved, a file says so and why, with the URL.
  **Nothing was silently substituted.**
- Where something was inferred and later proved wrong, the wrong file was kept
  and annotated `SUPERSEDED` rather than deleted, so the failed reasoning stays
  visible. See `10_structural/`.
- Bracketed `[NOTES]` inside document files are mine, not the Fed's. Document
  text itself is verbatim.

## Root is clean

Only four documents and the two layers. Everything from the 1 September capture
that no longer describes reality is in `_manifest/superseded/`.
