use_bpm 120

vocal_loop1 = "/Volumes/Roguentropy/Samples/acapella/pookal-pookum.wav"
live_loop :vocal  do
  ##| stop
  
  sample vocal_loop1, beat_stretch: 120, finish: 0.28
  sleep 30
  
  
  ##| 4.times do
  
  ##|   sample vocal_loop1, beat_stretch: 120, start: 0.213, finish: 0.25
  ##|   sleep 4
  ##| end
  
  ##| sample vocal_loop1, beat_stretch: 120, start: 0.15, finish: 0.215
  ##| sleep 8
  
  
  ##| 4.times do
  
  ##|   sample vocal_loop1, beat_stretch: 120, start: 0.213, finish: 0.25
  ##|   sleep 4
  ##| end
  
  ##| sample vocal_loop1, beat_stretch: 120, start: 0.901, rate: -1
  ##| sleep 12
  
  ##| 2.times do
  ##|   sample vocal_loop1, beat_stretch: 120, start: 0.9, finish: 0.92, rate: -1
  ##|   sleep 2
  ##| end
  
end

trap_loop1 = "/Volumes/Roguentropy/Samples/drum_loops/Trap/loop4.wav"
live_loop :trap_loop1, delay: 34 do
  stop
  with_fx :reverb do #  :bpf :hpf
    with_fx :band_eq do
      sample trap_loop1, beat_stretch: 32
      sleep 8
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

