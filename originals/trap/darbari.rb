use_bpm 120

set_volume! 3

vocal_loop1 = "/Volumes/Roguentropy/Samples/acapella/pookal-pookum.wav"
live_loop :vocal  do
  ##| stop
  
  sample vocal_loop1, beat_stretch: 150, finish: 0.28
  sleep 36
  
  
  4.times do
    
    sample vocal_loop1, beat_stretch: 150, start: 0.213, finish: 0.25
    sleep 4
  end
  
  sample vocal_loop1, beat_stretch: 150, start: 0.15, finish: 0.215
  sleep 8
  
  
  4.times do
    
    sample vocal_loop1, beat_stretch: 150, start: 0.213, finish: 0.25
    sleep 4
  end
  
  
  ##| 2.times do
  ##|   sample vocal_loop1, beat_stretch: 150, start: 0.9
  ##|   sleep 10
  
  ##|   sample vocal_loop1, beat_stretch: 150, start: 0.72, finish: 0.79, rate: 1
  ##|   sleep 10
  ##| end
  
  ##| 4.times do
  ##|   sample vocal_loop1, start: 0.764, finish: 0.78
  ##|   sleep 4
  ##| end
  
end

trap_loop1 = "/Volumes/Roguentropy/Samples/drum_loops/Trap/loop4.wav" # loop3, 4
live_loop :trap_loop1 ,delay: 40 do
  ##| stop
  with_fx :band_eq do #  :bpf :hpf
    with_fx :band_eq do
      sample trap_loop1, beat_stretch: 32
      sleep 32
    end
  end
end

live_loop :bassline, sync: :trap_loop1 do
  stop
  nn = ring(67,69,62,64).tick(:i)
  with_fx :compressor do
    16.times do
      if spread(5,16).tick(:ii)
        synth :fm, note: nn-24, depth: 3, release: 1.5, amp: 0.4
      end
      sleep 0.25
    end
  end
end

