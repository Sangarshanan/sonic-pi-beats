# the ripples end

use_bpm 120

hat1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats09.wav"

## CONTROLS ##
rummut = 0
hithat = 0
hi_hat_sleep = 0.5
amen = 0
snap_perc = 0

synth1_play = 1
synth2_play = 0
## CONTROLS ##


live_loop :met do
  sleep 1
end

define :play_times do |chord|
  in_thread do
    play_pattern_timed chord, 0.125, amp: 0.5
  end
end

live_loop :synth1, sync: :met do
  ##| stop
  if synth1_play < 1 then stop end
  use_synth :saw
  use_synth_defaults release: 5, cutoff: 60
  
  key = :f3
  chords = [
    chord(key, :M7),
    chord(key-5, :M7),
    chord(key-3, :M7),
  ]
  with_fx :reverb, mix: 0.5, room: 0.7 do
    with_fx :compressor do
      for chord in chords do
        play_times chord
        sleep 4
      end
    end
  end
end

live_loop :rummut, sync: :met do
  if rummut < 1 then stop end
  sample :bd_tek
  sleep 0.5
  sample :bd_klub, rate: 1.25
  sleep 0.25
  sample :bd_ada
  sleep 0.25
  with_fx :reverb, mix: 0.2, decay: 1 do
    sample :sn_dolf, amp: 1.75
  end
  sleep 0.25
  sample :bd_pure
  sleep 0.75
end

live_loop :hi_hat, sync: :met do
  if hithat < 1 then stop end
  sample hat1, amp: 0.8
  sleep hi_hat_sleep
end

live_loop :snap, sync: :met do
  if snap_perc < 1 then stop end
  with_fx :flanger, mix: 0 do
    sample :perc_snap, amp: rrand(1, 2), rate: rrand(1.9, 2.1), cutoff: rrand(80, 120), pan: rrand(-0.25, 0.25)
  end
  sleep 0.25
end

live_loop :amen_break, sync: :met do
  if amen < 1 then stop end
  
  2.times do
    3.times do
      sample :loop_amen, beat_stretch: 4
      sleep 4
    end
    sample :loop_amen_full, beat_stretch: 16, start: 0.75
    sleep 4
  end
end

live_loop :pico do
  if synth2_play < 1 then stop end
  use_random_seed 1000
  use_synth :dpulse
  notes = [ -2,0,5,7 ].shuffle
  with_fx :reverb, room: 1, mix: 0.9 do
    sleep 1
    play :ds6+notes.tick, release: 0.125, amp: 0.5
    sleep 1
  end
end
