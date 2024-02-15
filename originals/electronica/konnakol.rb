use_bpm 190

vocal = "/Users/sangarshanan/Downloads/samples/Indian/Konnakkol1.wav"
live_loop :vocal, sync: :bass do
  stop
  with_fx :slicer, mix: 0.3 do
    sample vocal, beat_stretch: 180, start: 0.40, finish: 0.445, amp: 1.5
    sleep 8
  end
end

live_loop :bass2, sync: :vocal do
  stop
  with_fx :reverb, amp: 2 do
    use_synth :fm
    use_synth_defaults release: 0.2
    play_pattern_timed [45, 43], [0.25]
    play_pattern_timed [40, 40], [1]
    play_pattern_timed [40], [1.75]
    play_pattern_timed [40, 40, 40, 43, 40, 45],
      [0.25, 0.5, 0.5, 0.5, 0.25, 1.75]
  end
end

live_loop :all_fine, sync: :bass do
  stop
  with_fx :reverb do
    sample "/Users/sangarshanan/Downloads/samples/lofi/voiceover/take a chill pill.wav", amp: 0.8
    sleep 8
  end
end

live_loop :bass do
  use_random_seed 100
  at [0, 1.5, 2, 3, 4.5, 5, 6] do
    
    sample :bd_boom, rate: [6,5].choose, amp: 0.6
    
    sample :bass_hit_c

    with_fx :slicer do
      sample :misc_burp, amp: 0.5, rate: [1,-1].choose
    end
    
  end
  sleep 8
end

live_loop :snare, sync: :bass do
  stop
  at [2, 6] do
    sample :perc_impact1, beat_stretch: 0.6
    sample :sn_dolf, amp: 0.8
  end
  sleep 8
end

live_loop :dixi1, sync: :bass do
  stop
  sample :bd_zome, rate: 3
  sleep 1
  sample :bd_mehackit, amp: 0.2
  sleep 1
  sample :bass_voxy_c, amp: 0.1
  sleep 12
end

live_loop :dixi2, sync: :bass, delay: 1 do
  stop
  sample :ambi_lunar_land, rate: 7
  sleep 8
end

live_loop :amen_break, sync: :bass do
  stop
  2.times do
    3.times do
      sample :loop_amen, amp: 1.5, beat_stretch: 4
      sleep 4
    end
  end
end

mar = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Maracas1.wav"
live_loop :hi_hat, sync: :bass do
  stop
  sample mar, amp: 0.6
  sleep 0.5
end
