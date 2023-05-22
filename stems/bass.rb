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

