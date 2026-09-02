# FOMC Sept 2026 MVP — corpus state

**As of 2026-09-02.** Corpus root: `/Users/vineel/Desktop/thebloc/data_mvp`.

Mirror of the doc in the `bloc` project (`claude/fomc_mvp_corpus_state.md`).
If the two ever disagree, the files in this folder are the authority.

## Entry point

`participants/` is what the extraction layer reads. 19 SEP participants, each with
`speeches/ testimony/ interviews/ background/`, `votes.json`, `priors.json`.
`participants/_README.txt` carries the rules, the known gaps and the cutoff.
The numbered directories (`01_sep/` … `13_jacksonhole/`) are the archive it was
built from and remain the provenance authority.

## Roster arithmetic

- 19 SEP participants, **12 voters**, **18 dots**.
- **Warsh submits no dot.** Stated in the 17 June press conference, verbatim in
  `10_structural/sep_participant_count_RESOLVED.txt`. The June median excludes
  the Chair. March 2026 (19 dots) and June 2026 (18) sit on opposite sides of a
  series break.
- June 2026 column totals: 2026=18, 2027=18, 2028=17, longer_run=18. The short
  2028 column is routine (29 of 52 historical vintages have uneven columns).
- Miran left the Board before the June meeting. Not a September participant.

## 2026 vote record — complete, from minutes

| Date | Tally | Against | Direction |
|---|---|---|---|
| 2026-01-28 | 10–2 | Miran, Waller | dovish, both wanted a 25bp cut |
| 2026-03-18 | 11–1 | Miran | dovish |
| 2026-04-29 | 8–4 | Miran; Hammack, Kashkari, Logan | Miran dovish on the **rate**; the three presidents hawkish on statement **language** (opposed the easing bias) |
| 2026-06-17 | 12–0 | — | first Warsh-chaired meeting, unanimous |
| 2026-07-29 | 9–3 | Hammack, Kashkari, Logan | hawkish, preferred a 25bp **hike** |

Target range unchanged at every 2026 meeting; IORB 3.65%, primary credit 3.75%.

Two findings from the 2026-09-02 pass:

1. **January was 10–2, not 11–1.** Waller dissented alongside Miran.
2. **Waller has 3 career dissents, not 1** (2025-03-19 on balance-sheet runoff,
   2025-07-30 and 2026-01-28 on the rate). Earlier counts were reading a PDF
   parsing gap, not his record.

And one confirmation: the execution plan flagged the July account as doubtful —
*"9–3 with three preferring a hike … does not match other reporting."* The
minutes say exactly that. Their April dissent was on language; by July they had
escalated to wanting a hike. That escalation is the strongest dissent signal in
the record.

Direction of dissent lives in `participants/_2026_meeting_outcomes.json` and in
each `priors.json` under `record_2026.dissent_detail`. It is **not** recoverable
from the FOR/AGAINST flag — April had four dissenters pointing in two directions.

## Extraction gaps to handle before, not during, extraction

- **Powell: zero in-window documents.** Sitting governor and voter, silent since
  handing over the chair. Real salience signal, but his position is
  unextractable from his own record. No substituting chair-era remarks.
- **Goolsbee: two appearances, no transcript for either.** Non-voter, submits a dot.
- **Warsh: only four in-window documents** and he is the most important actor.
  His out-of-window material (2014 BoE MPC review, April confirmation statement,
  pre-Fed bibliography) is quarantined in `background/` — for clout and framing,
  never for a September position. Agenda power unestablished at one meeting;
  the plan requires modelling it high and low and publishing both.
- **President tenure dates are not in the corpus.** `priors.json` leaves them
  null rather than filling from memory; `first_fomc_vote` is a sourced lower bound.

## Open

**Waller, Reuters NEXT "Economic Outlook", 2026-09-03.** Voting governor, on the
outlook, two days before blackout. The last material input before the cutoff.
Capture on the 3rd into `participants/waller/speeches/`.

Cutoff is 2026-09-04. Blackout 2026-09-05. Decision 2026-09-16, 2pm ET.

## Where the other index files are

- `_CORPUS_README.txt` — master manifest, item-by-item acquisition status
- `_BLOCKED_AND_FUTURE.md` — paywalled, unpublished, licensed, future-dated
- `participants/_README.txt` — extraction rules and per-participant gaps
- `participants/_2026_meeting_outcomes.json` — committee 2026 record, verbatim
