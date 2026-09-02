participants/ — per-participant corpus for the September 2026 FOMC MVP
Built 2026-09-02. Structure required by fomcexecutionplan.md §4, days 1-2.

===============================================================================
1. LAYOUT
===============================================================================

  participants/<key>/
      speeches/      in-window, dated, verbatim text
      testimony/     in-window congressional testimony
      interviews/    press conferences, TV/podcast appearances; files ending
                     _NO_TRANSCRIPT.txt are STUBS recording that an appearance
                     happened and no transcript exists. They carry a date and
                     a venue and nothing else. Count them for salience-by-
                     frequency; they contain no position signal.
      background/    OUT-OF-WINDOW material, present only where it is the only
                     record of a participant's views. Currently Warsh only.
                     Never feed background/ to a position extractor.
      votes.json     full FOMC voting history
      priors.json    role, tenure, SEP/voting status, vote summary, corpus
                     inventory

19 keys = the 19 SEP participants. 12 are 2026 voters. 18 submit a dot.

===============================================================================
2. HARD RULES (execution plan §4, non-negotiable)
===============================================================================

CUTOFF. Nothing dated after 2026-09-04 enters any participant directory, ever,
including retrospectively after the 16 September outcome is known. The window
opens 2026-06-18 (the day after the June meeting) and closes 2026-09-04.
Blackout begins 2026-09-05.

DATED. Every file name carries a YYYYMMDD. Anything undated was discarded and
is not here.

ISOLATION. Each participant is read only from their own directory. Do not
concatenate directories, do not supply committee-level context, do not let one
agent see two participants. The failure this prevents — nineteen identical LLM
calls all returning HOLD — is the most likely way this project produces a
confident null.

VOTES FROM PRIMARY SOURCES ONLY. See section 3.

===============================================================================
3. HOW votes.json WAS BUILT
===============================================================================

Parsed from the "Voting for this action / Voting against this action" rosters
in FOMC statements 1999-2026 (04_statements_archive/) and, from 2026-06-17
onward, from the minutes (03_minutes/2026/), because the statement format
changed under Warsh and stopped naming the full roster.

Three meetings existed only as PDFs and were extracted separately on
2026-09-02, verbatim:

  2025-03-19  monetary20250319a1.pdf   11-1, Waller against
  2025-07-30  monetary20250730a1.pdf   9-2, Bowman and Waller against;
                                       Kugler absent and not voting
  2026-06-17  fomcminutes20260617.pdf  12-0, none against

2025-08-22 (monetary20250822a.htm) is the framework-update announcement, not a
policy decision. It correctly carries no voting line and is correctly absent.

A dissent here means the person was named under "Voting against". It does NOT
distinguish a rate dissent from a statement-language or balance-sheet dissent
(e.g. Waller 2025-03-19 supported the rate but dissented on the pace of
balance-sheet runoff). If direction of dissent matters to the model, read the
dissent sentence, not this flag. See 04_statements_archive/_COVERAGE_README.txt.

2026 committee outcomes, for cross-checking any recomputation:
  2026-01-28  10-2   Miran and Waller against, both preferring a 25bp CUT
  2026-03-18  11-1   Miran against, preferring a 25bp CUT
  2026-04-29   8-4   Miran against on the RATE (dovish); Hammack, Kashkari and
                     Logan against on statement LANGUAGE (opposed the easing bias)
  2026-06-17  12-0
  2026-07-29   9-3   Hammack, Kashkari and Logan against, preferring a 25bp HIKE.
                     This CONFIRMS the July account the execution plan flagged as
                     doubtful. Primary source, minutes, verbatim.
Miran left the Board before the June meeting and is not a September
participant. He has no directory here. His three dovish dissents leave the
committee with him, which mechanically shifts the dissent base rate hawkish.

Direction of dissent is in _2026_meeting_outcomes.json (committee level) and in
each priors.json under record_2026.dissent_detail. It is NOT recoverable from
the FOR/AGAINST flag in votes.json, and the April case shows why: four people
dissented at the same meeting in opposite directions, and three of the four were
dissenting on statement language while agreeing with the rate.

===============================================================================
4. THE CHAIR DOES NOT SUBMIT A DOT
===============================================================================

Warsh stated in the 2026-06-17 press conference that he submits no SEP
projections and no dot. Verbatim quotes in
10_structural/sep_participant_count_RESOLVED.txt.

Consequences for the primary test:
  - The predicted histogram has 18 dots, not 19. June 2026 column totals are
    2026=18, 2027=18, 2028=17, longer_run=18. The 2028 short count is routine
    (29 of 52 historical vintages have uneven columns), not a dropped dot.
  - The June median EXCLUDES the Chair. Do not read the most important
    participant out of the model by treating the median as containing him.
  - March 2026 (19 dots) and June 2026 (18 dots) are on opposite sides of a
    series break. Do not compare medians naively across it.
  - Warsh's position must come from his own text, and it enters the solver
    through clout and agenda-setting, not through the histogram.

===============================================================================
5. KNOWN GAPS — read before extracting
===============================================================================

POWELL: zero in-window documents. A sitting governor and voter who has made no
public appearance since handing over the chair. This is a real signal about
salience, not a corpus failure, but it means his position is unextractable from
his own record. Do not substitute his pre-May-2026 chair-era remarks; those
were institutional, not personal, and they are out of window. Report an explicit
no-signal prior and let the sensitivity sweep show how much the result depends
on him.

GOOLSBEE: two appearances in window, no transcript for either. Same treatment;
non-voter, so lower stakes, but he does submit a dot.

WARSH: only four in-window documents (Jackson Hole 2026-08-28, MPR testimony
2026-07-14, and the June and July press conferences), and he is the single most
important actor in the model. background/ holds his 2014 Bank of England MPC
transparency review, his April 2026 confirmation opening statement, and a
bibliography of pre-Fed writings. These are the best available evidence on his
priors and they are deliberately quarantined — out of window, and useful for
setting clout and reading his framing, not for extracting a September position.
His effective agenda power is unestablished at one meeting as Chair; the plan
requires modelling it high and low and publishing both.

VENABLE: no voting record at all (interim, first year, non-voting district in
2026). Her one in-window document is a quarterly essay, not a policy speech.

PRESIDENT TENURE DATES are not in this corpus. priors.json leaves them null
rather than filling them from memory. first_fomc_vote is a primary-sourced
lower bound.

===============================================================================
6. STILL OPEN AT TIME OF WRITING
===============================================================================

Waller, Reuters NEXT "Economic Outlook", 2026-09-03. A voting governor speaking
on the outlook two days before blackout. Not yet delivered. This is the last
material input before the cutoff and should be captured on the 3rd and placed
in waller/speeches/.
