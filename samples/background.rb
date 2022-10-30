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
