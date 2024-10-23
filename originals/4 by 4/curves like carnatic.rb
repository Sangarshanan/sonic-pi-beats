use_bpm 120

live_loop :vocal, sync: :techno_loop do
  stop
  
  with_fx :reverb, mix: 0.5 do
    
    ##| sample1 = "/Volumes/Roguentropy/Samples/Indian/guitar-1.wav"
    ##| sample sample1, beat_stretch: 5
    ##| sleep 5
    
    sample_end = "/Volumes/Roguentropy/Samples/Indian/guitar-end.wav"
    sample sample_end, beat_stretch: 5
    sleep 10
    
    ##| with_fx :bitcrusher, mix: 0.4 do
    
    ##|   sample2 = "/Volumes/Roguentropy/Samples/Indian/guitar-2.wav"
    ##|   sample sample2, finish: 0.98, amp: 0.5, beat_stretch: 10
    
    ##|   sleep 10
    
    ##|   sample3 = "/Volumes/Roguentropy/Samples/Indian/guitar-3.wav"
    ##|   sample sample3, start: 0.03, finish: 0.53, amp: 0.5, beat_stretch: 10
    ##|   sleep 5
    ##|   sample sample3, start: 0.53, amp: 0.5, beat_stretch: 10.5
    ##|   sleep 5
    
    ##| end
    
  end
end


trap_loop1 = "/Volumes/Roguentropy/Samples/drum_loops/techno/2.wav"
live_loop :techno_loop  do
  stop
  with_fx :lpf do
    sample trap_loop1, beat_stretch: 20, amp: 0.1
    sleep 20
  end
end


live_loop :initial_chords do
  ##| stop
  use_synth :hoover
  use_octave 1
  use_synth_defaults release: 3, sustain: 3, cutoff: 50
  
  with_fx :lpf do
    
    play [:f2, :a2, :d3]
    sleep 5
    play [:g2, :a2, :c3]
    sleep 5
    play [:a2, :c3, :e3]
    sleep 5
    play [:g2, :b2, :d3]
    sleep 5
  end
end
