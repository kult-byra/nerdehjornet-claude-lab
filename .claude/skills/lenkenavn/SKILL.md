---
name: lenkenavn
description: Bruk ALLTID denne når noen ber om en slug, slugs, URL-slug, lenkenavn, permalink, filnavn eller "hva skal denne siden hete i URL-en" av en tittel eller overskrift — også når de bare sier "lag slugs av disse". Aldri lag en slug for hånd.
---

# Lenkenavn (slug)

**Ikke gjett. Kjør scriptet.** Én gang per tittel:

```bash
.claude/skills/lenkenavn/lag-slug.sh "<tittelen>"
```

Scriptet håndterer æ/ø/å, `&` → `og`, tegnsetting og doble bindestreker likt hver gang.

Rapporter output ordrett. Ikke pynt på resultatet etterpå, og ikke tilby alternative varianter.
