# Blocked, Paywalled, and Future Jobs

Everything in this file is something the corpus **does not contain** and the
reason why. Nothing here was silently substituted or approximated. Each entry
gives the exact source so it can be picked up later without re-doing the
search.

Compiled 2026-09-02.

---

## 1. Paywalled — cannot be retrieved without a subscription

### Kevin Warsh's Wall Street Journal op-eds (item 13)
**~35 pieces, 2010–2025.** Every one is flagged `[Subscription Required]` on
the Hoover index. Titles and dates are exact and complete in
`08_warsh/_warsh_pre_fed_writings_bibliography.txt`; the **text** is not
retrievable.

What you still get without the text:
- A dated series spanning fifteen years — usable as a salience/timing proxy.
- The titles alone track one consistent thesis: Fed mission creep, Fed
  overreach, inflation as a Fed choice, supply-side growth.
- A visible cadence shift: roughly quarterly 2010–2016, thinning 2017–2021,
  then re-accelerating sharply in 2024–2025 as the chairmanship came into
  view (Jul 2024, Jan 2025, Apr 2025, Nov 2025).

**To unblock:** a WSJ subscription, or pull them from a library database
(Factiva, ProQuest, Nexis) which most institutions have.

Nine of the ~35 carry `[date not captured]` — a page-boundary artifact in
Hoover's renderer, not a guess on my part. Titles are exact.

### Secondary-source-only fact: the Powell DOJ investigation (item 29)
The probe was dropped **Friday 24 April 2026**. My only source is Hoover's
abstract of a paywalled WSJ piece dated 26 April 2026. **No DOJ or Federal
Reserve primary document was found** — the Board's 2026 press-release index
says nothing about the investigation opening or closing.

Recorded as secondary in `10_structural/standing_situation_2026-09-02.txt`.
If this fact load-bears in the model, confirm it independently.

---

## 2. Structurally unpublished — not a retrieval failure

### Speech and hearing Q&A (item 19)
The Fed does not publish it. Three separate mechanisms:

- **Board "Discussion" events.** The Board publishes *Speech* events with
  prepared text and *Discussion* events with none at all. **Six of the
  nineteen in-window Board appearances are Discussions**, including
  **Warsh at the ECB Forum in Sintra, 1 July 2026** — a Chairman-level
  monetary policy appearance six weeks before Jackson Hole, with no text.
  Full list in `05_speeches/board/_DENOMINATOR_CORRECTION.txt`.
- **Jackson Hole "General Discussion" sessions.** Listed after every paper
  and panel on the 2026 agenda. Published only in the bound proceedings
  volume, typically months after the event. Not available as of capture.
- **Congressional Q&A.** Warsh's 21 April nomination hearing and the July
  semiannual testimony exist as archived webcast only. The printed record
  appears on govinfo.gov months later. Hearing video ID for the nomination
  hearing: `36101C1A-6501-430A-BD3F-25EDE991F1E1`.

This is the same gap in three costumes: **the most revealing exchanges are
the ones that go unpublished inside the scoring window.** It biases against
participants who favour conversational formats — documented for Goolsbee
(Chicago), Daly (San Francisco) and Warsh.

### District-level media appearances with no transcript
Captured as stubs with dates, marked `NO_TRANSCRIPT`:
- Goolsbee (Chicago) — two in-window fireside chats, video only
- Musalem (St. Louis) — CNBC interview, 20 Aug 2026
- Daly (San Francisco) — Bloomberg Surveillance, 20 Aug 2026

---

## 3. Licensed data — no public primary source

### Fed funds futures / OIS curve (item 27)
Fed funds futures settle on CME behind a licensed interface; OIS quotes are
broker-dealer data (Bloomberg / Tradeweb / ICAP). **There is no free primary
source for a futures strip or an OIS curve.**

Rather than scrape a secondary aggregator and present a possibly-stale curve
as data, the corpus substitutes two things that *are* primary, both in
`11_market_context/`:
- the complete daily Treasury par yield curve, 4 May – 1 Sep 2026;
- the Committee's own characterisations of what futures and the Desk survey
  were pricing, quoted verbatim from the 2026 minutes.

**To unblock:** a Bloomberg or Refinitiv terminal, or the NY Fed's Survey of
Primary Dealers (`newyorkfed.org/markets/primarydealer_survey_questions`),
which publishes the median modal fed funds path after each meeting and is
free.

---

## 4. Future-dated — the date had not arrived

### CME FedWatch snapshot dated 4 September 2026 (item 28)
Capture ran on 2 September 2026. This is a two-minute job on or after the 4th:
open the FedWatch tool, screenshot or export, save with the date in the
filename.

---

## 5. Deliberately skipped as low value

- **July 2026 MPR Part 1** (83k chars, "Recent Economic and Financial
  Developments"). The Summary and Part 2 (Monetary Policy) — the
  policy-relevant halves — are captured in `07_mpr_testimony/`. Part 1 is
  chart-driven background narrative.
- **Warsh, "Money Matters" (AEI, 2022).** Cited at footnote 13 of the
  Jackson Hole address. Not on the Hoover index because Hoover indexes
  Hoover-affiliated output only. Would need to be sourced from AEI directly.

---

## 6. Download-gated — CLEARED 2026-09-02

All three download-gated items are now in the corpus.

| Item | What | Result |
|---|---|---|
| 3 | Raw SEP projection PDFs, 2012–2020 | **35 downloaded**, all validated `%PDF`. `01_sep/archive/` now holds 53 PDFs covering 2012-01-25 → 2025-12-10, every vintage. |
| 13 | Bank of England Warsh transparency review, 2014 | **Downloaded**, 2,594,546 bytes, exact size match. PDF and full text both filed in `08_warsh/`. |
| 21 | Jackson Hole 2026 papers and handouts | **18 downloaded**, all validated. `13_jacksonhole/`. |

### Correction: the BoE review was never a scan

I previously recorded this PDF as a scanned image with no text layer, needing
OCR. **That was wrong and is retracted.** The file is *encrypted*, and the
encryption is what defeated in-browser extraction; I inferred "scan" from
seeing only `/Subtype/Image` objects in the cleartext portion, not realising
the font objects sat inside encrypted object streams. Decrypted with `qpdf`,
`pdftotext` returns all 64 pages and 174,008 characters cleanly. No OCR was
required.

The retraction is also recorded in the header of
`08_warsh/warsh_2014_boe_mpc_transparency_review.txt`.

### What the review actually contains, now that it is readable

Warsh's "Big 4" transparency objectives — sound policy decisions, effective
communication, accountability, history — and five recommendations, of which
two bear directly on this project:

- *"the votes of individual Committee members should be stated in the policy
  summary"*
- *"make Day 2 transcripts public with deferral period of five to eight
  years"*

He also states the limit: *"more transparency is not always and everywhere a
good thing."*

Applied to the FOMC those preferences pull in **opposite directions** for the
data: the vote line stays or strengthens, while the contemporaneous record of
*why* people dissented could thin. The April 2026 language dissents exist only
because the statement carries a bias sentence and the minutes carry
participant counts.
