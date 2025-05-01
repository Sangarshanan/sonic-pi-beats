use_bpm 160

define :ambient_pad do
  with_fx :reverb, mix: 0.7, room: 0.8 do
    with_fx :slicer, phase: 8, wave: 1, mix: 0.3 do
      s = synth :hollow, note: :e2, sustain: 8, release: 4, amp: 0.7
      7.times do
        control s, note: (chord :e3, :minor).choose, amp: rrand(0.5, 0.7)
        sleep 4
      end
    end
  end
end

define :glitchy_melody do
  with_fx :bitcrusher, bits: 8, sample_rate: 4000 do
    with_fx :echo, phase: 0.25, decay: 2, mix: 0.4 do
      16.times do
        n = (scale :e3, :minor_pentatonic, num_octaves: 2).choose
        synth :beep, note: n, release: 0.1, amp: rrand(0.3, 0.5)
        sleep [0.25, 0.5].choose
        
        if one_in(4)
          synth :pluck, note: n + 0.3, release: 0.2, amp: 0.3
        end
        
        sleep [0.25, 0.5, 0.75].choose
      end
    end
  end
end

define :complex_beat do
  with_fx :compressor, threshold: 0.2, slope_above: 0.1 do
    16.times do
      sample :elec_blip, rate: 2, amp: 0.3 if spread(5, 16).look
      sample :drum_snare_hard, amp: 0.4 if (spread(3, 8).rotate(4)).look
      
      if one_in(6)
        sample :glitch_bass_g, rate: [0.5, 1, 1.5, 2].choose, amp: 0.4
      end
      
      if spread(6, 16).look
        sample :drum_cymbal_closed, rate: rrand(0.8, 1.2), amp: rrand(0.1, 0.3)
      end
      
      sleep 0.25
    end
  end
end


define :acid_bass do
  with_fx :reverb, room: 0.3, mix: 0.2 do
    with_fx :distortion, distort: 0.3 do
      16.times do
        note = (ring :e1, :e1, :g1, :e1, :a1, :e1, :g1, :b1).tick
        
        if one_in(8)
          # Add stutter effect
          4.times do
            synth :tb303, note: note, release: 0.1, cutoff: rrand(70, 90),
              res: 0.9, wave: 0, amp: 0.5
            sleep 0.125
          end
          sleep 0.5
        else
          synth :tb303, note: note, release: 0.2, cutoff: rrand(70, 120),
            res: 0.9, wave: 0, amp: 0.5
          sleep 1
        end
      end
    end
  end
end

define :amen_break do
  with_fx :slicer, phase: 0.25, wave: 0, mix: 0.2 do
    with_fx :echo, phase: 0.75, decay: 4, mix: 0.2 do
      8.times do
        sample :loop_amen, beat_stretch: 4, rate: [1, 1, 1, -1].choose
        sleep 4
      end
    end
  end
end

live_loop :ambient do
  ambient_pad
  sleep 1
end

live_loop :beats, delay: 8 do
  complex_beat
  sleep 1
end

live_loop :glitch, delay: 16 do
  stop
  glitchy_melody
  sleep 1
end

live_loop :bass, delay: 32 do
  stop
  acid_bass
  sleep 1
end

live_loop :reversed, delay: 32 do
  stop
  with_fx :compressor, mix: 0.8 do
    sample :arovane_beat_c, beat_stretch: 16
  end
  sleep 16
end

live_loop :breaks, delay: 64 do
  stop
  amen_break
  sleep 1
end
