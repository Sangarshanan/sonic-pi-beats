use_bpm 80

grid1 = [1,0,1,0,   2,0,0,1,   1,0,1,0,   2,0,0,0]
grid2 = [1,0,1,0,   2,0,0,1,   1,2,1,0,   2,0,0,0]

define :soul_beat do |grid|
  16.times do |index|
    puts index, grid[index]
    sample :drum_heavy_kick if grid[index] == 1
    sample :drum_snare_soft if grid[index] == 2
    sleep 0.25
  end
end


live_loop :drum1 do
  soul_beat grid1
  soul_beat grid2
end


live_loop :hi_hat do
  sample :drum_cymbal_closed
  sleep 0.5
end


live_loop :piano do
  use_synth :piano
  use_synth_defaults release: 1.5
  # :echo :reverb :slicer
  with_fx :reverb do
    
    play (ring, chord(:c3, :M7), chord(:a3, :m7), chord(:d3, :m7), chord(:g3, :major7)).tick, sustain: 1.25
    
    ##| play (ring, chord(:d4, :major7), chord(:b4, :major7), chord(:g4, :major7), chord(:a4, :maj)).tick, sustain: 1.25
    
    sleep 2
  end
end


live_loop :bassline do
  with_fx :mono, cutoff: 60 do
    use_synth :fm
    use_synth_defaults release: 1.5, amp: 0.5
    play_pattern_timed chord(:c1, :major7), 0.5
    play_pattern_timed chord(:a1, :major7), 0.5
    play_pattern_timed chord(:d1, :major7), 0.5
    play_pattern_timed chord(:g1, :major7), 0.5
  end
end
