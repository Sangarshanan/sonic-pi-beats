use_bpm 80

chord_break = 4

live_loop :initial do
  use_synth :blade
  play [:G3, :Eb3, :Bb3, :Eb4], sustain: chord_break, cutoff: 90
  sleep chord_break
  play [:C3, :Eb3, :G3, :C4], sustain: chord_break, cutoff: 90
  sleep chord_break
  play [:C3, :F3, :Ab3, :F4], sustain: chord_break, cutoff: 90
  sleep chord_break
  play [:D3, :F3, :Bb3, :G4], sustain: chord_break, cutoff: 90
  sleep chord_break
end

mel1 = ring(
  :G5, :Ab5, :G5, :F5, :G5,
  :F5, :Eb5, :F5,
  :G5, :Ab5, :G5, :F5, :G5,
  :F5, :Eb5, :D5, :Eb5
)

t1 = ring(
  2.5, 0.5, 0.5, 0.5, 2.5,
  0.5, 0.5, 0.5,
  2.5, 0.5, 0.5, 0.5, 2.5,
  0.5, 0.5, 0.5, 2.5
)

live_loop :melody do
  sleep 32
  17.times do
    tick(:i)
    use_synth :organ_tonewheel
    with_fx :reverb do
      play mel1.look(:i), sustain: t1.look(:i), amp: 0.2
      sleep t1.look(:i)
    end
  end
  sleep 20
end


grid2 = [1,0,1,0,   2,0,0,1,   1,2,1,0,   2,0,0,0]

define :soul_beat do |grid|
  16.times do |index|
    puts index, grid[index]
    sample :drum_heavy_kick , amp: 0.4 if grid[index] == 1
    sample :drum_snare_soft , amp: 0.4 if grid[index] == 2
    sleep 0.25
  end
end

sleep 16
live_loop :drum1 do
  soul_beat grid2
end


live_loop :hi_hat do
  sample :drum_cymbal_closed, amp: 0.2
  sleep 0.5
end

