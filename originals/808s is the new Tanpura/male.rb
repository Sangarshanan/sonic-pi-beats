use_bpm 100

sarod = "/Users/sangarshanan/Downloads/samples/Indian/Male.wav"
live_loop :sarod  do
  ##| stop
  with_fx :reverb, amp: 0.5 do
    
    sample sarod, beat_stretch: 111, start: 0.07, finish: 0.1
    sleep 3.75
    
    sample sarod, beat_stretch: 104, start: 0.2, finish: 0.17
    sleep 3.75
    
    sample sarod, beat_stretch: 103, start: 0.27, finish: 0.29
    sleep 3.75
    
    ##| with_fx :hpf do
    
    ##|   sample sarod, beat_stretch: 110, start: 0.16, finish: 0.25, rate: -1
    ##|   sleep 7.5
    
    ##| end
    
  end
end



drum_loop = "/Users/sangarshanan/Downloads/samples/Lofi/Loops/lofi drum loop (4).wav"
live_loop :drum_loop do
  ##| stop
  sample drum_loop, amp: 2, beat_stretch: 15
  sleep 15
end
