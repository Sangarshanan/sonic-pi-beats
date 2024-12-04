use_bpm 100

start = "/Volumes/Roguentropy/Samples/Songs/pvm_0.wav"
vocal = "/Volumes/Roguentropy/Samples/Songs/PVM.wav"
tune = "/Volumes/Roguentropy/Samples/Songs/pvm2.wav"
vocal2 = "/Volumes/Roguentropy/Samples/Songs/pvm3.wav"
vocal3 = "/Volumes/Roguentropy/Samples/Songs/pvm4.wav"
vocal4 = "/Volumes/Roguentropy/Samples/Songs/pvm51_c.wav"


live_loop :start do
  sample start, beat_stretch: 5, amp: 2
  sleep 5
end


live_loop :vocal, sync: :start do
  stop
  
  with_fx :reverb, mix: 0.6 do
    sample vocal, start: 0.05, beat_stretch: 10, rate: 1, amp: 2
    sleep 10
  end
  
  
  with_fx :reverb, mix: 0.7, amp: 2 do
    sample tune, rate: 1, start: 0.08, finish: 0.88
    sleep 5
    2.times do
      sample tune, rate: 1, start: 0.7
      sleep 2.5
    end
  end
  
  with_fx :reverb, mix: 0.5, amp: 2 do
    sample vocal2, beat_stretch: 15, rate: 1, finish: 0.63
    sleep 10
    
    1.times do
      
      sample vocal2, rate: 1, start: 0.63, finish: 0.85
      sleep 2.5
      
      sample vocal2, rate: 1, start: 0.8
      sleep 2.5
      
      use_random_seed 1
      3.times do
        sample vocal2, rate: 1, start: 0.63, finish: 0.65
        sleep [1.25, 2.5].choose
      end
    end
  end
  
  
  with_fx :reverb, mix: 0.5 do
    
    sample vocal3, amp: 2, finish: 0.35, beat_stretch: 10
    sleep 4
    
    sample vocal3, amp: 2, start: 0.4, finish: 0.8
    sleep 4
    
    sleep 2
    
    2.times do
      tick
      rate = ring(1,1.1)
      puts rate.look
      
      2.times do
        sample vocal3, amp: 5, start: 0.6, finish: 0.667, rate: rate.look
        sleep 0.5
      end
      
      sample vocal3, amp: 5, start: 0.6, finish: 0.67, rate: rate.look
      sleep 0.7
      
      
      sample vocal3, amp: 3, start: 0.67, finish: 0.81
      sleep 3.3
      
    end
    
  end
  
end

flute = "/Volumes/Roguentropy/Samples/Songs/pvm_loop1.wav"
live_loop :flute, sync: :start do
  ##| stop
  
  with_fx :lpf, mix: 0.5, amp: 1.2 do
    
    ##| with_fx :lpf, mix: 0.9 do
    ##|   sample flute, beat_stretch: 22, start: 0.55, finish: 0.72
    ##|   sleep 5
    ##| end
    
    sample flute, beat_stretch: 22, start: 0.32, finish: 0.43
    sleep 5
    
    ##| sample flute, beat_stretch: 22, start: 0.43, finish: 0.54
    ##| sleep 5
    
    ##| sample flute, beat_stretch: 22, start: 0.32, finish: 0.43
    ##| sleep 5
    
    ##| sample flute, beat_stretch: 22, start: 0.77, finish: 0.89
    ##| sleep 5
    
  end
  
end

drum_loop2 = "/Volumes/Roguentropy/Samples/drum_loops/lofi/1-70.wav"
live_loop :drumloop2, sync: :start do
  ##| stop
  with_fx :reverb do
    sample drum_loop2, beat_stretch: 10, amp: 5
    sleep 10
  end
end


drum_loop1 = "/Volumes/Roguentropy/Samples/drum_loops/lofi/1_75.wav"
live_loop :drumloop1, sync: :start do
  stop
  with_fx :reverb do
    sample drum_loop1, beat_stretch: 20, amp: 5
    sleep 20
  end
end


###

sample1 = "/Volumes/Roguentropy/Samples/Songs/pvm_misc1.wav"

live_loop :repeat_loop, sync: :start do
  stop
  with_fx :reverb, mix: 0.5 do
    
    sample sample1, beat_stretch: 10, finish: 0.2
    sleep 2.5
    
    ##| sample sample1, beat_stretch: 10, finish: 0.265, rate: -1
    ##| sleep 2.5
    
  end
  
end

