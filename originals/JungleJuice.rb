# Jungle Juice

use_bpm 120

live_loop :closedHiHat do
  pattern = "8---4-6---4---6-".ring
  pattern.length.times do
    sample :sn_zome, amp: (pattern[look].to_f / 9), sustain: 0.2 if (pattern[tick] != "-")
    sleep 4/pattern.length.to_f
  end
end

live_loop :luuppibiitti, sync: :closedHiHat do
  sample :loop_compus, beat_stretch: 8, amp: 2
  sleep 8
end

live_loop :safari, sync: :closedHiHat do
  sample :loop_safari
  sleep 8
end
