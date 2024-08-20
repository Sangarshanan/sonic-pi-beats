use_bpm 150


live_loop :flibble do
  ##| stop
  with_fx :lpf do
    sample :bd_haus, rate: 1, amp: 1
    ##| sample :bass_thick_c, amp: 0.5, rate: 0.5
    sleep 0.5
  end
end

vocal = "/Volumes/Roguentropy/Samples/vocal/vine1.wav"

live_loop :vocal_dandb, sync: :flibble do
  ##| stop
  
  ##| 3.times do
  ##|   with_fx :ping_pong do
  
  ##|     sample vocal, beat_stretch: 14, amp: 2, finish: 0.25
  ##|     sleep 4
  
  ##|     sample vocal, beat_stretch: 15, amp: 2, start: 0.34, finish: 0.5
  ##|     sleep 4
  
  ##|   end
  ##| end
  
  
  2.times do
    sample vocal, beat_stretch: 15, amp: 3, start: 0.55, finish: 0.86
    sleep 4
    
    sample vocal, beat_stretch: 15, amp: 3, start: 0.86
    sleep 2
    
    with_fx :ixi_techno do
      sample vocal, beat_stretch: 15, amp: 3, start: 0.86
      sleep 2
    end
    
  end
  
end


live_loop :techno, sync: :vocal_dandb do
  ##| stop
  s = "/Volumes/Roguentropy/Samples/drum_loops/techno/2.wav"
  with_fx :band_eq do
    sample s, beat_stretch: 32, amp: 3
    sleep 32
  end
end
