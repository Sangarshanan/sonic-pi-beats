use_bpm 100

live_loop :initial do
  use_synth :pluck
  use_synth_defaults sustain: 2, release: 0.2
  with_fx :lpf do
    pattern = [:g3, :g3, :d4]
    play_pattern_timed(pattern, [0.5, 0.5, 0.5])
    play_pattern_timed(pattern, [0.5, 0.5, 1.5])
  end
end

grid1 = [
  1, 0, 1, 0, 2, 0, 0, 0,
  1, 0, 1, 0, 2, 0, 3, 0
]
tam = "/Users/sangarshanan/Downloads/samples/Lofi/Pack/Tambourine/1.wav"


live_loop :main_drum, sync: :initial, delay: 4  do
  ##| stop
  16.times do |index|
    puts index, grid1[index]
    sample :drum_heavy_kick, amp: 2 if grid1[index] == 1
    sample :drum_snare_soft,  amp: 2 if grid1[index] == 2
    sample tam, amp: 2 if grid1[index] == 3
    sleep 0.25
  end
end

