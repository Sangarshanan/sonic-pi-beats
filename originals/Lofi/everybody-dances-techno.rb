use_bpm 120

eddt1 = "/Volumes/Roguentropy/samples/songs/everybody_dances/1.wav"
eddt2 = "/Volumes/Roguentropy/samples/songs/everybody_dances/2.wav"
eddt3 = "/Volumes/Roguentropy/samples/songs/everybody_dances/3.wav"

dis = "/Volumes/Roguentropy/samples/drum_loops/misc/distorted1.wav"
chill_dub = "/Volumes/Roguentropy/Samples/drum_loops/dubstep/chill.wav"

live_loop :edt1  do
  ##| stop
  with_fx :lpf, amp: 1.5 do
    sample eddt1, beat_stretch: 22
    sleep 22
  end
end

live_loop :edt2, sync: :edt1   do
  ##| stop
  with_fx :band_eq, amp: 3 do
    
    ##| sample eddt3
    ##| sleep 22
    
    ##| sample eddt2, start: 0.525, finish: 0.6
    ##| sleep 11
    ##| sample eddt2, start: 0.65, finish: 0.75
    ##| sleep 11
    
    sample eddt2, start: 0.037, finish: 0.2
    sleep 22
    
    
  end
end


live_loop :breaks do
  ##| stop
  
  1.times do
    with_fx :lpf do
      sample chill_dub , beat_stretch: 11, amp: 6
      sleep 11
    end
  end
  
end
