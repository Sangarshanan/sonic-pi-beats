use_bpm 100

start = "/Users/sangarshanan/Downloads/samples/Songs/pvm_0.wav"

vocal = "/Users/sangarshanan/Downloads/samples/Songs/PVM.wav"
tune = "/Users/sangarshanan/Downloads/samples/Songs/pvm2.wav"
vocal2 = "/Users/sangarshanan/Downloads/samples/Songs/pvm3.wav"
vocal3 = "/Users/sangarshanan/Downloads/samples/Songs/pvm4.wav"
vocal4 = "/Users/sangarshanan/Downloads/samples/Songs/pvm51_c.wav"


live_loop :start do
  sample start, beat_stretch: 5, amp: 2
  sleep 5
end


live_loop :vocal, sync: :start do
  ##| stop
  
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


live_loop :flute, sync: :vocal do
  stop
  
  with_fx :flanger, mix: 0.5, amp: 1.1 do
    
    sample flute, beat_stretch: 9, finish: 0.44
    sleep 3.75
    
    sample flute, beat_stretch: 9, start: 0.35, finish: 0.5
    sleep 1.25
    
    sample flute, beat_stretch: 9, start: 0.45
    sleep 5
  end
  
end

drum_loop2 = "/Users/sangarshanan/Downloads/samples/drum_loops/lofi/1-70.wav"
live_loop :drumloop2, sync: :start do
  ##| stop
  with_fx :reverb do
    sample drum_loop2, beat_stretch: 10, amp: 5
    sleep 10
  end
end


drum_loop1 = "/Users/sangarshanan/Downloads/samples/drum_loops/lofi/1_75.wav"
live_loop :drumloop1, sync: :start do
  ##| stop
  with_fx :reverb do
    sample drum_loop1, beat_stretch: 20, amp: 5
    sleep 20
  end
end


###

sample1 = "/Users/sangarshanan/Downloads/samples/Songs/pvm_misc1.wav"

live_loop :repeat_loop do
  
  with_fx :reverb, mix: 0.5 do
    
    sample sample1, beat_stretch: 10, finish: 0.265
    sleep 2.5
    sample sample1, beat_stretch: 10, finish: 0.265, rate: -1
    sleep 2.5
   
  end
  
end

live_loop :sample1, sync: :drumloop1 do
  stop
  sample sample1, finish: 0.25, cutoff: 90
  sleep 2.5
end


live_loop :sample2, sync: :sample1 do
  stop
  sleep 2.5
  sample sample1, finish: 0.25, cutoff: 90, rate: 2
end


