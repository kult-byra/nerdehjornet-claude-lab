import { defineConfig } from 'unocss'

/**
 * Kult Byrå-tokens for Nerdehjørnet-dekket.
 *
 * Kildene er kult-presentations/design-system/tokens/{core,semantic}.json.
 * Klassenavnene er beholdt fra benchmark-dekket (ink/paper/sky/emerald/surface)
 * så slides.md slapp å skrives om — men verdiene er Kults.
 *
 *   ink      = midnight-blue   åpnings-/hovedflate
 *   paper    = sand            tekst på mørk flate
 *   sky      = baby-blue-light labels og rolige aksenter
 *   emerald  = contessa        fremheving, «test dette nå»
 *   petrol   = petroleum       seksjonsflate
 *
 * Avledede farger er alpha på `paper` — ingen hexer utenfor paletten.
 *
 * NB: `theme.fontFamily` settes bevisst IKKE. Slidev merger fontene fra
 * headmatteren med `||=`, så et felt her ville stille overstyre `fonts:`.
 */
export default defineConfig({
  theme: {
    colors: {
      ink: '#243346',
      paper: '#EFE4D6',
      sky: '#B9CFED',
      emerald: '#DC605C',
      petrol: '#305353',
      auburn: '#6E2727',
      surface: '#243346',
    },
  },
  shortcuts: {
    // Overstyrer Slidevs egne shortcuts med samme navn.
    'bg-main': 'bg-ink',
    'text-main': 'text-paper',
    'border-main': 'border-paper/12',

    // Kort er sand på lav alpha, ikke en egen flatefarge.
    'card': 'bg-paper/[0.06] rounded-lg p-6 border border-paper/12',

    // Kult-label: Circular Std Bold, versaler, 2px sperring.
    'kicker': 'font-label text-[13px] tracking-[2px] uppercase text-sky',
  },
})
