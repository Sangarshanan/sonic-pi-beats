use_bpm 130
use_synth :bass_foundation


melb = (
  [:cs5] +
  [:ds5] * 7
).ring.repeat(2) +
(
  [:cs5] +
  [:ds5]* 3 +
  [:e5] * 3 +
  [:ds5]
).ring +
(
  [:cs5] +
  [:ds5]* 2 +
  [:e5] * 3 +
  [:ds5]
).ring


tb = (
  [0.5] +
  [0.25, 0.5] * 3 +
  [0.25]
).ring.repeat(2) +
(
  [0.5] +
  [0.25,0.5,0.25] +
  [0.5, 0.25, 0.5] +
  [0.25]
).ring +
(
  [0.5] +
  [0.25,0.5] +
  [0.75, 0.25, 0.5] +
  [0.25]
).ring

live_loop :hook, sync: :amen_break do
  ##| stop
  tick
  with_fx :flanger, room: 80, release: 1.5, mix: 0.2 do
    play melb.look, release: 2, amp: 0.6
    sleep tb.look
  end
end

live_loop :amen_break do
  sample :loop_amen, beat_stretch: 3
  sleep 3
end

