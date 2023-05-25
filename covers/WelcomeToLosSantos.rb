# Welcome to Los Santos

use_bpm 90

ohat= "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-OpenHiHats05.wav"

grid1= [
  1,0,0,0, 2,0,0,1,
  1,0,3,0, 2,0,0,0
]

live_loop :drum do
  ##| stop
  16.times do |index|
    puts index, grid1[index]
    sample :bd_haus if grid1[index] == 1
    sample :sn_dolf if grid1[index] == 2
    sample ohat if grid1[index] == 3
    sleep 0.25
  end
end

melb = ring(
  :A2, :B2, :C3, :B2, :A2, :G2, :A2, :G2
)

tb = ring(
  0.25, 0.5, 0.25, 0.25, 0.25, 0.5, 1.5, 0.5
)


live_loop :bassline, sync: :drum, delay: 2 do
  ##| stop
  tick(:i)
  with_synth :fm do
    play melb.look(:i)
    sleep tb.look(:i)
  end
end

live_loop :melody1, sync: :drum do
  stop
  use_synth :dsaw
  with_fx :distortion do
    play_pattern_timed [:B4,:A4,:G4,:F4,:E4,:D4,:C4,:B3], [0.25,0.5,0.25,0.5,0.5,0.25,0.5,0.25], amp: 0.2
    play :A3, amp: 0.2, sustain: 1.5
    sleep 1
  end
end

live_loop :melody2, sync: :drum do
  stop
  use_synth :prophet
  6.times do
    play [:C4, :E4, :A4]
    sleep 0.5
  end
  2.times do
    play [:B3, :D4, :G4]
    sleep 0.5
  end
end
