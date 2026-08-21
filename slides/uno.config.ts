import { defineConfig } from 'unocss'

/**
 * Designtokens for Nordlys Kapital-dekket.
 *
 * Kun de fem hexene fra SHARED-SPEC finnes her. Alt avledet
 * (muted, hairline) er alpha på `paper` — aldri en ny hex.
 *
 * NB: `theme.fontFamily` settes bevisst IKKE. Slidev merger fontene fra
 * headmatteren med `||=`, så et hvilket som helst felt her ville stille
 * overstyre `fonts:`-blokka i slides.md.
 */
export default defineConfig({
  theme: {
    colors: {
      ink: '#0B0F17',
      paper: '#F8FAFC',
      sky: '#38BDF8',
      emerald: '#10B981',
      surface: '#1E293B',
    },
  },
  shortcuts: {
    // Overstyrer Slidevs egne shortcuts med samme navn.
    'bg-main': 'bg-ink',
    'text-main': 'text-paper',
    'border-main': 'border-paper/10',

    'card': 'bg-surface rounded-xl p-6 border border-paper/10',
    'kicker': 'font-mono text-xs tracking-[0.18em] uppercase text-paper/60',
  },
})
