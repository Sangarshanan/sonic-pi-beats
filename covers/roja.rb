use_bpm 80

mel0 =
  ring(:fs4, :a4, :b4, :ds5, :e5) +
  ring(:b4, :ds5, :e5, :fs5, :d5, :cs5, :b4) +
  ring(:fs4, :a4, :b4, :cs5, :a4, :gs4, :fs4,
       :gs4, :fs4, :e4, :ds4, :e4).repeat(2)

t0 =
  ring(0.25, 0.25, 0.25, 0.25, 3) +
  ring(0.25, 0.25, 0.25, 0.25, 2, 1, 3) +
  ring(0.25, 0.25, 0.25, 0.25, 1.5, 0.5, 0.5,
       0.25, 0.5, 0.25, 0.5, 3).repeat(2)

36.times do
  tick
  use_synth :organ_tonewheel
  with_fx :compressor do
    play mel0.look, sustain: t0.look
    sleep t0.look
  end
end


grid1 = [1,1,0,0,   2,0,1,0,   1,1,0,1,   2,0,0,0]

live_loop :drum, sync: :drum1 do
  ##| stop
  16.times do |index|
    puts index, grid1[index]
    sample :bd_tek if grid1[index] == 1
    sample :sn_generic, rate: 2 if grid1[index] == 2
    
    sleep 0.25
  end
end


grid2 = [1,1,1,1,   1,1,1,1,   1,1,1,1,   1,1,1,1]
mar = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Maracas1.wav"

live_loop :drum1, sync: :mel1 do
  ##| stop
  16.times do |index|
    puts index, grid2[index]
    sample :drum_cymbal_closed, amp: 0.5 if grid2[index] == 1
    sample mar
    sleep 0.25
  end
end


mel1 =
  ring(:e4, :g4, :fs4, :e4, :fs4, :eb4).repeat(2) +
  ring(:e4, :ab4, :e4, :ab4, :a4, :b4, :a4, :g4, :fs4) +
  ring(:gs4, :gs4, :a4, :g4, :fs4).repeat(3) +
  ring(:gs4, :gs4, :gs4, :a4, :g4, :fs4) +
  ring(:e4, :fs4, :g4, :fs4) +
  ring(:a4, :b4, :c5, :b4) +
  ring(:fs5, :e5, :fs5)

t1 =
  ring(1,1,0.5,0.25,0.25,1).repeat(2) +
  ring(1, 1, 0.25, 0.25,0.25,0.25,1,0.75,3.25) +
  ring(0.5,0.5,1,0.75,1.25).repeat(3) +
  ring(0.5,0.5,0.25,0.75,0.75,1.25) +
  ring(0.25, 0.5, 0.25, 1).repeat(2) +
  ring(1.5, 0.25, 3.25)

live_loop :mel1, delay: 27 do
  ##| stop
  tick
  use_synth :bass_foundation
  with_fx :flanger do
    play mel1.look, sustain: t1.look, amp: 0.5
  end
  sleep t1.look
end

live_loop :chord1 do
  ##| stop
  use_synth :fm
  with_fx :slicer do
    2.times do
      play [:e3, :g3, :b3], sustain: 4, amp: 0.5
      sleep 4
    end
    1.times do
      play [:e3, :ab3, :b3], sustain: 6, amp: 0.5
      sleep 6
    end
  end
end


## SCHEDULED ##

use_bpm 80

grid1 = [1,1,0,0,   2,0,1,0,   1,1,0,1,   2,0,0,0]

live_loop :drum, sync: :mel1 do
  ##| stop
  16.times do |index|
    puts index, grid1[index]
    sample :bd_tek if grid1[index] == 1
    sample :sn_generic, rate: 2 if grid1[index] == 2
    
    sleep 0.25
  end
end


grid2 = [1,1,1,1,   1,1,1,1,   1,1,1,1,   1,1,1,1]
mar = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Maracas1.wav"

live_loop :drum1, sync: :drum, delay: 44 do
  ##| stop
  16.times do |index|
    puts index, grid2[index]
    sample :drum_cymbal_closed, amp: 0.5 if grid2[index] == 1
    sample mar
    sleep 0.25
  end
end


mel1 =
  ring(:e4, :g4, :fs4, :e4, :fs4, :eb4).repeat(2) +
  ring(:e4, :ab4, :e4, :ab4, :a4, :b4, :a4, :g4, :fs4)


t1 =
  ring(1,1,0.5,0.25,0.25,1).repeat(2) +
  ring(1, 1, 0.25, 0.25,0.25,0.25,1,0.75,3.25)

mel2 =
  ##| ring(:gs4, :gs4, :a4, :g4, :fs4).repeat(3) +
  ring(:gs4, :gs4, :gs4, :a4, :g4, :fs4) +
  ring(:e4, :fs4, :g4, :fs4) +
  ring(:a4, :b4, :c5, :b4) +
  ring(:fs5, :e5, :fs5)

t2 =
  ##| ring(0.5,0.5,1,0.75,1.25).repeat(3) +
  ring(0.5,0.5,0.25,0.75,0.75,1.25) +
  ring(0.25, 0.5, 0.25, 1).repeat(2) +
  ring(1.5, 0.25, 3.25)

mel1_counter = 0

live_loop :mel1 do
  ##| stop
  use_synth :bass_foundation
  with_fx :flanger do
    mel1_counter +=1
    mel1.length.times do
      tick
      play mel1.look, sustain: t1.look, amp: 0.5 if mel1_counter < 3
      sleep t1.look
    end
    puts mel1_counter
  end
end

live_loop :chord1 do
  ##| stop
  use_synth :fm
  with_fx :slicer do
    2.times do
      play [:e3, :g3, :b3], sustain: 4, amp: 0.5
      sleep 4
    end
    1.times do
      play [:e3, :ab3, :b3], sustain: 6, amp: 0.5
      sleep 6
    end
  end
end

sleep 44
mel2.length.times do
  tick(:i)
  use_synth :bass_foundation
  with_fx :flanger do
    play mel2.look(:i), sustain: t2.look(:i), amp: 0.5
  end
  sleep t2.look(:i)
end

mel_whole = mel1 + ring(:gs4, :gs4, :a4, :g4, :fs4).repeat(3) + mel2
time_whole = t1 + ring(0.5,0.5,1,0.75,1.25).repeat(3) + t2

mel_whole.length.times do
  tick(:ii)
  use_synth :bass_foundation
  with_fx :flanger do
    play mel_whole.look(:ii), sustain: time_whole.look(:ii), amp: 0.5
  end
  sleep time_whole.look(:ii)
end

### SCHEDULE ####
