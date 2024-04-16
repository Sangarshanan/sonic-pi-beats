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

choir = "/Users/sangarshanan/Downloads/samples/vocal/gospel-choir.wav"
live_loop :sz_loop, sync: :aro do
  
  use_random_seed 10
  with_fx :reverb, mix: 0.5 do
    
    
    [1,2].choose.times do
      
      sample choir, start: 0.5, finish: 0.65
      sleep 2.5
      
      sample choir, finish: 0.15
      sleep 2.5
    end
    
    sample choir, start: 0.5, finish: 0.65
    sleep 2.5
    
    
    [2,3].choose.times do
      
      sample choir, finish: 0.15
      sleep 2.5
      
      sample choir, start: 0.2, finish: 0.35
      sleep 2.5
    end
    
  end
end

