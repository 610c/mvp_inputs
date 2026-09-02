ITEM 27 — FED FUNDS FUTURES / OIS CURVE
Status as of 2026-09-02: PARTIALLY SATISFIED, with an honest substitution.
Read this before using anything in this directory as a market-expectations input.

================================================================
WHAT WAS ASKED FOR VS. WHAT IS HERE
================================================================
ASKED: fed funds futures / OIS curve.
HERE:  (a) the daily Treasury par yield curve, complete, from primary source;
       (b) the FOMC's OWN reported market-expectations readings, verbatim
           from the 2026 minutes;
       (c) an explanation of why (a)+(b) is what you can get without paid data.

WHY NOT ACTUAL FUTURES/OIS QUOTES:
Fed funds futures settle on CME. CME's FedWatch and its futures settlement
data are behind an interactive/licensed interface, and OIS quotes are
broker-dealer data (Bloomberg/Tradeweb/ICAP) that is not published free.
There is no public primary source for a fed funds futures strip or an OIS
curve. Rather than scrape a secondary aggregator and present a
possibly-stale, possibly-wrong curve as data, I captured what IS primary:
the Treasury curve, and the Committee's own written characterisation of
what futures and the Desk survey were pricing at each meeting.
Item 28 (CME FedWatch snapshot dated 4 Sep) is a separate line item and
its date had not arrived at capture time.

================================================================
FILES
================================================================
treasury_yield_curve_2026_may_sep.csv
  Daily Treasury par yield curve, 4 May 2026 – 1 Sep 2026, 84 business days.
  Columns: 1 Mo, 1.5 Mo, 2 Mo, 3 Mo, 4 Mo, 6 Mo, 1 Yr, 2 Yr, 3 Yr, 5 Yr,
           7 Yr, 10 Yr, 20 Yr, 30 Yr. Percent.
  Source: U.S. Department of the Treasury, Daily Treasury Par Yield Curve.
  Full-year 2026 CSV (all 168 business days to date):
    https://home.treasury.gov/resource-center/data-chart-center/interest-rates/daily-treasury-rates.csv/2026/all?type=daily_treasury_yield_curve&field_tdr_date_value=2026&page&_format=csv

macro_state_2026-08-28_from_warsh_JH.json   (pre-existing)
macro_release_calendar_2026.txt             (item 26)

================================================================
WHAT THE TREASURY CURVE SAYS ABOUT POLICY EXPECTATIONS
================================================================
Target range held all year at 3-1/2 to 3-3/4 percent; IORB 3.65; primary
credit rate 3.75.

The 1-month bill is the cleanest read on the near-term policy path.
Across the whole window it sits in a tight 3.65–3.85 band — i.e. INSIDE
the target range and pinned near IORB. Markets priced essentially no
near-term move for the entire corpus window. That is the single most
important context fact for reading the speeches: every participant in
this corpus is arguing about a decision the market did not expect.

But the term structure moved a great deal, and in one direction:
  2-Yr   4 May 3.95  ->  18 Jun 4.19  ->  4 Aug 4.20  ->  1 Sep 4.39
  10-Yr  4 May 4.45  ->  18 Jun 4.46  ->  4 Aug 4.63  ->  1 Sep 4.79
  30-Yr  4 May 5.02  ->  18 Jun 4.90  ->  4 Aug 5.18  ->  1 Sep 5.27
The long end rose ~35–40bp over the window while the front end barely
moved. The curve steepened out of a policy rate that stood still.

READ THIS ALONGSIDE COLLINS (Boston, 25 Aug), who names it explicitly:
  "mildly restrictive monetary policy, together with THE RECENT RISE IN
   LONGER-TERM INTEREST RATES, should mitigate, at least to some extent,
   a possible re-acceleration in household and business spending."
She is treating the long-end selloff as doing some of the Committee's
tightening for it. The CSV is the evidence for that claim.

NOTE THE JACKSON HOLE WEEK: 2-Yr goes 4.17 (25 Aug) -> 4.20 (27th) ->
4.34 (28th, Warsh's keynote) -> 4.34 (31st) -> 4.39 (1 Sep). A 17bp
front-end move across the symposium, most of it on and after the keynote
day. That is a market repricing the policy path off a Warsh speech —
worth treating as a measurable event study rather than an anecdote.
(warsh20260828_jackson_hole_in_our_time.txt)

================================================================
THE COMMITTEE'S OWN EXPECTATIONS READINGS — verbatim from the minutes
================================================================
These are the FOMC's descriptions of what futures/OIS and the Open Market
Desk Survey of Market Expectations were pricing. They are the closest
thing to an authoritative futures reading in the public record.

JANUARY 27-28, 2026 (fomcminutes20260128.txt):
  "Market- and survey-based policy rate expectations were likewise little
   changed. Market-based measures of policy rate expectations indicated
   one to two 25 basis point rate cuts this year, and the median modal
   path of the federal funds rate, as given in the Desk survey, continued
   to indicate expectations of two 25 basis point rate cuts this year."

APRIL 28-29, 2026 (fomcminutes20260429.txt):
  "market-implied expectations still indicated that market participants
   anticipated little change this year in the target range for the federal
   funds rate, and options prices implied around a 30 percent probability
   of A RATE HIKE by the first quarter of 2027. In the Desk survey, the
   median of the modal paths continued to show two 25 basis point rate
   reductions over the next year, but respondents now expected them to
   occur later than in the previous survey, with rate cuts expected in the
   third or fourth quarter of 2026 and the first quarter of 2027."
  Also, on the crude oil curve:
  "the crude oil futures curve was higher than the curve prevailing at the
   time of the March FOMC meeting. The curve remained steeply downward
   sloping, consistent with investor expectations of oil prices falling
   considerably in coming months. The manager noted, however, that the
   curve's forecasting record was mixed."

THE TRAJECTORY THAT MATTERS:
  Jan  -> market prices 1-2 cuts in 2026; survey modal path 2 cuts in 2026
  Apr  -> market prices ~no change in 2026, and a 30% chance of a HIKE by
          Q1 2027; survey pushes its 2 cuts out to Q3/Q4 2026 and Q1 2027
  Jun-Sep -> 1-month bill flat at 3.65-3.85 (no near-term move priced),
          long end sells off 35-40bp
Expectations moved monotonically hawkish across 2026 without the Committee
moving the rate once. The dissent record moves the same way over the same
period (2 dovish dissents in January; 1 dovish + 3 hawkish in April) —
see ../03_minutes/2026/_2026_vote_record_VERBATIM.txt.

================================================================
IF YOU WANT ACTUAL FUTURES DATA
================================================================
Free-ish primary or near-primary options, none of which were used here:
  - NY Fed, Survey of Primary Dealers / Survey of Market Participants —
    published after each FOMC, contains the median modal path directly.
    https://www.newyorkfed.org/markets/primarydealer_survey_questions
  - NY Fed reference rates (EFFR, SOFR, OBFR), daily.
    https://www.newyorkfed.org/markets/reference-rates/effr
  - CME FedWatch (interactive; item 28 asks for a dated snapshot of this).
  - FRED series for market-implied paths (derived, not primary).
FLAGGED AS OUTSTANDING rather than filled with a guess.
