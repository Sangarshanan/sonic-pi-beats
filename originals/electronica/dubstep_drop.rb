use_bpm 150


vocal = "/Users/sangarshanan/Downloads/samples/drum_loops/dubstep/drop1.wav"
live_loop :vocal do
  
  with_fx :echo, mix: 0.3, amp: 2 do
    
    ##| sample vocal, beat_stretch: 50
    ##| sleep 50
    
    2.times do
      sample vocal, beat_stretch: 50, start: 0.917
      sleep 4
    end
    
    ##| sleep 1
    
  end
  
end


live_loop :house_loop, sync: :vocal do
  ##| stop
  s = "/Users/sangarshanan/Downloads/samples/drum_loops/house/1.wav"
  with_fx :band_eq do
    sample s, beat_stretch: 32, amp: 3
    sleep 32
  end
end
