# Slim Shady

use_bpm 100

mel1 = ring(
  :C5, :Eb5, :G5, :Ab5, :C6, :Ab5, :G5,
  :Ab5, :G5, :Ab5, :G5, :F5, :G5, :B4,
)

t1 = ring(
  0.5, 0.5, 0.5, 0.5, 1.5, 0.5, 1.5,
  0.5, 0.1, 0.1, 0.3, 0.5, 0.5, 0.5
)

mel2 = ring(
  :D5, :C5, :G4, :F4, :Eb4, :D4, :C4,
)

t2 = ring(
  0.5, 0.5, 0.5, 1, 0.5, 0.5, 0.5,
)

live_loop :melody, sync: :drum do
  ##| stop
  tick(:i)
  use_synth :prophet
  with_fx :band_eq, distort: 0.6, room: 1 do
    play mel1.look(:i), amp: 0.8
    sleep t1.look(:i)
  end
end

live_loop :melody2, sync: :drum do
  tick(:i)
  ##| stop
  with_fx :flanger, phase: 0.8 do
    use_synth :dtri
    play mel2.look(:i), cutoff: 60, release: 2, amp: 0.8
    sleep t2.look(:i) * 2
  end
end


bass = ring(:C3, :F3, :Eb3, :D3)
live_loop :bass, sync: :drum do
  ##| stop
  tick(:i)
  use_synth :fm
  play bass.look(:i), release: 2.5
  sleep 2
end

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks05.wav"
snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Snare10.wav"
hat1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats09.wav"
hat2 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-OpenHiHats18.wav"

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
