# Just code out the notes
live_loop :bass do
    use_synth :fm
    play :d3, attack: 0, release: 0.25
    sleep 0.25
    play :c3, attack: 0, release: 0.5
    sleep 1
    play :e3
    sleep 0.25
    play :f3
    sleep 0.25
    play :g3
    sleep 0.25
    play :c3, attack: 0, release: 2
    sleep 2
  end


# ring of notes
live_loop :bass do
  nn = ring(67,62,60,62,64,67,60,62,67,69,62,64,67,69,62,64).tick(:i)
  16.times do
    if spread(5,16).tick(:ii)
      synth :fm, note: nn-24, depth: 3, release: 1.5
    end
    sleep 0.25
  end
end

# Randomised Seeds
with_fx :reverb do
  live_loop :vortex do
    use_random_seed rrand(100, 1000)
    use_synth :fm
    notes = (scale :c2, :minor_pentatonic, num_octaves: 1)
    16.times do
      play notes.choose, release: 0.5, amp: 0.5
      sleep 0.25
    end
  end
end

# Scale with different sleeps
live_loop :arp do
  use_synth :fm
  play (scale :g2, :major_pentatonic).tick(:foo), release: 0.1, amp: 0.5
  sleep (ring 0.125, 0.25, 0.4).tick(:bar)
end

# papa roach
live_loop :bass do
  with_fx :slicer, phase: 0.25, wave: 0, mix: 0 do
    with_fx :distortion, distort: 0.999, mix: 0.6, amp: 0.7 do
      tick(:iii)
      ##| synth :dsaw, note: ring(64,67,62,62,62).look(:iii)-24, sustain: knit(2,3,1,2).look(:iii), release: 0, amp: 0.01
      2.times do
        tick(:i)
        gg = ring(0.25,0.5)
        synth :fm, amp: 0.1, note: knit(64,2,62,2,60,2,59,2,62,2).look(:i)-24, release: gg.look(:i)
        sleep 0.25
      end
      tick(:ii)
      sleep knit(1.5,3,0.5,2).look(:ii)
    end
  end
end


# Feel good Inc
melb = ring(
  :ds3, :ds3, :f3, :fs3, :b3, :as3,
  :gs3, :gs3, :b3, :as3, :fs3, :ds3,
)

tb = ring(
  1.5, 0.5, 0.5, 1, 1, 3.5,
  1.5, 0.5, 0.5, 1, 1, 3.5
)


live_loop :bassline, sync: :kick do
  ##| stop
  tick(:i)
  with_synth :fm do
    play melb.look(:i), amp: 0.8, sustain: tb.look(:i) - 0.4
    sleep tb.look(:i)
  end
end


# Wobbly bassline

live_loop :wobbly_bass do
  
  key = :f2
  a = 0.5
  
  keys = [
    key,
    key-5,
  ]
  
  with_fx :reverb do
    use_synth :beep
    for k in keys do
      play k, sustain: 8, amp: a
      sleep 8
    end
  end
end


# Seriously cool bass
live_loop :base do
  sy1 = :fm
  use_random_seed 100
  
  16.size.times do
    c = chord(:b1, :M7).shuffle.choose
    synth sy1, note: c, sustain: 0.25, release: 0.1, amp: 2
    sleep 0.25
  end
end

# Slow Bass
use_bpm 80
base_note = (scale :c1, :minor_pentatonic, num_octaves: 1).shuffle
base_sleep = [0.25, 0.125]
base_amp = 1.2

live_loop :base do
  ##| stop
  use_random_seed 400000 # 400000 3200 3400
  8.times do
    sl = base_sleep.choose
    n = base_note.tick
    
    synth :fm, note: n, amp: base_amp, release: 0, sustain: 0.125
    synth :fm, note: n+12, amp: base_amp-0.3, release: 0, sustain: 0.125
    synth :dsaw, note: n+12, amp: base_amp, release: 0, sustain: 0.125 # :dsaw :subpulse :sine
    sleep sl
  end
end


# Fast Bass

live_loop :bass, sync: :met do
  use_synth_defaults release: 0.1, sustain: 0.125, amp: 1
  n = :c2
  n2 = n
  s = :beep
  s2 = :fm
  
  synth s, note: n
  synth s2, note: n2
  sleep 0.375
  synth s, note: n
  synth s2, note: n2
  sleep 0.125
  synth s, note: n
  synth s2, note: n2
  sleep 0.25
  synth s, note: n
  synth s2, note: n2
  sleep 0.25
  synth s, note: n
  synth s2, note: n2
  sleep 0.25
  synth s, note: n
  synth s2, note: n2
  sleep 0.25
  synth s, note: n
  synth s2, note: n2
  sleep 0.25
  synth s, note: n if [false, true].tick
  sleep 0.25
end


# Techno bass
live_loop :bass do
  with_fx :reverb do
    with_fx :ixi_techno, mix: 0.3 do
      64.times do
        i = tick
        synth :subpulse, amp: 2, release: 0.8, note: get[:chord][0] - 36 if i % 4 == 2
        synth :tb303, amp: 2, release: rand(0.04), note: get[:chord][0] - 36 if i % 4 == 2 or (i % 16 > 12)
        sleep 0.125
      end
    end
  end
end

# arpegio
live_loop :arpegio do
  stop
  depth = [1, 2, 3, 4].ring.mirror.tick(:d)
  with_fx :slicer, phase: 8, wave: 0, pulse_width: 0.75 do
    with_fx :echo, phase: 0.5 + 0.125 / 2, decay: 4 do
      with_fx :echo, phase: 0.125 * 3, decay: 4 do
        32.times do
          synth :fm, note: get[:chord].choose + 12, divisor: 2, depth: depth, release: 0.1 + rand(0.3), amp: 0.5 + rand(0.1)
          sleep 0.125
        end
      end
    end
  end
end


# Deep
live_loop :deep_bass do
  use_synth :bass_foundation
  with_fx :ixi_techno, lpf: 70, amp: 0.2, amp_slide: 6 do |fx|
    control fx, amp: 1
    176.times do
      amps = (ring 1, 0.5, 0.5, 0.5, 0.75, 0.5, 0.5, 0.5)
      play :C2, attack: 0.05, release: 0.4, amp: amps.tick
      sleep 0.25
    end
  end
end

# density
live_loop :density do
  density 4 do
    4.times do
      play [:e4, :c5].choose, release: 0.1
      sleep 1
    end
  end
end


# Acid bass
use_bpm 123

live_loop :bassline do
  ##| stop
  
  use_synth_defaults amp: 2, release: 0.2, sustain: 0.1
  use_synth :tb303
  
  key = [:f1, :g1, :a1].choose
  
  with_fx [:lpf, :ixi_techno, :reverb].choose, cutoff: 75 do
    play key
    sleep 0.375
    play key+12
    sleep 0.375
    play key+7
    sleep 0.375
    play key+10
    sleep 0.375
    play key+5
    sleep 2-0.375*4
  end
end


# beep
live_loop :beep do
  ##| stop
  with_fx :reverb, room: 0.9 do
    with_fx :slicer, phase: 1, wave: 1, mix: 1.0 do
      synth :hoover, note: [:Db4, :G3, :Bb3, :F4].ring.tick, attack: 2, release: 4, amp: 0.5
      sleep 6
    end
  end
end



