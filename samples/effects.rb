# Something you plug in the middle

# UUUWWWEEEEEEUUUUU
use_synth :tb303
with_fx :reverb, room: 1 do
  play :c1, cutoff: 100, release: 7, attack: 1, cutoff_attack: 4, cutoff_release: 4
  sleep 8
end

# Porcupine Tree vibes
live_loop :beats do
  sample :guit_em9, rate: [0.25, 0.5, -1].choose, amp: 2
  sleep 8
end

# Rewind
sample :ambi_lunar_land, beat_stretch: 8
