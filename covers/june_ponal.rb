use_bpm 100

mel1 = ring(
  :D5, :Cs5, :B4, :A4, :E4, :Fs4,
).repeat(2) + ring(
  :E4, :G4, :B4, :D5, :Cs5
) + ring(
  :D5, :Cs5, :B4, :A4, :E4, :Fs4,
).repeat(2) + ring(
  :G4, :B4, :D5, :E5, :Cs5
)

t1 = ring(
  0.5, 0.5, 0.45, 0.5, 0.5, 1.5
) + ring(
  0.5, 0.5, 0.45, 0.5, 0.5, 0.5
) + ring(
  1, 2, 0.5, 0.5, 3
)

s1 = ring(
  0.5, 0.5, 0, 0, 0.5, 1
).repeat(2) + ring(
  1, 2, 0.5, 0.5, 3
)

mel2 =
  t2 =
  
define :main_mel do
  50.times do
    tick(:i)
    play mel1.look(:i), sustain: s1.look(:i), amp: 1, cutoff: 90
    sleep t1.look(:i)
  end
end

live_loop :melody do
  use_synth :supersaw
  main_mel
end
