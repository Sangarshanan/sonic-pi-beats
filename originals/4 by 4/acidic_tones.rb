use_bpm 146
use_debug false

perc1 = "/Volumes/Roguentropy/Samples/drum_loops/techno/kick.wav"
live_loop :techno_perc, sync: :bass  do
  ##| stop
  with_fx :lpf do
    sample perc1, beat_stretch: 8, amp: 1.5
    sleep 8
  end
end

live_loop :hihat, sync: :techno_perc do
  ##| stop
  with_fx :gverb, dry: 1, release: 0.25, amp: 2 do
    sample :hat_yosh, rate: 12, cutoff: 80
    sleep 0.5
    sample :hat_yosh, rate: 2, cutoff: 100
    sleep 0.5
    sample :hat_yosh, rate: 12, cutoff: 90
    sleep 0.5
    sample :hat_yosh, rate: 2, cutoff: 100
    sleep 0.5
  end
end


live_loop :bass do
  ##| stop
  sleep 0.5
  with_synth :fm do
    play [:d2, :c2, :f2].choose,
      amp: 1,
      attack: 0.15,
      decay: 0.125,
      sustain: 0.1,
      release: 0.1,
      depth: 0.5,
      pitch: 4,
      cutoff: 100
  end
  sleep 0.5
end

live_loop :synth , sync: :bass do
  ##| stop
  synth_co = range(60, 100).mirror
  with_fx :ping_pong, phase: 1 do
    use_random_seed ring(20, 30, 20, 80).tick #200, 300, 200, 600 | 2200, 2300, 2200, 2600 | 20, 30, 20, 80
    1.times do
      with_synth :bass_foundation do
        n1 = (ring :d1, :e2, :e1, :c1, :b2, :g1).shuffle
        n2 = (ring :b1, :c2, :d1).choose
        play n2,
          amp: 0.6,
          release: rrand(0.25, 0.4), #rrand(1.25, 1.4)
          res: 0.8,
          wave: 1,
          pitch: 12,
          cutoff: rrand(60, 100)
        sleep 2
      end # 0.5 2
    end
  end
end

ac = "/Volumes/roguentropy/samples/Melody/elec/acid1.wav"
live_loop :acid1, sync: :synth do
  ##| stop
  with_fx :compressor do
    sample ac, beat_stretch: 16, amp: 3
    sleep 16
  end
end


carnatic_s = "/Volumes/roguentropy/samples/indian/HAMSADWANI.wav"
live_loop :sample, sync: :bass do
  ##| stop
  2.times do
    with_fx :band_eq do
      a = 2 # 2, 8
      2.times do # 8, 32, 2
        sample carnatic_s, onset: a, amp: 0.8, beat_stretch: 60
        sleep 2 # 0.5, 2
        a+=1
      end
    end
  end
end
