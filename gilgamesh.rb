# Gilgamesh: A Synthy industrial grade generative beat

use_bpm 60

# Looped Beats on a Dice Roll
live_loop :probablistic_beat do
  sample :bd_haus if one_in(2)
  sample :elec_blip if one_in(4)
  sample :drum_heavy_kick if one_in(5)
  sample :drum_snare_hard if one_in(3)
  sleep 0.25
end

# Looped Generative Synth on E3minor scale
live_loop :random_synth do
  use_synth :tb303
  with_fx :slicer, amp_min: 0.20, amp_max: 0.40 do
    25.times do
      play choose(chord(:e3, :minor)), release: 0.4, cutoff: rrand_i(60, 130)
      sleep 0.25
    end
  end
end

# Two Samples for the Uhhhh factor
live_loop :gigamez do
  sample :loop_garzul, rate: 0.5, finish: 0.25
  sample :loop_industrial, beat_stretch: 4, amp: 1
  sleep 4
end
