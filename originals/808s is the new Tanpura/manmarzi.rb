use_bpm 120

vocal = "/Users/sangarshanan/Downloads/samples/songs/man-marzi.wav"
live_loop :vocal do
  ##| stop
  
  ##| with_fx :reverb do
  
  ##|   sample vocal, beat_stretch: 120, finish: 0.04
  ##|   sleep 4
  
  ##|   with_fx :slicer do
  ##|     sample vocal, beat_stretch: 120, start: 0.04, finish: 0.07
  ##|     sleep 4
  ##|   end
  
  ##|   sample vocal, beat_stretch: 120, start: 0.07, finish: 0.112
  ##|   sleep 4
  
  ##|   with_fx :slicer, mix: 0.7 do
  ##|     sample vocal, beat_stretch: 120, start: 0.11, finish: 0.13
  ##|     sleep 4
  ##|   end
  
  
  ##|   with_fx :reverb do
  ##|     sample vocal, beat_stretch: 120, start: 0.13, finish: 0.2
  ##|     sleep 8
  ##|   end
  
  ##|   2.times do
  
  ##|     with_fx :slicer, mix: rrand(0.4, 1) do
  ##|       sample vocal, beat_stretch: 120, start: 0.2, finish: 0.28
  ##|       sleep 8
  ##|     end
  ##|   end
  
  3.times do
    
    sample vocal, beat_stretch: 120, start: 0.21, finish: 0.235
    sleep 4
    
    2.times do
      sample vocal, beat_stretch: 120, start: 0.25, finish: 0.26
      sleep 2
    end
  end
  
end

live_loop :synth, sync: :vocal do
  #stop
  ptn = (ring [:gs6,:ds6],[:e6,:b6],[:cs6,:fs6],[:e6,:b6],[:cs6,:as6],:r,:r,:r) +
    (ring :r,:r,:r,:r,:r,:r,:r,:r) +
    (ring [:gs6,:ds6],[:e6,:b6],[:cs6,:fs6],[:e6,:b6],[:b6,:cs6],:r,:r,:r) +
    (ring :r,:r,:r,:r,:r,:r,:r,:r)
  rel = (ring 2,2,2,2,18,0,0,0)
  use_synth :blade
  use_synth_defaults amp: 0.5, attack: 0.25, vibrato_depth: 0.25
  with_fx :sound_out_stereo, output: 5 do
    play ptn.tick, release: rel.look
    with_fx :pitch_shift, pitch: -12 do
      play ptn.look, release: rel.look, amp: 0.25
    end
  end
  sleep 2
end


base_note = (scale :c1, :minor_pentatonic, num_octaves: 1).shuffle
base_sleep = [1, 0.5]
live_loop :base, sync: :vocal do
  ##| stop
  use_random_seed 3200 # 400000 3200 3400
  8.times do
    sl = base_sleep.choose
    n = base_note.tick
    
    synth :fm, note: n, amp: 1, release: 0, sustain: 0.125
    synth :sc808_claves, note: n+12, amp: 1-0.3, release: 0, sustain: 0.125
    synth :dsaw, note: n+12, amp: 1, release: 0, sustain: 0.125 # :dsaw :subpulse :sine
    sleep sl
  end
end


trap_loop1 = "/Users/sangarshanan/Downloads/samples/drum_loops/Trap/dark08.wav"
live_loop :trap_loop1  do
  ##| stop
  with_fx :reverb do
    sample trap_loop1, beat_stretch: 32, finish: 0.5, amp: 0.8
    sleep 16
  end
end

