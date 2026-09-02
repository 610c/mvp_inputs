#!/usr/bin/env bash
# data_mvp corpus fetcher. Run after federalreserve.gov et al. are allowlisted.
# Idempotent: -N timestamps, safe to re-run. Logs to _manifest/fetch.log
set -uo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
LOG="$ROOT/_manifest/fetch.log"
mkdir -p "$ROOT/_manifest"
: > "$LOG"
FRB="https://www.federalreserve.gov"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 Chrome/126 Safari/537.36"
W=(wget -N --no-verbose --tries=3 --timeout=30 --waitretry=2 --wait=0.4 --random-wait -U "$UA")

get() { # get <outdir> <url...>
  local d="$1"; shift; mkdir -p "$d"
  for u in "$@"; do
    if "${W[@]}" -P "$d" "$u" 2>>"$LOG"; then echo "OK   $u" >>"$LOG"
    else echo "FAIL $u" >>"$LOG"; fi
  done
}
crawl() { # crawl <outdir> <accept-regex> <depth> <start-url...>
  local d="$1" acc="$2" dep="$3"; shift 3; mkdir -p "$d"
  "${W[@]}" -r -l "$dep" -np -nd -H -D www.federalreserve.gov,federalreserve.gov \
     --accept-regex "$acc" -P "$d" "$@" 2>>"$LOG"
}

echo "=== 1-2. June + March 2026 SEP ===" | tee -a "$LOG"
get "$ROOT/01_sep/2026-06" "$FRB/monetarypolicy/files/fomcprojtabl20260617.pdf" \
    "$FRB/monetarypolicy/fomcprojtabl20260617.htm"
get "$ROOT/01_sep/2026-03" "$FRB/monetarypolicy/files/fomcprojtabl20260318.pdf" \
    "$FRB/monetarypolicy/fomcprojtabl20260318.htm"

echo "=== 3. Full SEP archive 2012-present ===" | tee -a "$LOG"
crawl "$ROOT/01_sep/archive" '(fomcprojtabl|fomcprojtabl.*\.pdf)' 2 \
  "$FRB/monetarypolicy/fomccalendars.htm" "$FRB/monetarypolicy/fomc_historical_year.htm"
for y in $(seq 2012 2021); do
  crawl "$ROOT/01_sep/archive" 'fomcprojtabl' 2 "$FRB/monetarypolicy/fomchistorical$y.htm"
done

echo "=== 4-5. 2026 statements + minutes ===" | tee -a "$LOG"
for d in 20260128 20260318 20260429 20260617 20260729; do
  get "$ROOT/02_statements/2026" "$FRB/newsevents/pressreleases/monetary${d}a.htm" \
      "$FRB/monetarypolicy/files/monetary${d}a1.pdf"
  get "$ROOT/03_minutes/2026" "$FRB/monetarypolicy/fomcminutes${d}.htm" \
      "$FRB/monetarypolicy/files/fomcminutes${d}.pdf"
done

echo "=== 6. Statement archive back to 2000 ===" | tee -a "$LOG"
crawl "$ROOT/04_statements_archive" '(monetary[0-9]{8}a\.htm|boarddocs/press/monetary)' 2 \
  "$FRB/monetarypolicy/fomccalendars.htm" "$FRB/monetarypolicy/fomc_historical_year.htm"
for y in $(seq 2000 2021); do
  crawl "$ROOT/04_statements_archive" '(monetary[0-9]{8}a\.htm|/monetary/[0-9]{8})' 2 \
    "$FRB/monetarypolicy/fomchistorical$y.htm"
done

echo "=== 8-9. Warsh speech + press conferences ===" | tee -a "$LOG"
get "$ROOT/08_warsh" "$FRB/newsevents/speech/warsh20260828a.htm"
for d in 20260617 20260729; do
  get "$ROOT/06_press_conf" "$FRB/monetarypolicy/fomcpresconf${d}.htm" \
      "$FRB/mediacenter/files/FOMCpresconf${d}.pdf"
done

echo "=== 10-11. MPR + testimony ===" | tee -a "$LOG"
crawl "$ROOT/07_mpr_testimony" '(mpr_|monetarypolicy/[0-9]{4}-[0-9]{2}-mpr|files/.*mpr.*\.pdf|testimony)' 2 \
  "$FRB/monetarypolicy/mpr_default.htm" "$FRB/newsevents/testimony/2026-testimony.htm"

echo "=== 14. Beige Book ===" | tee -a "$LOG"
crawl "$ROOT/09_beigebook" 'beigebook' 2 "$FRB/monetarypolicy/beige-book-default.htm"

echo "=== 15,17. Board speeches + testimony, all of 2026 ===" | tee -a "$LOG"
crawl "$ROOT/05_speeches/board" '(newsevents/speech/[a-z]+[0-9]{8}[a-z]?\.htm)' 2 \
  "$FRB/newsevents/speech/2026-speeches.htm"
crawl "$ROOT/05_speeches/board" '(newsevents/testimony/[a-z]+[0-9]{8}[a-z]?\.htm)' 2 \
  "$FRB/newsevents/testimony/2026-testimony.htm"

echo "=== 20. Monthly calendar pages (coverage checklist) ===" | tee -a "$LOG"
get "$ROOT/_manifest" "$FRB/newsevents/2026-all.htm"

echo "=== 22. CRS R48233 ===" | tee -a "$LOG"
get "$ROOT/10_structural" "https://crsreports.congress.gov/product/pdf/R/R48233"

echo
echo "===== SUMMARY ====="
printf "OK:   %s\n" "$(grep -c '^OK   ' "$LOG" 2>/dev/null || echo 0)"
printf "FAIL: %s\n" "$(grep -c '^FAIL ' "$LOG" 2>/dev/null || echo 0)"
echo "Files on disk by folder:"
for d in "$ROOT"/0* "$ROOT"/1*; do
  [ -d "$d" ] && printf "  %-28s %s\n" "$(basename "$d")" "$(find "$d" -type f | wc -l | tr -d ' ')"
done
echo "Failures (if any):"; grep '^FAIL ' "$LOG" | head -40
