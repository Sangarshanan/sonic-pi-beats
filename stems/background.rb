## Dark

live_loop :dark_background do
    use_synth :dark_ambience
    play_pattern_timed scale(:e3, :major_pentatonic), 5
  end

## Choir

with_fx :reverb do
  in_thread do
    loop do
      r = [0.5, 0.75, 1].choose
      8.times do
        sample :ambi_choir, rate: r, pan: rrand(-1, 1)
        sleep 0.5
      end
    end
  end
end

# Play around with rates
live_loop :beats do
  sample :guit_em9, rate: [0.25, 0.5, -1].choose, amp: 2
  sleep 8
end

live_loop :beats do
  sample :glitch_perc1, rate: [0.25, 0.5, -1].choose, amp: 0.5
  sleep 2
end

# Random rate piano
live_loop :piano, auto_cue: false do
  with_fx :slicer, phase: 0.25, wave: 1 do
    sample :ambi_piano, amp: 2, rate: [1,-1,2,1.5].choose
    sleep 2
  end
end

# Fx sound effects
with_fx :wobble, phase: 2, cutoff_max: 80, cutoff_min: 20, mix: 0 do
  synth :dsaw, note: 20, release: 10, amp: 0.2
end

# Hollow
live_loop :hollow do
  invert=  [0, 1, 2].choose
  synth :hollow, note: chord_invert(chord(:b2, :M7), invert), sustain: 3, release: 3, amp: 4
  sleep 3
end