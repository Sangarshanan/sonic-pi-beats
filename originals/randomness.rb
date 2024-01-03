use_bpm 80

live_loop :tabla_loop, sync: :rhythm do
  ##| stop
  use_random_seed 555
  24.times do
    sample :loop_tabla, onset: pick, release: 0.2, amp: 6
    sleep (knit, 0.125, 8, 0.25, 4, 0.25, 4, 0.25, 2, 0.125, 4, 0.25, 2).tick
  end
end

live_loop :rhythm, sync: :perc do
  ##| stop
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

live_loop :bass, sync: :perc do
  stop
  use_random_seed 0
  use_synth :fm
  my_bas = ((chord :c2, :m9) + (knit :r, 8)).shuffle.take(8)
  play my_bas.tick
  sleep 0.25
end

live_loop :electric, sync: :perc do
  ##| stop
  use_random_seed 1024
  with_fx :slicer do
    24.times do
      sample :loop_electric, onset: pick, release: 0.2, amp: 1.5, cutoff: 90
      sleep (knit, 0.125, 8, 0.25, 4, 0.25, 4, 0.25, 2, 0.125, 4, 0.25, 2).tick
    end
  end
end

kick =  [1,1,0,0,1,0,1,0,1,0,0,0,1,1,1,1]
snare = [0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0]
hat =   [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]


live_loop :kick do
  16.times do |hit|
    sample :bd_klub, hp4:30, amp: 2 if kick[hit] == 1
    sleep 0.25
  end
end

live_loop :Snare, sync: :kick do
  ##| stop
  16.times do |hit|
    sample :sn_dolf, amp:rrand(0.6,0.9) if snare[hit] == 1
    sleep 0.25
  end
end

live_loop :hat, sync: :kick do
  ##| stop
  16.times do |hit|
    sample :drum_cymbal_closed,  release:0.3, amp: rrand(0.05, 0.3), pan: rrand(-1,1) if spread(13,16).tick
    sleep 0.25
  end
end

live_loop :bass_hit, sync: :kick do
  ##| stop
  at [1.5, 2.5, 5.5, 6.5] do
    sample :bass_hit_c
  end
  sleep 8
end

live_loop :noisehat, sync: :kick do
  stop
  use_synth :noise
  play :c4, release: 0.025, cutoff: 110, amp: 0.5 if spread(5,16).tick
  sleep 0.25
  
  in_thread do
    sleep 7.5
    play :c4, release: 0.025, cutoff: 110, amp: 0.5 if spread(5,16).tick
    sleep 7.5
  end
end
