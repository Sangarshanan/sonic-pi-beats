# Gangsta's Paradise

use_bpm 140

define :mel1 do
  4.times do
    play [:c7, :c6], sustain: 0.3
    sleep 2
  end
  2.times do
    play [:b6, :b5], sustain: 0.3
    sleep 2
  end
  play [:c7, :c6], sustain: 0.3
  sleep 2
  play [:g6, :g5], sustain: 0.3
  sleep 2
end

define :chords do
  with_fx :reverb do
    play :gs3, sustain: 4
    sleep 4
    play :f3, sustain: 4
    sleep 4
    play :g3, sustain: 4
    sleep 4
    play :c3, sustain: 4
    sleep 4
  end
end

live_loop :mel_saw, sync: :chords do
  stop
  use_synth :tech_saws
  with_fx :echo, mix: 0.8, amp: 0.5 do
    mel1
  end
end

live_loop :chords do
  ##| stop
  use_synth :organ_tonewheel
  chords
end

# Drums #

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks01.wav"
snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Snare04.wav"
clap = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Clap04.wav"
hat1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats05.wav"
tam = "/Users/sangarshanan/Downloads/samples/Lofi/Pack/Tambourine/Tambourine (4).wav"

grid1= [
  0,0,0,1,  2,0,0,0,
  0,0,0,1,  2,0,0,0,
  0,0,0,1,  2,0,0,0,
  0,0,0,1,  2,0,0,0,
]


live_loop :drum do
  ##| stop
  32.times do |index|
    puts index, grid1[index]
    sample kick, amp: 1.5 if [0,8,10,16,26].include? index
    sample hat1, amp: 0.8 if index % 2 == 0
    sample snare if grid1[index] == 1
    sample clap if grid1[index] == 2
    sleep 0.5
  end
end

live_loop :tam, sync: :drum do
  stop
  sample tam, amp: 0.3, sustain: 0.1
  sleep 0.5
end


## Sample ##

choir = "/Users/sangarshanan/Downloads/samples/Hiphop-Samples/GangstasParadiseChoir.wav"
live_loop :choir, sync: :drum do
  stop
  with_fx :reverb do
    sample choir, beat_stretch: 33, cutoff: 100
    sleep 32
  end
end


