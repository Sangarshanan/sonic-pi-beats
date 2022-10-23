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
sleep 4

live_loop :foo do
  main_melody
end

sleep 8
live_loop :chord do
  use_synth :tb303
  play :f2, release: 1.5, cutoff: 70, res: 0.5, wave: 0, amp: 0.5
  sleep 4
end
