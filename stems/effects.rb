# Something you plug in the middle

# UUUWWWEEEEEEUUUUU
use_synth :tb303
with_fx :reverb, room: 1 do
  play :c1, cutoff: 100, release: 7, attack: 1, cutoff_attack: 4, cutoff_release: 4
  sleep 8
end

# Rewind
sample :ambi_lunar_land, beat_stretch: 8

# slicer 
bass_line = (knit :f1, 3, [:c1, :c2, :c3].choose, 1)
with_fx :slicer, phase: [0.25, 0.5].choose, invert_wave: 1, wave: 0 do
  s = synth :square, note: bass_line.tick, sustain: 4, cutoff: 60
  control s, cutoff_slide: 4, cutoff: 120
end

# reverse backspin
sample :vinyl_backspin, beat_stretch: 5, rate: -1

# plup
sample :elec_filt_snare, rate: -1

# random glitch bass
sample :glitch_bass_g, rate: [0.25, 0.5, -1].choose, amp: 2