---
name: lenkenavn
description: Bruk denne når noen skal lage en URL, en slug, et lenkenavn, et filnavn eller en permalink av en norsk tittel eller overskrift. Trigger på "slug", "lenkenavn", "url av denne tittelen", "hva skal denne siden hete i URL-en", "filnavn av".
---

# Lenkenavn (slug)

**Ikke gjett. Kjør scriptet.**

```bash
.claude/skills/lenkenavn/lag-slug.sh "<tittelen>"
```

Scriptet håndterer æ/ø/å, `&` → `og`, tegnsetting og doble bindestreker likt hver gang.
Skal du lage flere: kjør det én gang per tittel.

Rapporter output ordrett. Ikke pynt på resultatet etterpå.
