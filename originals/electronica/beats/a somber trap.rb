use_bpm 120

pm = "/Users/sangarshanan/Downloads/samples/Melody/misc/tr-piano1.wav"
live_loop :pm do
  ##| stop
  with_fx :reverb, mix: 0.5 do
    
    sample pm, beat_stretch: 32, amp: 3
    sleep 32
    
  end
end

live_loop :trap_loop, sync: :pm do
  s = "/Users/sangarshanan/Downloads/samples/drum_loops/Trap/loop1.wav"
  with_fx :band_eq do
    sample s, beat_stretch: 32, amp: 5
    sleep 32
  end
end

live_loop :random_synth, sync: :pm do
  use_synth :tb303
  with_fx :slicer, amp_min: 0.20, amp_max: 0.40 do
    25.times do
      play choose(chord(:c3, :minor)), release: 0.4, cutoff: rrand_i(60, 130)
      sleep 0.5
    end
  end
end

bass = "/Users/sangarshanan/Downloads/samples/bass/house1.wav"
live_loop :bass, sync: :pm do
  ##| stop
  with_fx :reverb, mix: 0.5 do
    sample bass, beat_stretch: 16, amp: 5
    sleep 16
  end
end
