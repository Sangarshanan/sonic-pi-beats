use_bpm 80

# irukku aana illa

with_fx :reverb do
  sample "/Users/sangarshanan/Downloads/samples/Indian/mayil1_sample.wav", beat_stretch: 14
  sleep 14
  with_fx :wobble do
    sample :vinyl_rewind, release: 0.1, amp: 0.5, beat_stretch: 1.5
  end
end

#

mayil1 = "/Users/sangarshanan/Downloads/samples/Indian/mayil1_sample.wav"
live_loop :mel1, delay: 0.3 do
  ##| stop
  with_fx :reverb do
    sample mayil1, beat_stretch: 14, amp: 1
    sleep 14
  end
end

mayil2 = "/Users/sangarshanan/Downloads/samples/Indian/mayil_sam2.wav"
live_loop :mel2, sync: :drum_loop do
  stop
  with_fx :reverb do
    sample mayil2, beat_stretch: 7
    sleep 7
  end
end

drum_loop1 = "/Users/sangarshanan/Downloads/samples/drum_loops/BoomBap/boombap_75.wav"
live_loop :drum_loop do
  ##| stop
  sample drum_loop1, beat_stretch: 14, finish: 0.5, amp: 0.8
  sleep 7
end

mel3 = "/Users/sangarshanan/Downloads/samples/Indian/mayil_sam3.wav"
mel4 = "/Users/sangarshanan/Downloads/samples/Indian/mayil_sam4.wav"

live_loop :mel3, sync: :drum_loop do
  stop
  with_fx :reverb do
    
    ##| 5.times do
    ##|   sample mel3, beat_stretch: 12.5, release: 0.8, amp: 1, start: 0.05, finish: 0.35
    ##|   sleep 3.5
    ##| end
    
    sample mel3, beat_stretch: 12.5, release: 0.8, amp: 1, start: 0.05, finish: 0.35
    sleep 3.5
    
    sample mel3, beat_stretch: 12.5, release: 0.5, amp: 1, start: 0.31, finish: 0.6
    sleep 3.5
    
    if one_in(2)
      sample mel3, beat_stretch: 12.5, release: 0.8, amp: 1, start: 0.56
      sleep 7
    else
      sample mel4, beat_stretch: 12.5, release: 0.8, amp: 1, start: 0.47
      sleep 7
    end
    
  end
end
