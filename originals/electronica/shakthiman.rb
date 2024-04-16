use_bpm 120


full = "/Users/sangarshanan/Downloads/samples/shaktimaan/shaktimaan_vocal.wav"
voc = "/Users/sangarshanan/Downloads/samples/shaktimaan/vloop0.wav"
bass = "/Users/sangarshanan/Downloads/samples/shaktimaan/vbass0.wav"

in_thread do
  1.times do
    sample full, start: 0.103, finish: 0.13
    sleep 9
    with_fx :slicer , mix: 0.3 do
      sample full, start: 0.13, finish: 0.17
      sleep 12
    end
    
    sample voc
    sleep 8
  end
end

live_loop :drum1 do
  with_fx :reverb, amp: 0.8 do
    sample "/Users/sangarshanan/Downloads/samples/drum_loops/House/bluep/4.wav", beat_stretch: 8
    sleep 8
  end
end

sleep 28

live_loop :bass  do
  ##| stop
  with_fx :ping_pong do
    with_fx :octaver do
      sample bass, beat_stretch: 8
      sleep 8
    end
  end
end

live_loop :sam2 do
  ##| stop
  
  s_val = (sample_duration (voc)) / 2
  
  with_fx :reverb do
    
    ##| with_fx :ping_pong do
    ##|   sample voc, start: 0.5, beat_stretch: 8, amp: 1.5
    ##|   sleep 4
    ##| end
    
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
live_loop :beat2, sync: :sam2 do
  ##| stop
  sample beat2, beat_stretch: 8, amp: 1.5, finish: 0.5
  sleep 4
end

