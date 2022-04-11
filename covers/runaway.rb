# Runaway An Excerpt from Kanye West layered on Amen break

use_bpm 86

define :piano do
  use_synth :piano
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
  piano
end

live_loop :amen_break do
  sample :loop_amen, beat_stretch: 4, cutoff: 100
  sleep 4
end
