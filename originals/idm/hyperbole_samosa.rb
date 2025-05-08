use_bpm 120

live_loop :met do
  sleep 1
end

bird = "/Volumes/Roguentropy/Samples/recording/bird1.flac"

2.times do
  with_fx :hpf do
    sample bird, start: 0.8, amp: 10
    sleep 8
  end
end

live_loop :fading_bird do
  ##| stop
  with_fx :hpf do
    sample bird, start: 0.8, finish: 0.9, amp: 10
  end
  sleep 2
end


live_loop :ambient_pad, delay: 48 do
  ##| stop
  with_fx :reverb, mix: 0.7, room: 0.8 do
    with_fx :slicer, phase: 8, wave: 1, mix: 0.3 do
      s = synth :hollow, note: :e2, sustain: 8, release: 4, amp: 13
      7.times do
        control s, note: (chord :e3, :minor).choose, amp: rrand(0.5, 0.7)
        sleep 4
      end
    end
  end
end

live_loop :glitches, delay: 24 do
  ##| stop
  hat = [:hat_psych, :mehackit_phone1, :glitch_perc4].choose
  use_sample_defaults sustain: rrand(0, 0.05), finish: 0.02
  dens = [1,1,2,1,4,6].choose
  density dens do
    with_fx :lpf, mix: 0.7 do
      with_fx :panslicer do
        sample hat, beat_stretch: 0.5, amp: 6
        sleep [0.5].choose
      end
    end
  end
end

live_loop :acid_noise, sync: :fading_bird do
  ##| stop
  use_synth :tb303
  use_synth_defaults attack: 4, sustain: 12, release: 4
  4.times do
    with_fx :rbpf, centre: (scale(:e4, :minor_pentatonic, num_octaves: 3).choose), res: 0.95 do
      with_fx :slicer, phase: [0.35, 0.65, 0.85].choose do
        with_fx :slicer, phase: 0.25, pulse_width: 0.8, smooth: 0.1, invert_wave: 1 do
          play :c1, amp: 4
        end
      end
    end
    sleep 1
  end
end

live_loop :bassy_sound_effect, sync: :met do
  ##| stop
  with_fx :ixi_techno, phase: 0.5,res: 0.5,amp: 0.8,mix: 0.8 do
    synth :fm,note: hz_to_midi(70)  ,release: 20
  end
  sleep 16
end


live_loop :glitchy_melody, sync: :ambient_pad do
  stop
  
  amp = 0.6
  with_fx :bitcrusher, bits: 8, sample_rate: 4000 do
    with_fx :echo, phase: 0.25, decay: 2, mix: 0.4 do
      16.times do
        n = (scale :e3, :minor_pentatonic, num_octaves: 2).choose
        synth :beep, note: n, release: 0.1, amp: amp
        sleep [0.25, 0.5].choose
        
        if one_in(4)
          synth :pluck, note: n + 0.3, release: 0.2, amp: amp
        end
        
        sleep 2
        ##| sleep [0.25, 0.5, 0.75].choose
      end
    end
  end
end

live_loop :bass_drum, sync: :ambient_pad do
  stop
  kick = "/Volumes/Roguentropy/Samples/808_drum_kit/kicks/808-Kicks01.wav"
  sample kick, amp: 3
  sleep 1
end

vocal1 = "/Volumes/Roguentropy/Samples/vocal/modi_ai.mp3"
vocal2 = "/Volumes/Roguentropy/Samples/vocal/ai.mp3"

live_loop :vocal, sync: :ambient_pad do
  stop
  
  ##| sleep 100000
  
  with_fx :reverb, amp: 2 do # :reverb :hpf
    sample vocal1, finish: 0.18, beat_stretch: 90
    sleep 15
  end
  
  with_fx :reverb, amp: 3 do # :reverb :hpf
    sample vocal1, start: 0.55, finish: 0.65, beat_stretch: 90
    sleep 7
  end
  
  with_fx :reverb, amp: 3 do # :reverb :hpf
    sample vocal1, start: 0.64, finish: 0.74, beat_stretch: 90
    sleep 7
  end
  
  with_fx :reverb, amp: 3 do # :reverb :hpf
    sample vocal2
    sleep 3
  end
  
end

live_loop :amen_break, sync: :vocal do
  stop
  
  2.times do
    effect = [:bitcrusher, :reverb, :octaver].choose
    p = [0.25, 0.5, 0.125].choose
    with_fx effect, phase: p, wave: 0, mix: rrand(0.4, 1) do
      sample "/Volumes/Roguentropy/samples/drum_loops/dnb/amen_172_pew.wav", beat_stretch: 32, finish: 0.5, amp: 0.8
    end
    sleep 8
  end
  
end


rise1 = "/Volumes/Roguentropy/samples/rises/trickle.wav"
live_loop :rise, sync: :vocal do
  stop
  
  sample rise1, amp: 0.5, beat_stretch: 64
  sleep 64
  
  ##| sample rise1, amp: 0.5, beat_stretch: 64, finish: 0.35
  ##| sleep 60
  
end
