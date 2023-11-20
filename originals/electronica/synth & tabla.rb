# synth & tabla

use_bpm 100

## CONTROLS ##

# Drum
drum = 1
hats = 0

# effect
guit = 0

# melody
synth1 = 1
bassline = 0
synth2 = 0


live_loop :tabla_loop  do
  ##| stop
  with_fx :level, amp: 2 do
    sample :tabla_ghe1
    sleep 0.75
    sample :tabla_re
    sleep 0.25
    sample :tabla_na
    sleep 0.5
    sample :tabla_ghe1
    sleep 0.5
    sample :tabla_ghe1
    sleep 0.75
    sample :tabla_re
    sleep 0.25
    sample :tabla_na_o
    sleep 1
  end
end

live_loop :drums, sync: :tabla_loop do
  if drum < 1 then stop end
  sample :bd_klub, release: 0.2
  sample :bd_boom, amp: 2
  sleep 1
  sample :sn_dub
  sleep 1
  sample :bd_klub, amp: 2
  sleep 1
  sample :sn_dub
  sleep 1
end

live_loop :hats, sync: :drums do
  if hats < 1 then stop end
  8.times do
    sample :drum_cymbal_closed, amp: rand(0.5..0.8), pan: rrand(-0.2, 0.2)
    sleep 0.25
  end
end

live_loop :guit, sync: :drums do
  if guit < 1 then stop end
  with_fx :reverb do
    sample :guit_e_slide, beat_stretch: 5, amp: 0.5
    sleep 0.1
    sample :guit_e_slide, beat_stretch: 5, amp: 0.5
    sleep 7.9
  end
end


rhy = (ring 2.5, 1, 0.5)
chrd = (ring :e, :g, :a, :c)
modd = (ring :minor7, :major7, :major, :maj9)

live_loop :synth, sync: :drums do
  if synth1 < 1 then stop end
  use_synth :bass_foundation
  with_fx :ping_pong, mix: 0.5 do
    
    use_synth_defaults release: 2
    c = chrd.tick
    m = modd.look
    
    in_thread do
      15.times do
        sleep 0.25
        play (chord c+12, m, num_octaves: 2).tick(:b, step: 2), on: (one_in 3), amp: rand(0.15), release: rand(3)
      end
    end
    
    play c-24, amp: 0.3
    2.times do
      play_chord (chord c-12, m)
      sleep 1.5
    end
    
    in_thread do
      4.times do
        play (chord c-24, m).tick(:c), on: (one_in 2), amp: rand(0.4), release: rand(3)
        sleep 0.25
      end
    end
    sleep 0.5
    
    play_chord (chord c-12, m), release: 0.4
    sleep 0.5
  end
end


cont_bass = "/Users/sangarshanan/Downloads/samples/apple/Chill/Contrails Bass.wav"
live_loop :bass, sync: :tabla_loop do
  if bassline < 1 then stop end
  with_fx :reverb do
    sample cont_bass, beat_stretch: 16, amp: 1.5
    sleep 16
  end
end

cont_synth = "/Users/sangarshanan/Downloads/samples/apple/Chill/Contrails Synth.wav"
live_loop :synth2, sync: :tabla_loop do
  if synth2 < 1 then stop end
  with_fx :panslicer, mix: 0.5 do
    sample cont_synth, beat_stretch: 16, amp: 0.3
    sleep 16
  end
end

