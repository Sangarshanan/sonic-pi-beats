# succession theme on sonic pi

use_bpm 120

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks05.wav"
snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Snare10.wav"

mel1 = ring(
  :C4,
  :C4, :D4, :Eb4, :Eb4, :C4,
  :Eb4, :F4, :G4, :F4,
  :Ab3, :F4, :G4, :Ab4, :G4,
  :G4, :C5, :Bb4, :Ab4,:G4,
  :G4, :C5, :Bb4, :D5, :C5,
  :F4, :Eb4, :G4, :F4, :Eb4, :Eb4,
  :C5, :D5, :Eb5, :Ab5, :G5, :G5, :G5
)

t1 = ring(
  
  2,
  0.5,0.5,1,1,1,
  0.5,0.5,1,1,
  1,0.5,0.5,1,2.5,
  0.5,1,3,1,2.5,
  0.5,1,3,1,2.5,
  0.5,0.5,1,1,1,1,
  2,2,2,2,2,1,0.5
  
)


define :bridge do
  mel1.length.times do
    tick(:i)
    use_synth :tech_saws
    play mel1.look(:i), amp: 0.8, cutoff: 90 , sustain: t1.look(:i) - 0.2
    sleep t1.look(:i)
  end
end

1.times do
  bridge
end

mel1 = ring(
  :C6,
  :B4, :C5, :D5, :C5, :Bb4, :Ab4, :Fs4, :G4, :Ab4, :G4,
  :G5, :F5, :Eb5, :Cs5, :D5, :Eb5, :D5,
  :D6, :C6, :B5, :Ab5, :G5, :F5, :Eb5, :D5, 9000,
)

t1 = ring(
  3,
  0.25,0.25,0.5,0.5,0.5,0.5,0.5,0.5,0.5,1,
  0.5,0.5,0.5,0.5,0.5,0.5,0.5,
  0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,1,
)

live_loop :melody do
  tick(:i)
  use_synth :bass_foundation
  play mel1.look(:i), amp: 0.8, cutoff: 90 , sustain: t1.look(:i) - 0.2
  sleep t1.look(:i)
end

# drums

grid1 = [1,1,0,0,   2,0,1,0,   1,1,0,1,   2,0,0,0]

live_loop :drum1, sync: :melody do
  16.times do |index|
    puts index, grid1[index]
    sample kick, amp: 2 if grid1[index] == 1
    sample snare, amp: 2 if grid1[index] == 2
    sleep 0.5
  end
end


grid2 = [1,1,1,1,   1,1,1,1,   1,1,1,1,   1,1,2,0]

live_loop :drum2, sync: :melody do
  16.times do |index|
    puts index, grid2[index]
    sample :drum_cymbal_closed if grid2[index] == 1
    sample :drum_cymbal_open, sustain: 0.3 if grid2[index] == 2
    
    sleep 0.5
  end
end
