# can of wires

use_bpm 120

live_loop :elec do
  ##| stop
  sample :loop_electric, beat_stretch: 10
  sleep 10
end

wood =  [0,1,0,1,0,1,0,1,0,1]

live_loop :wood, sync: :elec do
  ##| stop
  8.times do |hit|
    sample :elec_wood, amp: 2 if wood[hit] == 1
    sleep 1.25
  end
end

snare =  [0,1,0,1,0,1,0,1,0,1]

live_loop :snare_l, sync: :elec do
  ##| stop
  8.times do |hit|
    sample :elec_triangle, amp: 1 if snare[hit] == 1
    sleep 1.25
  end
end

live_loop :aro, sync: :elec do
  ##| stop
  with_fx :bitcrusher, mix: 0.5 do
    sample :loop_breakbeat, beat_stretch: 10, amp: 8
    sleep 10
  end
end

sx = "/Users/sangarshanan/Downloads/samples/Melody/Lofi/loop12.wav"
live_loop :sax_loop, sync: :elec do
  ##| stop
  with_fx [:slicer, :ixi_techno].choose, mix: 0.7 do
    sample sx, beat_stretch: 20
    sleep 20
  end
end
