use_bpm 120

live_loop :break do
  ##| stop
  ##| sleep 28
  jungle =  "/Volumes/Roguentropy/samples/drum_loops/dnb/jungle.wav"
  with_fx :compressor do
    sample jungle, beat_stretch: 5.5
    sleep 5.5
  end
end


live_loop :erkyah do
  ##| stop
  ek = "/Volumes/Roguentropy/samples/songs/dck/dck1.wav"
  ek2 = "/Volumes/Roguentropy/samples/songs/dck/dck2.wav"
  
  ##| sample ek, beat_stretch: 28, amp: 2
  ##| sleep 28
  
  1.times do
    with_fx :reverb, amp: 2, mix: 0.5 do
      
      sample ek, beat_stretch: 28, finish: 0.23
      sleep 5.5
      
      sample ek, beat_stretch: 28, start: 0.21, finish: 0.42
      sleep 5.5
      
      sample ek, beat_stretch: 28, start: 0.5, finish: 0.7
      sleep 5.5
      
      sample ek, beat_stretch: 28, start: 0.71, finish: 0.9
      sleep 5.5
      
    end
  end
  
  1.times do
    with_fx :reverb, amp: 2, mix: 0.5 do
      
      ##| sample ek2, beat_stretch: 29, finish: 0.2
      ##| sleep 5.5
      
      ##| sample ek2, beat_stretch: 29, start: 0.26, finish: 0.46
      ##| sleep 5.5
      
      ##| sample ek2, beat_stretch: 29, start: 0.5, finish: 0.72
      ##| sleep 5.5
      
      ##| sample ek2, beat_stretch: 29, start: 0.75, finish: 0.95
      ##| sleep 5.5
      
    end
  end
  
end



