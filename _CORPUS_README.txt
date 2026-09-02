FOMC DISSENT & SALIENCE MVP — CORPUS MANIFEST
Built 2026-09-01 / 2026-09-02.  648 files, 117 MB.
Scoring window for per-participant material: 18 June – 4 September 2026.

================================================================
STATUS BY REQUESTED ITEM
================================================================
COMPLETE (28)
  1  June 2026 SEP           01_sep/2026-06/   PDF + figure2_dots.csv/.json
  2  March 2026 SEP          01_sep/2026-03/   same
  4  2026 statements x5      02_statements/2026/ + voting_lines_2026.json
  5  2026 minutes x5         03_minutes/2026/  Jan/Apr as verbatim text,
                             Mar/Jun as PDF, Jul as text
                             + _2026_vote_record_VERBATIM.txt
  6  Statements back to 1999 04_statements_archive/  see its _COVERAGE_README
  7  July 2026 minutes       03_minutes/2026/fomcminutes20260729.txt
  8  Warsh Jackson Hole      08_warsh/warsh20260828_jackson_hole_in_our_time.txt
  9  Press conferences       06_press_conf/  Jun 17 + Jul 29 transcripts
 12  Warsh confirmation      08_warsh/warsh_20260421_..._opening_statement.txt
 14  September Beige Book    09_beigebook/  summary + all 12 districts
 15  Board speeches          05_speeches/board/  all 13 in-window
 16  All twelve districts    05_speeches/districts/  + per-district indexes
 17  Every speech, not just  covered by 15/16 + _DENOMINATOR_CORRECTION.txt
     monetary policy
 19  Q&A after speeches      ESTABLISHED AS UNAVAILABLE — see below
 20  Fed calendars Jun-Sep   12_calendars/
 21  Jackson Hole program    13_jacksonhole/  full agenda + all paper URLs
 22  CRS R48233              10_structural/CRS_R48233_board_membership.txt
 23  Board committees        10_structural/board_committee_assignments_2026.txt
 24  Alternate members       resolved from primary source in the 2026 minutes;
                             see _2026_vote_record_VERBATIM.txt
 25  Atlanta interim / SEP   10_structural/sep_participant_count_RESOLVED.txt
                             resolved twice, independently
 26  Macro release calendar  11_market_context/macro_release_calendar_2026.txt
 29  Standing situation      10_structural/standing_situation_2026-09-02.txt
 30  Current target range    3-1/2 to 3-3/4 percent, unchanged all of 2026

  3  SEP archive 2012-      COMPLETE. 53 raw PDFs, every vintage
     present                2012-01-25 through 2025-12-10, plus dot-plot
                            CSVs for all 52. 01_sep/archive/
 13  Warsh BoE review       COMPLETE. PDF + full 174k-char text, 08_warsh/
 21  Jackson Hole papers    COMPLETE. 18 PDFs, 13_jacksonhole/

PARTIAL (2) — each has an explicit note in its own directory
 10  July 2026 MPR          Summary + Part 2 captured. Part 1 (83k chars)
                            deferred; see 07_mpr_testimony/_mpr_202607_status.txt
 11  Semiannual testimony   Warsh's 2026-07-14 statement captured. Q&A is
                            not published as text by either chamber.
 13  Warsh pre-Fed writings Complete dated bibliography (~35 WSJ op-eds +
                            10 long-form). The 2014 BoE review is now
                            captured in full. WSJ OP-ED TEXT REMAINS
                            PAYWALLED. The AEI "Money Matters" chapter was
                            not located.
 27  Fed funds futures/OIS  11_market_context/  Full daily Treasury curve
                            May-Sep + the Committee's own futures readings
                            verbatim from the minutes. Actual futures/OIS
                            quotes are licensed data with no public primary
                            source. See _rate_expectations_README.txt.

NOT DONE (1)
 28  CME FedWatch snapshot  Dated 4 September 2026. That date had not
                            arrived at capture time.

================================================================
DOWNLOADS — ALL CLEARED 2026-09-02
================================================================
The three download-gated items are done: 35 SEP PDFs, the BoE review, and
18 Jackson Hole PDFs. All validated as real PDFs. See _BLOCKED_AND_FUTURE.md
section 6, which also retracts my earlier wrong claim that the BoE review was
a scan needing OCR — it was encrypted, not scanned, and extracted cleanly.

What genuinely cannot be retrieved is now only: the WSJ op-ed texts
(paywalled), speech and hearing Q&A (unpublished), futures/OIS quotes
(licensed), and the 4 Sep FedWatch snapshot (future-dated). All in
_BLOCKED_AND_FUTURE.md.

================================================================
ITEM 19 — WHY THE Q&A IS NOT HERE
================================================================
This is a structural gap in the source material, not a retrieval failure.
The Board publishes "Speech" events (prepared text, indexed) and
"Discussion" events (calendar-only, no text at all). Six of the nineteen
in-window Board appearances are Discussions with nothing published —
including WARSH AT THE ECB FORUM IN SINTRA on 1 July 2026. Jackson Hole
"General Discussion" sessions appear only in the bound proceedings volume,
published months later. Nomination-hearing and semiannual-testimony Q&A
appear only in the printed congressional record, also months later.
Details: 05_speeches/board/_DENOMINATOR_CORRECTION.txt

================================================================
FILES TO READ FIRST
================================================================
If you read nothing else, read these five. They contain corrections to
assumptions the corpus request was built on, and each one changes how
the data should be used:

  05_speeches/board/_DENOMINATOR_CORRECTION.txt
      The speech index undercounts appearances, and not at random.
      Warsh made two in-window appearances, not one.

  03_minutes/2026/_2026_vote_record_VERBATIM.txt
      April 2026 had four dissents and three of them were about statement
      language, not the rate.

  10_structural/standing_situation_2026-09-02.txt
      Miran resigned in May; Warsh took his seat, not Powell's. And the
      Communications task force chartered on 9 July is a live threat to
      the stability of your dependent variable.

  04_statements_archive/_COVERAGE_README.txt
      Twenty-four years of evidence that dissent count, dissent sign and
      dissent subject are three different variables.

  08_warsh/warsh_2014_boe_mpc_transparency_review.txt
      Now the FULL 64-page report. The incoming Chairman previously
      redesigned another central bank's disclosure of committee
      deliberations — he recommended publishing individual members' votes
      AND deferring the deliberative record five to eight years. Applied to
      the FOMC those pull in opposite directions for your data. He also
      never dissented once in his own five years as a governor.

================================================================
CONVENTIONS
================================================================
- Every file states its source URL and capture date in a header.
- Where a document could not be retrieved, there is a file saying so and
  why, with the URL. Nothing was silently substituted.
- Where I inferred something and was later proved wrong, the wrong file
  was kept and annotated SUPERSEDED rather than deleted, so the failed
  reasoning stays visible (see 10_structural/).
- Bracketed [NOTES] inside document files are mine, not the Fed's. The
  document text itself is verbatim.
