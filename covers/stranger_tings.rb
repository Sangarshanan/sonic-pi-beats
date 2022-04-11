# Stranger Things: Showtune as seen on Netflix plus Beats

use_bpm 69

tick = 0.25
sound = 0.3
live_loop :beat_1 do
  sample :bd_haus
  sleep 0.5
end

live_loop :beat_2 do
  sample :drum_cymbal_pedal
  sleep 1
end

use_synth :prophet
live_loop :melody do
  play :C4, amp: sound
  sleep tick
  play :E4, amp: sound
  sleep tick
  play :G4, amp: sound
  sleep tick
  play :B4, amp: sound
  sleep tick
  play :C5, amp: sound
  sleep tick
  play :B4, amp: sound
  sleep tick
  play :G4, amp: sound
  sleep tick
  play :E4, amp: sound
  sleep tick
end
