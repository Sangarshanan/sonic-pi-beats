# Something about us - Daft Punk

use_bpm 100

live_loop :initial_chords do
  ##| stop
  use_synth :bass_foundation
  use_octave 1
  use_synth_defaults amp: 2, release: 4, sustain: 4, cutoff: 70
  
  play [:f2, :a2, :d3]
  sleep 4
  play [:g2, :a2, :c3]
  sleep 4
  play [:a2, :c3, :e3]
  sleep 4
  play [:g2, :b2, :d3]
  sleep 4
  play [:f2, :a2, :d3]
  sleep 4
  play [:g2, :a2, :cs3]
  sleep 4
  play [:a2, :d3, :g3]
  sleep 4
  play [:a2, :d3, :f3]
  sleep 4
  
end


snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Snare04.wav"
clap = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Clap02.wav"
hat1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats05.wav"

grid1= [
  1,0,0,0,  2,0,0,0,
  0,0,1,0,  2,0,0,0,
]
live_loop :drum, sync: :initial_chords  do
  ##| stop
  16.times do |index|
    puts index, grid1[index]
    sample :bd_ada, amp: 5 if grid1[index] == 1
    sample hat1, amp: 0.2 if index % 2 == 0
    sample clap, amp: 0.8 if grid1[index] == 2
    sleep 0.25
  end
end

define :bass1 do |note|
  tick
  use_synth :saw
  use_synth_defaults release: 0.25
  with_fx :bitcrusher, amp: 0.5, mix: 0.8 do
    play note
    sleep 0.5
    play note + 12
    sleep 1
    play note, release: 0.5
    sleep 2.5
  end
end

live_loop :bass1, sync: :initial_chords do
  ##| stop
  bass1 46
  bass1 45
  bass1 38
  bass1 43
end

define :dow_first do
  play :d3
  sleep 0.75
  play :f3
  sleep 0.75
  play :d3
  sleep 1.5
end


live_loop :dowdow, sync: :initial_chords do
  stop
  with_fx :slicer, mix: 0.3, amp: 0.8 do
    use_synth :tb303
    use_synth_defaults release: 0.3
    
    dow_first
    
    play :c3
    sleep 0.25
    play :d3
    sleep 0.75
    
    dow_first
    
    sleep 1
    
  end
end

live_loop :tada, sync: :initial_chords do
  stop
  sleep 8
  use_synth :tb303
  sleep 1.5
  with_fx :reverb, mix: 0.5, amp: 0.4 do
    play [:d5, :a5], release: 0.3
    sleep 0.25
    play [:d5, :a5], release: 0.4
  end
  sleep 6.25
end

live_loop :synth1, sync: :bass1 do
  stop
  use_synth :tb303
  use_synth_defaults cutoff: 90
  with_fx :slicer, mix: 0.6 do
    
    play :d3, release: 1
    sleep 0.75
    play :e3, release: 1
    sleep 0.75
    play :f3, release: 1.125
    sleep 2.5
    play [:c3, :e3], release: 1
    sleep 0.75
    play [:d3, :f3], release: 1
    sleep 0.75
    play [:e3, :g3], release: 1.125
    sleep 2.5
    play [:d3, :f3], release: 1
    sleep 0.75
    play [:e3, :g3], release: 1.125
    sleep 0.75
    play [:f3, :a3], release: 1.125
    sleep 2.5
    play [:f3, :a3], release: 0.5
    sleep 0.25
    play [:e3, :g3], release: 0.5
    sleep 0.5
    play [:e3, :g3], release: 0.5
    sleep 0.5
    play [:d3, :f3], release: 0.5
    sleep 0.5
    play [:d3, :f3], release: 1.5
    sleep 2.25
  end
end


live_loop :mel1, sync: :bass1 do
  stop
  use_synth :bass_foundation
  use_synth_defaults cutoff: 80
  with_fx :ping_pong, mix: 0.6, amp: 1.5 do
    sleep 0.5
    play :g3
    sleep 0.5
    play :a3
    sleep 0.5
    2.times do
      play :c4
      sleep 0.5
    end
    sleep 1
    play :a3
    sleep 0.5
    play :d4
    sleep 1
    play :c4
    sleep 3.5
    
    ###
    
    play :g3
    sleep 0.5
    play :a3
    sleep 0.5
    2.times do
      play :c4
      sleep 0.5
    end
    sleep 1
    play :g3
    sleep 0.5
    play :a3
    sleep 1
    play :d3
    sleep 2
    
    ###
    
    play :d3
    sleep 0.5
    play :f3
    sleep 0.5
    play :a3
    sleep 0.5
    play :g3
    sleep 0.5
    play :f3
    sleep 0.5
    play :d3
    sleep 1
    play :d3
    sleep 1
    play :c3
    sleep 0.5
    play :d3
    sleep 0.5
    play :f3
    sleep 0.5
    play :g3
    sleep 2
    
    ###
    play :f3
    sleep 0.5
    play :g3
    sleep 0.5
    play :a3
    sleep 0.5
    play :g3
    sleep 0.5
    play :f3
    sleep 0.5
    play :e3
    sleep 1
    play :d3
    sleep 0.5
    play :d3, release: 0.25
    sleep 0.25
    play :c3, release: 0.25
    sleep 0.25
    play :d3
    sleep 4.5
  end
end

live_loop :mel2, sync: :bass1 do
  stop
  use_synth :prophet
  use_synth_defaults cutoff: 70
  with_fx :reverb, mix: 0.6, amp: 1.5 do
    
    play :c4
    sleep 0.5
    play :d4
    sleep 0.5
    play :f4
    sleep 0.25
    play :g4
    sleep 0.5
    play :a4, sustain: 2
    sleep 3.25
    
    play :d5
    sleep 0.5
    play :c5, sustain: 2
    sleep 2.5
    
    play :f4
    sleep 0.5
    play :g4
    sleep 0.5
    play :a4
    sleep 0.25
    play :f4
    sleep 0.5
    play :g4, sustain: 2
    sleep 3.25
    
    play :a4
    sleep 0.25
    play :g4
    sleep 0.5
    play :g4
    sleep 0.5
    play :f4
    sleep 0.5
    play :f4
    sleep 0.5
    play :d4
    sleep 0.5
    play :c4
    sleep 0.5
    play :d4
    sleep 0.25
    play :a4, sustain: 2
    sleep 2.75
    
    play :d5
    sleep 0.5
    play :e5, sustain: 2
    sleep 2.25
    
    play :e5
    sleep 0.25
    play :f5
    sleep 0.5
    play :e5
    sleep 0.5
    play :c5
    sleep 0.5
    play :a4, sustain: 2
    sleep 3.25
    
    
    play :d4
    sleep 0.25
    play :f4
    sleep 0.25
    play :g4
    sleep 0.25
    play :c5
    sleep 0.5
    play :a4
    sleep 0.25
    play :a4
    sleep 0.5
    play :f4
    sleep 0.5
    play :f4
    sleep 0.5
  end
end

