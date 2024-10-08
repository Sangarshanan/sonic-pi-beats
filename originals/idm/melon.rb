use_bpm 150

live_loop :vocal do
  ##| stop
  with_fx [:slicer].choose, mix: 0.4 do
    
    sample "/Volumes/Roguentropy/Samples/memes/sapne.wav", amp: 0.8
    
    sleep 100
    
  end
end

sleep 10

live_loop :arovane_beat do
  ##| stop
  with_fx :bpf do # :reverb :bpf
    
    sample :arovane_beat_d, beat_stretch: 20, finish: 0.5, amp: 1.5
    
    sleep 10
  end
end

live_loop :wobble do
  sleep 10
  with_fx :wobble, phase: 2, cutoff_max: 80, cutoff_min: 20, mix: 0 do
    synth :dsaw, note: 20, release: 10, amp: 0.8
  end
  sleep 10
end

live_loop :chip do
  use_random_seed 12
  r = [2, 4, -1].choose
  8.times do
    sample :bd_chip, rate: r, pan: rrand(-1, 1), amp: 0.8
    sleep 1
  end
end

live_loop :start do
  ##| stop
  with_fx :reverb do
    play :b2 , sustain: 1.7, release: 0.3, note_slide: 2, amp: 0.5 do |s|
      control s, note: :b1
    end
    sleep 10
  end
end

live_loop :flibble do
  use_random_seed 12
  
  with_fx :ixi_techno do
    sample :bd_haus, amp: 2
    sleep 2.5
  end
end



