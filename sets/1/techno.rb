use_bpm 123

live_loop :flibble do
  use_random_seed 12
  
  with_fx :lpf do
    sample :bd_haus, rate: 1, amp: 1
    sample :bass_thick_c, amp: 0.5, rate: 0.5
    sleep 0.5
  end
  
  ##| with_fx :ping_pong do
  ##|   sample :loop_mehackit2, amp: 0.8, beat_stretch: 0.5
  ##| end
  
  ##| sample :loop_3d_printer, amp: 0.2
  
  with_fx :ping_pong do
    sample :hat_snap
  end
  
  sleep 0.5
  
end


live_loop :snare, sync: :flibble do
  stop
  sample :sn_dolf, rate: -1
  sleep 4
end

live_loop :hihat, sync: :snare do
  stop
  sample :hat_bdu
  sleep 0.25
end

live_loop :deep_bass, sync: :flibble do
  stop
  use_synth :bass_foundation
  with_fx :ixi_techno, lpf: 70, amp: 1, amp_slide: 6 do |fx|
    control fx, amp: 1
    176.times do
      amps = (ring 1, 0.5, 0.5, 0.5, 0.75, 0.5, 0.5, 0.5)
      play :C2, attack: 0.05, release: 0.4, amp: amps.tick
      sleep 0.25
    end
  end
end

live_loop :amen_break, sync: :flibble  do
  ##| stop
  with_fx :reverb do
    2.times do
      3.times do
        sample :loop_amen, beat_stretch: 2, amp: 2
        sleep 4
      end
      sample :loop_amen_full, beat_stretch: 16, start: 0.75, amp: 1
      sleep 8
    end
  end
end


beat = "/Users/sangarshanan/Downloads/samples/drum_loops/dnb/liquid-1.wav"
live_loop :liquid_amen, sync: :flibble do
  stop
  sample beat, beat_stretch: 16, finish: 0.5, amp: 3
  sleep 8
end


## Melodies

insur = "/Users/sangarshanan/Downloads/samples/vocal/noInsurance.wav"

live_loop :insur, sync: :flibble do
  stop
  
  2.times do
    4.times do
      sample insur, start: 0.009, finish: 0.01
      sleep 0.5
    end
    1.times do
      sample insur, start: 0.008, finish: 0.03
      sleep 2
    end
  end
  
  sample insur, start: 0.009, finish: 0.05
  sleep 4
  
  
  1.times do
    4.times do
      sample insur, start: 0.03, finish: 0.033
      sleep 0.5
    end
    1.times do
      sample insur, start: 0.03, finish: 0.05
      sleep 2
    end
    with_fx :ping_pong do
      1.times do
        sample insur, start: 0.03, finish: 0.05
        sleep 4
      end
    end
  end
  
end


vocal = "/Users/sangarshanan/Downloads/samples/Indian/Konnakkol1.wav"
live_loop :vocal, sync: :flibble do
  ##| stop
  
  # :hpf
  with_fx :hpf do
    sample vocal, beat_stretch: 90, start: 0.40, finish: 0.445
    sleep 1
  end
end


sample2 = "/Users/sangarshanan/Downloads/samples/Songs/pvm_flow.wav"
live_loop :sample2, sync: :flibble do
  stop
  
  # :reverb :slicer :wobble :ixi_techno
  with_fx :wobble do
    
    sample sample2, beat_stretch: 8, finish: 0.5
    sleep 4
    
    4.times do
      sample sample2, beat_stretch: 8, start: 0.5, finish: 0.55
      sleep 1
    end
    
    sample sample2, beat_stretch: 8, start: 0.5, finish: 0.74
    sleep 2
    
    4.times do
      sample sample2, beat_stretch: 8, start: 0.65, finish: 0.74, rate: 1
      sleep 1
    end
    
  end
end
