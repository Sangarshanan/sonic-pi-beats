use_bpm 120

"""
live_loop :vocal do
  ##| stop
  with_fx [:slicer].choose, mix: 0.4 do
    
    sample "/Volumes/Roguentropy/Samples/memes/sapne.wav", amp: 0.8
    
    sleep 100
    
  end
end

"""

live_loop :met do
  sleep 0.5
end

live_loop :kick, sync: :met do
  ##| stop
  with_fx :band_eq do
    sample :bd_fat, amp: 1.5 #  :bd_fat :bd_tek
    sleep 1
  end
end

with_fx :distortion, amp: 1 do
  
  live_loop :clap, sync: :kick do
    ##| stop
    with_fx :reverb do
      sleep 0.5
      sample :sn_zome, cutoff: 50, rate: 2
      sleep 0.5
    end
  end
  
  
  live_loop :hat, sync: :kick do
    stop
    use_sample_defaults cutoff: 100, amp: 1.5
    
    3.times do
      sleep 0.5
      sample :hat_raw
      sleep 0.5
    end
    
    sleep 0.5
    sample :hat_raw
    sleep 0.25
    
    sample :hat_raw
    sleep 0.25
  end
  
  live_loop :hat2, sync: :met do
    stop
    sample :hat_hier, amp: 0.2
    sleep 0.25 # 0.25
  end
  
end

live_loop :bass1, sync: :met do
  ##| stop
  use_synth_defaults release: 0.15, amp: 2, cutoff: 80
  use_synth :bass_foundation # :bass_foundation :bass_highend
  
  keys = [
    :bb1,:c2, :f1, :f1
  ]
  
  4.times do
    key = keys.tick
    4.times do
      sleep 0.25
      play key
      sleep 0.5
      play key
      sleep 0.75
      play key
      sleep 0.5
    end
  end
end


live_loop :synth2, sync: :kick do
  stop
  use_synth_defaults release: 6, sustain: 0, attack: 2, release: 5,  amp: 0.5
  use_synth :gabberkick
  
  with_fx :slicer, phase: 0.5, invert_wave: 1, mix: 0.3 do
    with_fx :reverb, mix: 0.7, room: 0.8 do
      
      with_fx :ping_pong, cutoff: 100 do
        
        play chord(:D3, :minor7, invert: 0)
        sleep 8
        play chord(:G3, :major7, invert: 0)
        sleep 8
        play chord(:C3, :major7, invert: 0)
        sleep 8
      end
    end
  end
end

live_loop :vocal, sync: :kick do
  stop
  with_fx [:slicer, :reverb, :ixi_techno].choose, mix: 0.4 do
    
    sample "/Volumes/Roguentropy/Samples/jungle/throat_sing.wav", finish: 0.5, beat_stretch: 50
    
    sleep 25
    
  end
end


live_loop :breakbeat, sync: :kick do
  stop
  effect = [:slicer, :reverb, :ping_pong].choose
  p = [0.25, 0.5, 0.125].choose
  with_fx effect, phase: p, wave: 0, mix: rrand(0.4, 1) do
    r = [1, 0.5].choose
    sample [:loop_breakbeat].choose, beat_stretch: 2, rate: r , amp: 2
  end
  sleep 2
end
