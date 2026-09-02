ITEM 6 — FOMC STATEMENT ARCHIVE: COVERAGE AND HOW TO USE IT
Completed 2026-09-02.

================================================================
WHAT IS HERE
================================================================
text/            185 statement texts, 1999-05-18 through 2020-12-16,
                 verbatim, one file per release, named
                 fomc_statement_YYYYMMDD.txt
*.htm / *.pdf    78 raw source files. These are the 2021-2025 statements
                 (46 meetings) plus a handful of 2011-2012 originals.
                 For 2021-2025 the RAW FILE IS THE DOCUMENT — no text
                 extraction was done because none was needed.
dissents_2002_2026.tsv / .csv
                 77 dissent events, date + verbatim dissent sentence.
dissents_README.json
../02_statements/2026/
                 The five 2026 statements, verbatim, plus
                 voting_lines_2026.json.

SO THE FULL SERIES 1999-2026 IS COVERED, in three formats:
  1999-2020  -> text/ (extracted, verbatim)
  2021-2025  -> raw .htm in this directory
  2026       -> ../02_statements/2026/

================================================================
WHAT COUNTS AS A MEETING — READ BEFORE BUILDING A DENOMINATOR
================================================================
Not every file in text/ is a scheduled meeting statement. The series
includes INTERMEETING and NON-RATE releases, each flagged inline in the
file itself with a bracketed note. They are:

  20070810  liquidity statement, NO voting line
  20080311  TSLF/swap-line announcement, NO voting line
  20081008  coordinated global rate cut — HAS a full voting line
  20100509  swap-line reestablishment, NO voting line
  20191011  monetary policy implementation, notation vote, unanimous
  20200303  emergency 50bp cut — HAS a full voting line, unanimous
  20200323  unlimited QE, notation vote, unanimous
  20200331  FIMA Repo Facility, NO voting line
  20200827  2020 framework revision (FAIT), unanimous, not a rate decision

If your unit of observation is "scheduled FOMC meeting," drop the four
with no voting line and decide explicitly how to treat the notation votes
and the two intermeeting rate actions. Do not let them silently inflate
the denominator.

Also: 20070628 is filed under its TRUE release date. The Board's own
historical index links it under the slug 20070618a.htm. If you build
filenames from the Board's URLs you will get that date wrong.

================================================================
FIVE THINGS THE ARCHIVE SHOWS THAT SHOULD SHAPE THE MODEL
================================================================

1. A LARGE SHARE OF DISSENTS ARE ABOUT LANGUAGE, NOT THE RATE.
   Clear cases: Aug/Sep 2011 (Fisher, Kocherlakota, Plosser on "extended
   period"); Jul & Sep 2014 (Plosser on "considerable time"); Mar 2014
   (Kocherlakota naming which PARAGRAPH he objected to); Dec 2014 (all
   three); Sep 2020 (Kaplan and Kashkari, both on guidance, neither on
   the rate); Apr 2026 (Hammack, Kashkari, Logan on the easing bias).
   A coding scheme built on "preferred a different target range" misses
   every one of these.

2. OPPOSITE-DIRECTION DISSENTS AT THE SAME MEETING ARE NOT RARE.
   Jun 2013 (Bullard dovish, George hawkish); Dec 2014 (three dissents,
   three different objections); Sep 2019 (Bullard wanted a deeper cut,
   George and Rosengren wanted none); Sep 2020 (Kaplan and Kashkari in
   opposite directions on guidance); Apr 2026 (Miran dovish, three hawks).
   A signed dissent variable nets these toward zero and reports a
   consensus that did not exist.

3. SERIAL DISSENTERS STOP WHEN THEY GET WHAT THEY WANTED, NOT WHEN THEY
   CHANGE THEIR MINDS.
   Lacker dissents Sep and Oct 2015 demanding a hike, votes yes at the
   December liftoff. George dissents at four 2016 meetings demanding a
   hike, votes yes in December. George and Rosengren dissent through the
   2019 cuts, vote yes the moment cutting stops. Dissent is a demand
   about a specific decision, not a stable personal trait — which is
   exactly the thing a "propensity" model risks assuming away.

4. BLOC DISSENT AND SCATTERED DISSENT ARE DIFFERENT PHENOMENA.
   Sep 2016: three dissents, identical wording, one position. Dec 2014:
   three dissents, three distinct objections. Both are "n=3." They are
   not the same event and should not be pooled.

5. UNANIMITY DOES NOT MEAN AGREEMENT.
   December 2018 — one of the most publicly contested decisions of the
   decade, reversed within seven months — was UNANIMOUS. The 2015 run of
   five straight unanimous meetings reflects a rate pinned at the lower
   bound with nothing on the table, not consensus. Use the minutes'
   participant language ("many participants," "several participants") as
   a second, finer measure of disagreement; the April 2026 minutes show
   "many participants" wanting a statement change that only three voted
   against.

================================================================
KEY PERSONNEL FIRSTS AND LASTS VISIBLE IN THE VOTING LINES
================================================================
  Warsh      first vote 2006-03-28, last vote 2011-01-26.
             ~40 meetings, ZERO dissents. He is now Chairman.
  Powell     first vote 2012-06-20 as governor; Chair from 2018-03-21;
             still a sitting governor in 2026 after the Warsh transition.
  Yellen     Chair 2014-03-19 to 2017-12-13.
  Bernanke   Chairman to 2014-01-29.
  Daly       first vote 2018-11-08; votes as ALTERNATE 2020-11-05.
  Bowman     first vote 2018-12-19.
  Cumming    votes as alternate for Geithner, 2008-09-16.
