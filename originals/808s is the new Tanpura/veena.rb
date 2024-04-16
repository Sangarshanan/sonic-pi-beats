use_bpm 120

veena = "/Users/sangarshanan/Downloads/samples/Indian/veena1.wav"

live_loop :veena do
  ##| stop
  
  with_fx :reverb do
    
    3.times do
      
      p = [0.25, 0.5, 0.125].choose
      with_fx :reverb, phase: p, wave: 0, mix: rrand(0.4, 1), amp: 1.5 do
        
        
        sample veena, finish: 0.06, rate: 1.8
        sleep 2.5
        
        if one_in 2
          sample veena, start: 0.06, finish: 0.09, rate: 1.8
        else
          sample veena, start: 0.09, finish: 0.12, rate: 1.8, amp: 2
        end
        sleep 1.5
        
        
        
        ##| sample veena, amp: 2, start: 0.6, finish: 0.75, rate: 1.8
        ##| sleep 6
        
        ##| sample veena, amp: 2, start: 0.75, finish: 0.95, rate: 1.8
        ##| sleep 6
        
        
        ##| 2.times do
        ##|   sample veena, amp: 2, start: 0.9, rate: 1.8
        ##|   sleep 2
        ##| end
        
      end
      
      
    end
    
  end
  
  
  ##| use_random_seed 2122 # change to 0, 1002, 1003, 2002, 2122, 4008
  
  ##| 8.times do
  ##|   sample veena, onset: rrand(5,100), amp: 2
  ##|   sleep 1
  ##| end
  
end


vocal = "/Users/sangarshanan/Downloads/samples/melody/Lofi/voi1.wav"
live_loop :vocal2  do
  stop
  with_fx :reverb, amp: 3 do
    
    
    sample vocal, beat_stretch: 32, start: 0.5, finish: 0.9
    sleep 12
    
    
    2.times do
      sample vocal, beat_stretch: 32, rate: -1, start: 0.9
      sleep 2
    end 
  end
end


trap_loop1 = "/Users/sangarshanan/Downloads/samples/drum_loops/Trap/5.wav"
live_loop :trap_loop1, sync: :veena  do
  ##| stop
  with_fx :reverb do
    sample trap_loop1, amp: 3, beat_stretch: 32
    sleep 32
  end
end

bass = "/Users/sangarshanan/Downloads/samples/bass/acid.wav"
live_loop :acid  do
  stop
  sample bass, beat_stretch: 64, amp: 2
  sleep 64
end


drum_loop = "/Users/sangarshanan/Downloads/samples/Lofi/Loops/lofi drum loop (4).wav"
live_loop :dtrap2, sync: :acid  do
  stop
  sample drum_loop, amp: 5, beat_stretch: 16
  sleep 16
end

