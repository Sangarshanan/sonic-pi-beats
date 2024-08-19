use_bpm 80

live_loop :synth1, sync: :bass do
  stop
  use_synth_defaults release: 2, amp: 0.8, attack: 0.05
  use_synth :tb303
  
  with_fx :lpf, cutoff: 85 do
    
    play chord(:f3, :M7), release: 8
    sleep 8
    
    play chord(:g3, :M7), release: 0.75
    sleep 1
    
    play chord(:a3, :M), release: 7
    sleep 7
  end
end

live_loop :synth3 do
  ##| stop
  use_synth_defaults release: 1, amp: 0.2
  use_synth :organ_tonewheel
  
  cd = chord(:a4, :M7, invert: -1)
  with_fx :echo, phase: 1, decay: 10 do
    cd.size.times do
      play cd.tick
      sleep 0.25
    end
  end
  sleep 7
end


live_loop :bass do
  ##| stop
  use_synth_defaults release: 1,attack_level: 2, amp: 2
  use_synth :beep
  keys = [:f1, :a1]
  2.times do
    key = keys.tick
    2.times do
      play key
      sleep 0.5
      sleep 0.25
      
      play key+7
      sleep 2-0.5-0.25
      
      play key
      sleep 0.5
      sleep 0.25
      play key+7
      sleep 0.25
      
      play key+7
      sleep 1
    end
  end
end


trap_loop1 = "/Volumes/Roguentropy/Samples/drum_loops/Trap/loop4.wav"
live_loop :trap_loop1, sync: :synth3  do
  stop
  with_fx :hpf do #  :bpf :hpf
    with_fx :lpf do
      sample trap_loop1, beat_stretch: 16, finish: 0.5, amp: 2
      sleep 8
    end
  end
end


sample_loop = "/Volumes/Roguentropy/Samples/lofi/voiceover/everybody wants to be an artist.wav"
live_loop :sample, sync: :bass do
  ##| stop
  with_fx :reverb do
    
    ##| 2.times do
    ##|   sample sample_loop, finish: 0.5, amp: 2
    ##|   sleep 4
    ##| end
    ##| 20.times do
    ##|   sample sample_loop, start: 0.5, finish: 0.6, amp: 2
    ##|   sleep [0.25, 0.5, 0.75, 1].choose
    ##| end
    ##| 3.times do
    ##|   sample sample_loop, start: 0.5, amp: 2
    ##|   sleep 4
    ##| end
    
    1.times do
      sample sample_loop
      sleep 4
    end
    
  end
  
  sleep 4
  
end


