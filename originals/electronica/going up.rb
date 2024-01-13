use_bpm 100

live_loop :up do
  with_fx :hpf do
    sleep 2
    sample "/Users/sangarshanan/Downloads/samples/going_up.wav", amp: 10
    sleep 2
  end
end

live_loop :mel1 do
  with_fx :band_eq do
    sample "/Users/sangarshanan/Downloads/samples/Indian/kartal1.wav", beat_stretch: 3
    sleep 4
  end
end

live_loop :tabla_loop, sync: :mel1 do
  stop
  use_random_seed 1000
  24.times do
    sample :loop_tabla, onset: pick, release: 0.2, amp: 6
    sleep (knit, 0.25, 8, 0.25, 4, 0.25, 4, 0.25, 2, 0.25, 4, 0.25, 2).tick
  end
end

live_loop :rhythm, sync: :mel1 do
  stop
  with_fx :echo, room: 0.8, decay: 8, phase: 0.25, mix: 0.4 do
    sample :drum_heavy_kick, amp: 0.5
    sample :elec_plip, rate: [0.5, 2, 1, 4].choose * [1, 2, 3, 10].choose, amp: 2
    sleep 1
  end
end

live_loop :bass, sync: :mel1 do
  stop
  use_random_seed 0
  use_synth :fm
  16.times do
    my_bas = ((chord :c2, :m9) + (knit :r, 8)).shuffle.take(8)
    play my_bas.tick, amp: 1.2
    sleep 0.25
  end
end

live_loop :electric, sync: :bass do
  stop
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


live_loop :kick, sync: :mel1 do
  ##| stop
  16.times do |hit|
    sample :bd_klub, hp4:30, amp: 2 if kick[hit] == 1
    sleep 0.25
  end
end

live_loop :Snare, sync: :kick do
  ##| stop
  16.times do |hit|
    sample :sn_dolf, amp:rrand(0.6,1.2) if snare[hit] == 1
    sleep 0.25
  end
end

mar = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Maracas1.wav"

live_loop :hat, sync: :kick do
  ##| stop
  16.times do |hit|
    sample mar, amp: 0.3, pan: rrand(-1,1)
    sample :drum_cymbal_closed,  release:0.3, amp: rrand(0.5, 1), pan: rrand(-1,1) if spread(13,16).tick
    sleep 0.25
  end
end

live_loop :bass_hit, sync: :kick do
  stop
  at [1.5, 2.5, 5.5, 6.5] do
    sample :bass_hit_c
  end
  sleep 8
end

live_loop :noisehat, sync: :kick do
  stop
  use_synth :noise
  play :c4, release: 0.025, cutoff: 110 if spread(5,16).tick
  sleep 0.25
  
  in_thread do
    sleep 7.5
    play :c4, release: 0.025, cutoff: 110 if spread(5,16).tick
    sleep 7.5
  end
end

