use_bpm 100

# From Mungaru Male

guit = "/Users/sangarshanan/Downloads/samples/Indian/Male.wav"
live_loop :guit, sync: :drum_loop  do
  ##| stop
  with_fx :gverb, amp: 0.5 do
    
    
    sample guit, beat_stretch: 111, start: 0.208, finish: 0.267
    sleep 7.5
    
    sample guit, beat_stretch: 111, start: 0.312, finish: 0.36
    sleep 5
    
    ##| sample guit, beat_stretch: 111, start: 0.07, finish: 0.13
    ##| sleep 7.5
    
    
  end
end

drum_loop = "/Users/sangarshanan/Downloads/samples/Lofi/Loops/lofi drum loop (5).wav"
live_loop :drum_loop do
  ##| stop
  sample drum_loop, amp: 3, beat_stretch: 15
  sleep 15
end
