#!/usr/bin/env bash
# Gjør en norsk tittel om til en URL-slug. Deterministisk: samme input → samme output, alltid.
# Bruk: ./lag-slug.sh "Ærlig talt: Blåbærsyltetøy & Co. (2026)"  →  aerlig-talt-blaabaersyltetoey-og-co-2026
printf '%s' "$*" \
  | tr '[:upper:]' '[:lower:]' \
  | sed -e 's/æ/ae/g' -e 's/ø/oe/g' -e 's/å/aa/g' \
        -e 's/&/ og /g' \
        -e 's/[^a-z0-9]\{1,\}/-/g' \
        -e 's/^-//' -e 's/-$//'
echo
