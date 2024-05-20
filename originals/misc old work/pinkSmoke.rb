# https://soundcloud.com/rogue-entropy/pinksmoke

use_bpm 120

grid1 = [1,0,2,0,   1,0,2,0,   1,0,2,0,   1,0,2,0]

live_loop :drum do
  16.times do |index|
    puts index, grid1[index]
    sample :drum_heavy_kick, amp: 0.001 if grid1[index] == 1
    sample :drum_splash_hard, rate: 3, amp: 0.001, beat_stretch: 0.5 if grid1[index] == 2
    
    sleep 0.25
  end
end

live_loop :clap do
  sample :perc_till, beat_stretch: 0.5, amp: 0.001
  sleep 2
end


live_loop :br do
  sleep 1
  sample :tabla_na, amp: 0.3
  sample :elec_beep, amp: 0.3
  sleep 1
end


live_loop :bass do
  nn = ring(67,62,60,62,64,67,60,62,67,69,62,64,67,69,62,64).tick(:i)
  16.times do
    if spread(5,16).tick(:ii)
      synth :fm, note: nn-24, depth: 3, release: 1.5, amp: 0.001
    end
    sleep 0.25
  end
end


root_note = 55

live_loop :chords_with_bass do
  tick
  with_fx :reverb, room: 1, release: 4, mix: 0.4 do
    synth :piano, note: chord(ring(root_note,root_note-5,root_note+2,root_note-2).look-0, ring(:major,:major,:minor7,:major7).look, invert:ring(0,2,0,1).look), amp: 0.01, release: 6, hard: 0.3, vel: 0.5
    synth :dsaw, note: ring(root_note,root_note-5,root_note+2,root_note-2).look-24, sustain: 4, detune: 0.3, cutoff: 70, amp: 0.01
    sleep 4
  end
end
