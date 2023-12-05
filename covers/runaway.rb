# Runaway An Excerpt from Kanye West layered on Amen break

use_bpm 100

define :piano do
  use_synth :piano
  use_synth_defaults release: 1, sustain: 1.5
  5.times do
    play :E6
    sleep 2
  end
  play :E5
  sleep 2
  3.times do
    play :Eb6
    sleep 2
  end
  play :Eb5
  sleep 2
  3.times do
    play :Db6
    sleep 2
  end
  play :Db5
  sleep 2
  2.times do
    play :A5
    sleep 2
  end
  play :Ab5
  sleep 2
  play :E6
end

piano

live_loop :piano_loop do
  ##| stop
  piano
end

live_loop :amen_break do
  sample :loop_amen, beat_stretch: 4, cutoff: 100
  sleep 4
end

live_loop :bass do
  use_synth :saw
  n = :b1
  use_synth_defaults cutoff: 60, amp: 0.5
  play n, sustain: 4
  sleep 4
  play n+0.5, sustain: 1
  sleep 1
  play n+1, sustain: 1
  sleep 1
  play n, sustain: 4
  sleep 2
end
