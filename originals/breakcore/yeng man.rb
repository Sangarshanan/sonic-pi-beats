use_bpm 120

set_volume! 1.5

beat1 = "/Volumes/Roguentropy/samples/drum_loops/dnb/broken_amen.wav"

live_loop :synth do
  ##| stop
  use_synth_defaults release: 1, sustain: 5 ,sustain_level: 0.8, attack: 1, amp: 0.6, cutoff: 60
  use_synth :tech_saws
  
  with_fx :reverb do
    with_fx :distortion, amp: 1 do
      play chord(:bb3, :M7, invert: -2)
      sleep 5.5
      
      play chord(:bb3, :M7, invert: -1)
      sleep 5.5
      
      play chord(:f3, :M7, invert: -2)
      sleep 5.5
      
      play chord(:f3, :M7, invert: -1)
      sleep 5.5
    end
  end
end

live_loop :arp do
  use_synth :fm
  play (scale :g2, :major_pentatonic).tick(:foo), release: 0.1
  sleep (ring 0.125, 0.25, 0.4).tick(:bar)
end

sample_loop = "/Volumes/Roguentropy/Samples/lofi/voiceover/lets get one thing straight.wav"
live_loop :sample, sync: :arp do
  stop
  
  ##| sample sample_loop
  
  ##| sleep 5.5
  
  with_fx :flanger do
    
    use_random_seed 2122 # change to 0, 1002, 2002, 2122
    16.times do
      sample sample_loop, onset: rrand(5,100), amp: 0.5
      sleep 0.6875
    end
  end
  
end


live_loop :broken_beat, sync: :sample do
  ##| stop
  with_fx :reverb do
    
    use_random_seed 3 # change to 5 3 17
    
    sample beat1, onset: [0, 30].tick # 0 30
    sleep 0.5 # 0.5 1
    
    4.times do
      sample beat1, onset: rrand(2,30), amp: 0.7
      sleep 0.5
    end
    
    sample beat1, onset: [0, 0, 22].tick, rate: -1 # onset: 22 0
    sleep 0.25  # 0.25 1
    
  end
  
end


