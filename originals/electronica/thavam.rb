set_volume! 2

# Liquid D&B

use_bpm 120

vocal = "/Users/sangarshanan/Downloads/samples/Indian/thavam.wav"

live_loop :vocal do
  stop
  with_fx :reverb, amp: 3, mix: 0.3 do
    
    a = 8
    2.times do
      
      sample vocal, start: 0.4, finish: 0.47, beat_stretch: 95, amp: 1.5
      sleep 6
      
      if a == 9
        a = 9
      else
        a = 8
      end
      
      use_random_seed a
      a+=1
      
      
      4.times do
        sample vocal, beat_stretch: 95, onset: rrand(5,50), amp: 1.5
        sleep 0.75
      end
      
    end
    
    
    sample vocal, start: 0.65, beat_stretch: 95
    sleep 38
    
  end
end


beat = "/Users/sangarshanan/Downloads/samples/drum_loops/dnb/liquid-1.wav"
live_loop :amen_break do
  sample beat, beat_stretch: 24, amp: 3
  sleep 24
  
end

bass1 = "/Users/sangarshanan/Downloads/samples/bass/atonal.wav"
live_loop :bss_loop do
  ##| stop
  sample bass1, beat_stretch: 12, amp: 1
  sleep 12
end
