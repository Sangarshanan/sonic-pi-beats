use_bpm 120


full = "/Users/sangarshanan/Downloads/samples/shaktimaan/shaktimaan_vocal.wav"
voc = "/Users/sangarshanan/Downloads/samples/shaktimaan/vloop0.wav"
bass = "/Users/sangarshanan/Downloads/samples/shaktimaan/vbass0.wav"

in_thread do
  1.times do
    
    with_fx :ixi_techno , mix: 0.5 do
      sample full, start: 0.103, finish: 0.13
      sleep 9
    end
    
    with_fx :slicer , mix: 0.5 do
      sample full, start: 0.13, finish: 0.176
      sleep 15
    end
    
    with_fx :reverb , mix: 0.5, amp: 1.5 do
      2.times do
        sample voc, start: 0.01, beat_stretch: 8
        sleep 8
      end
    end
    
  end
end

in_thread do
  ##| stop
  6.times do
    with_fx :reverb, amp: 1.5 do
      sample "/Users/sangarshanan/Downloads/samples/drum_loops/House/bluep/4.wav", beat_stretch: 8
      sleep 8
    end
  end
end

sleep 40

live_loop :bass do
  ##| stop
  1.times do
    with_fx :distortion do
      with_fx :ping_pong do
        sample bass, beat_stretch: 8, finish: 0.5
        sleep 4
        sample bass, beat_stretch: 8, start: 0.5
        sleep 4
        
      end
    end
  end
end

live_loop :sam2, sync: :beat2 do
  ##| stop
  
  s_val = (sample_duration (voc)) / 2
  
  with_fx :reverb do
    
    with_fx :reverb do
      sample voc, start: 0.515, beat_stretch: 8, amp: 1.5
      sleep 4
    end
    
    2.times do
      sample voc, onset: 49, beat_stretch: 8
      sleep 1
    end
    
    2.times do
      sample voc, onset: 53, beat_stretch: 8
      sleep 1
    end
    
    4.times do
      sample voc, onset: 80, beat_stretch: 8
      sleep 1
    end
    
  end
end


beat2 = "/Users/sangarshanan/Downloads/samples/drum_loops/House/bluep/1.wav"
live_loop :beat2, sync: :bass do
  ##| stop
  2.times do
    sample beat2, beat_stretch: 8, amp: 1.5, finish: 0.5
    sleep 4
  end
end

