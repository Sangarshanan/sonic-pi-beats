# Melody techniques


# Basic Chords with FX

live_loop :chords_with_fx do
    use_synth :piano
    use_synth_defaults release: 1.5
    # :echo :reverb :slicer
    with_fx :reverb do
      
      play (ring, chord(:c3, :M7), chord(:a3, :m7), chord(:d3, :m7), chord(:g3, :major7)).tick, sustain: 1.25
      
      ##| play (ring, chord(:d4, :major7), chord(:b4, :major7), chord(:g4, :major7), chord(:a4, :maj)).tick, sustain: 1.25

      sleep 2
    end
  end


# Chords with dsaw Bassline

root_note = 55

live_loop :chords_with_bass do
tick
with_fx :reverb, room: 1, release: 4, mix: 0.4 do
    synth :piano, note: chord(ring(root_note,root_note-5,root_note+2,root_note-2).look-0, ring(:major,:major,:minor7,:major7).look, invert:ring(0,2,0,1).look), amp: 0.5, release: 6, hard: 0.3, vel: 0.5
    synth :dsaw, note: ring(root_note,root_note-5,root_note+2,root_note-2).look-24, sustain: 4, detune: 0.3, cutoff: 70
    sleep 4
end
end

# Mod_saw notes

live_loop :synths do
  use_synth :mod_saw
  use_synth_defaults amp: 0.5, attack: 0, sustain: 1, release: 0.25, mod_range: 12, mod_phase: 0.5, mod_invert_wave: 1
  notes = (ring :F, :C, :D, :D, :G, :C, :D, :D)
  notes.each do |n|
    tick
    play note(n, octave: 1), cutoff: (line 90, 130, steps: 16).look
    play note(n, octave: 2), cutoff: (line 90, 130, steps: 32).look
    sleep 1
  end
end


# malfunction

mel1 = ring(57,57,57,57,60,60,60,60)

t1 = ring(0.75,0.75,1,1.5,0.75,0.75,1,1.5)

live_loop :melody do
  use_synth :piano
  tick(:i)
  play mel1.look(:i),sustain: 0.25, amp: 0.0001
  sleep t1.look(:i)
end


# flutey

live_loop :melo do
  tick(:i)
  with_fx :echo, phase: 0.75, decay: 6, mix: 0.9 do
    8.times do
      tick(:ii)
      synth :dtri, note: ring(61,63,56,58,51,52,58,59).look(:ii)+24, amp: 0.2
      sleep ring(0.25,0.5).look(:ii)
    end
  end
end


# chill lofi
define :play_times do |chord|
  in_thread do
    play_pattern_timed chord, 0.125, amp: 0.5
  end
end

live_loop :synth1, sync: :met do
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


# Piano classic melody
use_bpm 120 

p_ns1 = [59, 58, 47, 54, 61]
p_ns2 = [59, 58, 54, 47, 59, 58, 54, 61].ring

live_loop :melody do
  if synth2_play < 1 then stop end
  use_synth :piano
  
  use_random_seed 80
  
  with_fx :reverb, room: 0.5 do
    with_fx :reverb, room: 1 do
      
      ns = (scale :D5, :marva, num_octaves: 1)
      2.times do
        play p_ns1.tick
        sleep [0.5, 1].choose
      end
      4.times do
        play p_ns2.tick + 24
        sleep [0.5, 1].choose
      end
    end
  end
end

# Lofi Pianovy

rhy = (ring 2.5, 1, 0.5)
chrd = (ring :e, :g, :a, :c)
modd = (ring :minor7, :major7, :major, :maj9)

with_fx :ping_pong do
  live_loop :pyanno do
    use_synth :piano
    use_synth_defaults amp: 0.7, release: 2.2
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

# Chords with pitch shift

with_fx :pitch_shift, pitch: -3.9, reps: 2 do
  play chord(:a3, "m11"), decay: 4, sustain_level: 0, sustain: 0, release: 0.01
  play chord(:a3, "m11"), decay: 4, sustain_level: 0, sustain: 0, release: 0.01
  sleep 3
end

