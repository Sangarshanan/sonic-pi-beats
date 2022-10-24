use_synth :tb303

define :main_melody do
  3.times do
    play_pattern_timed [:a4, :c4, :f4, :c4], 0.5, release: 1.5, cutoff: 80, res: 0.5, wave: 0, amp: 0.5
  end
  play_pattern_timed [:as3, :cs4, :f4, :g4], 0.5, release: 1.5, cutoff: 80, res: 0.5, wave: 0, amp: 0.5
end

live_loop :bar do
  use_synth :dark_ambience
  play_pattern_timed [:f2], 4, amp: 1
end

live_loop :drums do
  sample :drum_snare_soft, release: 2
  sleep 1
  sample :drum_bass_soft, release: 2
  sleep 1
end

sleep 8

live_loop :foo do
  main_melody
end

sleep 12

live_loop :bell do
  sample :perc_bell, release: 2, cutoff: 95, res: 1
  sleep 4
end

sleep 16

live_loop :chord do
  use_synth :tb303
  play :f2, release: 1, cutoff: 70, res: 0.5, wave: 0, amp: 1
  sleep 4
end
