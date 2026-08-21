#!/usr/bin/env bash
# Kjør: ./oppgaver/06-loops/tester.sh
# Avslutter med 0 når alt er grønt, 1 når noe feiler.
source "$(dirname "$0")/kalkulator.sh"

feil=0
sjekk() {
  local navn="$1" faktisk="$2" forventet="$3"
  if [ "$faktisk" = "$forventet" ]; then
    echo "  ✅ $navn"
  else
    echo "  ❌ $navn — fikk '$faktisk', forventet '$forventet'"
    feil=$((feil + 1))
  fi
}

echo "Kjører tester…"
sjekk "legg_sammen 2 3"   "$(legg_sammen 2 3)"   "5"
sjekk "trekk_fra 10 4"    "$(trekk_fra 10 4)"    "6"
sjekk "gang_sammen 6 7"   "$(gang_sammen 6 7)"   "42"
sjekk "prosent_av 200 10" "$(prosent_av 200 10)" "20"
sjekk "mva 1000"          "$(mva 1000)"          "250"

echo
if [ "$feil" -eq 0 ]; then
  echo "🎉 ALLE TESTER PASSERTE"
  exit 0
else
  echo "💥 $feil test(er) feilet"
  exit 1
fi
