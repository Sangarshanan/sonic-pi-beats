use_bpm 120

live_loop :vocal do
  stop
  
  with_fx :reverb do
    with_fx :bitcrusher, mix: 0.4, amp: 1.5 do
      
      
      ##| sample1 = "/Volumes/Roguentropy/Samples/Indian/guitar-1.wav"
      ##| sample sample1, beat_stretch: 5
      ##| sleep 5
      
      ##| sample_end = "/Volumes/Roguentropy/Samples/Indian/guitar-end.wav"
      ##| sample sample_end, beat_stretch: 5
      ##| sleep 5
      
      
      
      sample2 = "/Volumes/Roguentropy/Samples/Indian/guitar-2.wav"
      sample sample2, finish: 0.98, amp: 0.5, beat_stretch: 10
      
      sleep 10
      
      sample3 = "/Volumes/Roguentropy/Samples/Indian/guitar-3.wav"
      sample sample3, start: 0.03, finish: 0.53, amp: 0.5, beat_stretch: 10
      sleep 5
      sample sample3, start: 0.53, amp: 0.5, beat_stretch: 10.5
      sleep 5
      
    end
  end
end

live_loop :landing, sync: :bass_drum do
  stop
  bass_line = (knit :d1, 5, [:c1, :c2, :c3, :c4, :c5].choose, 1)
  with_fx :slicer, phase: [0.25, 0.5].choose, amp: 0.5 do
    s = synth :square, note: bass_line.tick, sustain: 4, cutoff: 60
    control s, cutoff_slide: 4, cutoff: 120
  end
  sleep 4
end

bass1 = "/Volumes/Roguentropy/Samples/bass/atonal.wav"
live_loop :bss_loop, sync: :bass_drum do
  ##| stop
  effect = [:ixi_techno, :reverb, :wobble].choose
  1.times do
    with_fx effect do
      sample bass1, beat_stretch: 10, finish: 0.5, amp: 0.2
      sleep 5
    end
  end
end

live_loop :dandb, sync: :vocal1 do
  stop
  s = "/Volumes/Roguentropy/Samples/drum_loops/dnb/liquid-2.wav"
  with_fx :reverb do
    sample s, beat_stretch: 20, finish: 0.5 # beat 10, sleep 5
    sleep 10
  end
end

vocal_loop1 = "/Volumes/Roguentropy/Samples/acapella/charukesi.mp3"
live_loop :vocal1, sync: :bss_loop  do
  stop
  
  with_fx :reverb do
    
    
    sample vocal_loop1, beat_stretch: 90, start: 0.33, finish: 0.48
    sleep 10
    
    ##| sample vocal_loop1, beat_stretch: 90, start: 0.33, finish: 0.39
    ##| sleep 5
    ##| sample vocal_loop1, beat_stretch: 90, start: 0.65, finish: 0.7, amp: 2
    ##| sleep 5
    
    ##| sample vocal_loop1, beat_stretch: 95, start: 0.79, finish: 0.842
    ##| sleep 5
    ##| sample vocal_loop1, beat_stretch: 95, start: 0.85, finish: 0.91
    ##| sleep 5
    
  end
  
end


live_loop :slow_break, sync: :vocal1 do
  stop
  use_random_seed 1
  jungle =  "/Volumes/Roguentropy/samples/drum_loops/dnb/jungle.wav"
  effect = [:slicer, :reverb, :tremolo, :distortion].choose
  p = [0.25, 0.5, 0.125].choose
  with_fx effect, phase: p, wave: 0, mix: rrand(0.4, 1) do
    r = [1, 1, -1].choose
    sample jungle, beat_stretch: 5, rate: r
    sleep 5
  end
end


live_loop :bass_drum do
  ##| stop
  sample :bd_haus, cutoff: 70, amp: 2
  sleep 1.25
end

