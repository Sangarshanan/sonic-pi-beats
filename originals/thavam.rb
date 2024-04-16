use_bpm 120

vocal = "/Users/sangarshanan/Downloads/samples/Indian/thavam.wav"

sample vocal, start: 0.4, finish: 0.47, amp: 3, beat_stretch: 95
sleep 6

live_loop :vocal do
  ##| stop
  with_fx :reverb, amp: 3, mix: 0.3 do


    ##|   if a == 9
    ##|     a = 9
    ##|   else
    ##|     a = 8
    ##|   end
    
    ##|   use_random_seed a
    ##|   a+=1
    
    ##|   4.times do
    ##|     sample vocal, beat_stretch: 105, onset: rrand(10,50), amp: 1.5
    ##|     sleep 0.75
    ##|   end
    
    ##| end
    
    sample vocal, start: 0.465, finish: 0.52, beat_stretch: 90
    sleep 5
    
    sample vocal, start: 0.52, finish: 0.6, beat_stretch: 95
    sleep 7
    
    sample vocal, start: 0.6, beat_stretch: 95
    sleep 38
    
    sample vocal, start: 0.4, finish: 0.47, beat_stretch: 95, amp: 1.5
    sleep 6

  end
end


beat = "/Users/sangarshanan/Downloads/samples/drum_loops/dnb/liquid-1.wav"
live_loop :amen_break do
  sample beat, beat_stretch: 24, amp: 3
  sleep 24
end
