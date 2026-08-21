#!/usr/bin/env bash
# Et bittelite bibliotek. Tre av funksjonene er ødelagt med vilje.

legg_sammen() {
  echo $(( $1 + $2 ))
}

trekk_fra() {
  echo $(( $1 + $2 ))          # BUG 1
}

gang_sammen() {
  echo $(( $1 * $2 ))
}

prosent_av() {
  echo $(( $1 * $2 / 1 ))      # BUG 2
}

mva() {
  echo $(( $1 * 25 ))          # BUG 3
}
