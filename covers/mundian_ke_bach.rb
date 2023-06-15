use_bpm 130

melb = (
  [:cs5] +
  [:ds5] * 7
).ring.repeat(3) +
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
).ring.repeat(3) +
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

3.times do
  use_synth :blade
  with_fx :bitcrusher, room: 80, release: 1.5, mix: 0.2 do
    play_pattern_timed [:cs5, :e5, :ds5], 0.5
  end
end
2.times do
  play_pattern_timed [:cs5, :e5, :ds5], 0.5
end

with_fx :wobble do
  sample :vinyl_rewind
end

live_loop :hook, sync: :amen_break do
  ##| stop
  tick
  use_synth :bass_foundation
  with_fx :ixi_techno, room: 80, release: 1.5, mix: 0.2 do
    play melb.look, release: 2, amp: 0.6
    sleep tb.look
  end
end

live_loop :amen_break do
  sample :loop_amen, beat_stretch: 3
  sleep 3
end


