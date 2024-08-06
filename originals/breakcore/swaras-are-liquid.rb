use_bpm 120

raag = "/Users/sangarshanan/Downloads/samples/Indian/raag_vocal.wav"
live_loop :raag_drone, sync: :pm_loop  do
  ##| stop
  with_fx :reverb, mix: 0.6 do
    
    sample raag, beat_stretch: 40, start: 0.55, finish: 0.675
    sleep 10
    
    
    ##| sample raag, beat_stretch: 42, start: 0.675, finish: 0.8
    ##| sleep 5
    ##| 2.times do
    ##|   sample raag, beat_stretch: 42, start: 0.78, finish: 0.8
    ##|   sleep 5
    ##| end
    
    ##| sample raag, beat_stretch: 42, start: 0.8
    ##| sleep 8
    ##| sample raag, beat_stretch: 42, start: 0.958, finish: 0.99, rate: -1
    ##| sleep 2
    
    
  end
end


pm = "/Users/sangarshanan/Downloads/samples/songs/pm1.wav"
live_loop :pm_loop do
  ##| stop
  effect = [:ping_pong, :octaver, :ixi_techno].choose
  with_fx effect, mix: 0.4 do
    
    sample pm, beat_stretch: 54, finish: 0.045
    sleep 2.5
    
    sample pm, beat_stretch: 54, start: 0.052, finish: 0.09
    sleep 2.5
    
    sample pm, beat_stretch: 60, start: 0.115, finish: 0.173
    sleep 3.5
    
    sample pm, beat_stretch: 60, start: 0.18, finish: 0.204
    sleep 1.5
    
  end
end


bass1 = "/Users/sangarshanan/Downloads/samples/bass/dnb-modex.wav"
live_loop :bss_loop, sync: :raag_drone do
  stop
  effect = [:ixi_techno, :reverb, :octaver].choose
  1.times do
    with_fx effect do
      sample bass1, beat_stretch: 20, amp: 1
      sleep 20
    end
  end
end

live_loop :dandb do
  ##| stop
  s = "/Users/sangarshanan/Downloads/samples/drum_loops/dnb/liquid-2.wav"
  with_fx :bpf do
    sample s, beat_stretch: 20, finish: 0.5, amp: 0.7
    sleep 10
  end
end
