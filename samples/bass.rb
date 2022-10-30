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
