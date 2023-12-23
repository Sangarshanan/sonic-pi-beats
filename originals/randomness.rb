use_bpm 80

live_loop :tabla_loop, sync: :rhythm do
  stop
  use_random_seed 1245
  24.times do
    sample :loop_tabla, onset: pick, release: 0.2, amp: 6
    sleep (knit, 0.125, 8, 0.25, 4, 0.25, 4, 0.25, 2, 0.125, 4, 0.25, 2).tick
  end
end

live_loop :rhythm, sync: :perc do
  stop
  with_fx :echo, room: 0.8, decay: 8, phase: 0.25, mix: 0.4 do
    sample :drum_heavy_kick, amp: 0.5
    sample :elec_plip, rate: [0.5, 2, 1, 4].choose * [1, 2, 3, 10].choose, amp: 2
    sleep 1
  end
end

live_loop :perc do
  sample "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Clave3.wav", amp: rrand(0.4, 1), release: rrand(0.6, 0.9)
  sleep [0.5, 1, 0.75, 0.25].choose
end

live_loop :bass do
  ##| stop
  use_random_seed 0
  use_synth :fm
  my_bas = ((chord :c2, :m9) + (knit :r, 8)).shuffle.take(8)
  play my_bas.tick
  sleep 0.25
end

live_loop :mel do
  ##| stop
  use_synth :piano
  rn = Time.now.to_i
  set :rn,rn
  use_random_seed rn
  
  in_thread do
    use_synth :organ_tonewheel
    8.times do
      my_mel = ((scale :c, :major) + (knit :e, 8) + (knit :r, 8)).shuffle.take(8)
      with_fx :echo do
        play my_mel.tick
      end
      sleep 0.25
    end
  end
  
  in_thread do
    4.times do
      use_synth :piano
      with_fx :ping_pong do
        play chord(:c3, "m7"), decay: 3, sustain_level: 0, sustain: 0, release: 0.01, amp: 0.5
        sleep 3
      end
    end
  end
  
  sleep 3
  
end
