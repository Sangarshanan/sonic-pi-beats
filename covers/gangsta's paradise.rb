# gangsta paradise
use_bpm 140

define :mel1 do
  4.times do
    play [:c7, :c6], sustain: 0.3, attack: 0.1
    sleep 2
  end
  2.times do
    play [:b6, :b5], sustain: 0.3, attack: 0.1
    sleep 2
  end
  play [:c7, :c6], sustain: 0.3, attack: 0.1
  sleep 2
  play [:g6, :g5], sustain: 0.3, attack: 0.1
  sleep 2
end

define :chords do
  with_fx :reverb, amp: 0.5 do
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
  with_fx :reverb, mix: 0.5 do
    mel1
  end
end

live_loop :chords do
  ##| stop
  use_synth :organ_tonewheel
  chords
end

# Drums #

kick = "/Volumes/Roguentropy/Samples/808_drum_kit/kicks/808-Kicks01.wav"
snare = "/Volumes/Roguentropy/Samples/808_drum_kit/snares/808-Snare04.wav"
clap = "/Volumes/Roguentropy/Samples/808_drum_kit/snares/808-Clap04.wav"
hat1 = "/Volumes/Roguentropy/Samples/808_drum_kit/hihats/808-HiHats05.wav"
tam = "/Volumes/Roguentropy/Samples/Lofi/Pack/Tambourine/Tambourine (4).wav"

grid1= [
  0,0,0,1,  2,0,0,0,
  0,0,0,1,  2,0,0,0,
  0,0,0,1,  2,0,0,0,
  0,0,0,1,  2,0,0,0,
]


live_loop :drum, sync: :chords do
  stop
  32.times do |index|
    puts index, grid1[index]
    sample kick, amp: 3 if [0,8,10,16,26].include? index
    sample hat1, amp: 0.8 if index % 2 == 0
    ##| sample snare if grid1[index] == 1
    ##| sample clap if grid1[index] == 2
    sleep 0.5
  end
end

live_loop :tam, sync: :drum do
  stop
  sample tam, amp: 0.5, sustain: 0.1
  sleep 0.5
end

## Sample ##

choir = "/Volumes/Roguentropy/Samples/Hiphop-Samples/GangstasParadiseChoir.wav"
live_loop :choir1, sync: :chords do
  stop
  with_fx :reverb do
    sample choir, beat_stretch: 33, amp: 1
    sleep 32
  end
end

beats = "/Volumes/Roguentropy/Samples/drum_loops/lofi/cymatics/Full Drum Loops/1_95.wav"
live_loop :trap_loop1, sync: :drum  do
  stop
  with_fx :band_eq, mix: 0.4 do #  :bpf :hpf :echo
    with_fx :bitcrusher do
      sample beats, beat_stretch: 16, amp: 3
      sleep 16
    end
  end
end

jazz = "/Volumes/Roguentropy/Samples/melody/jazz/lofi-p1.wav"
live_loop :jazz_tune, sync: :trap_loop1 do
  stop
  with_fx :ixi_techno, mix: 0.8 do # :slicer :tremolo :reverb
    sample jazz, beat_stretch: 32, amp: 5 # 16
    sleep 32
  end
end

