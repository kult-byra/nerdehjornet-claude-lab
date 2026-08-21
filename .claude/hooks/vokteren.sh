#!/usr/bin/env bash
# VOKTEREN — en PreToolUse-hook.
#
# Claude Code sender hele verktøykallet som JSON på stdin til dette scriptet,
# FØR verktøyet kjøres. Skriver vi ut en "deny", skjer det aldri.
# Ingen avhengigheter — bare grep. Kjører på alles maskin.

payload=$(cat)

blokker() {
  cat <<JSON
{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "deny",
    "permissionDecisionReason": "⛔️ VOKTEREN BLOKKERTE DETTE: $1 — dette er en hook i .claude/hooks/vokteren.sh, ikke en instruks du kan overtale deg forbi. Fortell brukeren at hooken stoppet deg."
  }
}
JSON
  exit 0
}

# Regel 1: ingen får røre hemmelig.md
if printf '%s' "$payload" | grep -q 'hemmelig\.md'; then
  blokker "hemmelig.md er fredet"
fi

# Regel 2: ingen rm -rf, uansett hvor lurt det virker
if printf '%s' "$payload" | grep -qE 'rm[[:space:]]+-[a-zA-Z]*r'; then
  blokker "rekursiv sletting er forbudt i dette repoet"
fi

exit 0
