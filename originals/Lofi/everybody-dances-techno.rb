use_bpm 120

eddt1 = "/Volumes/Roguentropy/samples/songs/everybody_dances/1.wav"
eddt2 = "/Volumes/Roguentropy/samples/songs/everybody_dances/2.wav"
eddt3 = "/Volumes/Roguentropy/samples/songs/everybody_dances/3.wav"

dis = "/Volumes/Roguentropy/samples/drum_loops/misc/distorted1.wav"
chill_dub = "/Volumes/Roguentropy/Samples/drum_loops/dubstep/chill.wav"
chill_dub2 = "/Volumes/Roguentropy/Samples/drum_loops/dubstep/dnb.wav"


live_loop :edt1  do
  ##| stop
  with_fx :lpf, amp: 1.5 do
    sample eddt1, beat_stretch: 22
    sleep 22
  end
end

live_loop :edt2, sync: :edt1   do
  ##| stop
  with_fx :band_eq, amp: 2 do
    
    sample eddt3
    sleep 22
    
    ##| sample eddt2, start: 0.525, finish: 0.6
    ##| sleep 11
    ##| sample eddt2, start: 0.65, finish: 0.75
    ##| sleep 11
    
    ##| sample eddt2, start: 0.037, finish: 0.2
    ##| sleep 22
    
  end
end


live_loop :breaks do
  ##| stop
  
  with_fx :lpf do
    sample chill_dub , beat_stretch: 11, amp: 6
    sleep 11
  end
  
  ##| with_fx :lpf, mix: 0.5 do
  ##|   sample chill_dub2, beat_stretch: 22, amp: 3, finish: 0.5
  ##|   sleep 11
  ##| end
  
end


pm = "/Volumes/Roguentropy/samples/Melody/jazz/piano4.wav"
live_loop :piano1, sync: :edt1 do
  stop
  with_fx :reverb, mix: 0.5, amp: 1.5 do
    
    sample pm, beat_stretch: 70, start: 0.3, finish: 0.38
    sleep 22
    
  end
end

sx = "/Volumes/Roguentropy/samples/Melody/Lofi/loop12.wav"
live_loop :sax1, sync: :edt1 do
  stop
  with_fx :lpf do
    sleep 11
    sample sx, beat_stretch: 22, finish: 0.5
    sleep 11
  end
end


sax4 = "/Volumes/Roguentropy/samples/Melody/jazz/sax4.wav"
live_loop :sax4, sync: :edt1 do
  stop
  with_fx :compressor do
    sample sax4, beat_stretch: 22, amp: 4
    sleep 22
  end
end


