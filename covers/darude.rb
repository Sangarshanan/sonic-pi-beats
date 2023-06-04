# Sandstorm by Darude

use_bpm 130

use_synth :tech_saws

define :mel1 do
  4.times do
    play :b3
    sleep 0.25
  end
  1.times do
    play :b3
    sleep 0.5
  end
  6.times do
    play :b3
    sleep 0.25
  end
  1.times do
    play :b3
    sleep 0.5
  end
end

define :mel2 do |note|
  6.times do
    play note
    sleep 0.25
  end
  1.times do
    play note
    sleep 0.5
  end
end

define :mel3 do |note|
  2.times do
    play note
    sleep 0.25
  end
end

mel = ring(
[:e4, :g4, :b4]).repeat(5) + ring(
[:g4, :c5, :e5]).repeat(3) + ring(
[:g4, :b4, :d5]).repeat(3) + ring(
[:d4, :a4]).repeat(1) +  ring(
[:e4, :g4, :b4]).repeat(5) + ring(
[:a4,:c5, :e5]).repeat(1) + ring(
[:e4, :g4, :b4]).repeat(5) + ring(
[:a4,:c5, :e5]).repeat(1)

tt = ring(0.75,0.75,0.5)

live_loop :chords, sync: :drum do
  stop
  tick
  use_synth :tech_saws
  play mel.look
  sleep tt.look
end


live_loop :drop, sync: :drum do
  stop
  4.times do
    4.times do
      play :b3
      sleep 0.25
    end
    1.times do
      play :b3
      sleep 0.5
    end
    sleep 0.5
  end
  100.times do
    play :b3
    sleep 0.25
  end
end

live_loop :melody, sync: :drum do
  ##| stop
  use_synth :prophet
  mel1
  mel2 :e4
  mel2 :d4
  mel3 :a3
  mel1
  mel3 :e4
  mel1
  mel3 :e4
end

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks02.wav"
snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Snare05.wav"
hat1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats09.wav"
hat2 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-OpenHiHats02.wav"

grid1= [
  1,0,3,0, 2,0,3,0,
  1,0,3,0, 2,0,3,0,
  1,0,3,0, 2,0,3,0,
  1,0,3,0, 2,0,4,0,
]


live_loop :drum do
  32.times do |index|
    puts index, grid1[index]
    sample kick, amp: 1.5 if grid1[index] == 1
    sample snare if grid1[index] == 2
    sample hat1 if grid1[index] == 3
    sample hat2 if grid1[index] == 4
    sleep 0.25
  end
end
