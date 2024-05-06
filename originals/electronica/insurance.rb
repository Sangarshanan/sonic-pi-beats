use_bpm 100
insur = "/Users/sangarshanan/Downloads/samples/vocal/noInsurance.wav"

kat = "/Users/sangarshanan/Downloads/samples/crate1/Sample 07.wav"
live_loop :back, sync: :insur do
  with_fx :flanger do
    with_fx :pan do
      sample kat, beat_stretch: 8
      sleep 8
    end
  end
end


drum_loop1 = "/Users/sangarshanan/Downloads/samples/drum_loops/BoomBap/loop_80bpm.wav"
live_loop :drumloop1, sync: :insur do
  stop
  with_fx :reverb do
    sample drum_loop1, finish: 0.5, amp: 2
    sleep 10
  end
end

live_loop :insur, sync: :perc do
  ##| stop
  with_fx :reverb do
    
    ##| sample insur, finish: 0.05
    
    ##| sleep 5
    
    # First
    
    10.times do
      sample insur, start: 0.009, finish: 0.01
      sleep 0.5
    end
    
    1.times do
      sample insur, start: 0.009, finish: 0.02
      sleep 1
    end
    
    ##| Second
    
    ##| 10.times do
    ##|   sample insur, start: 0.03, finish: 0.033
    ##|   sleep 0.5
    ##| end
    
    ##| 1.times do
    ##|   sample insur, start: 0.03, finish: 0.05
    ##|   sleep 1
    ##| end
    
  end
end

live_loop :perc do
  sample "/Users/sangarshanan/Downloads/samples/Lofi/perc-pack/L.Dre - rolling chair.wav", amp: rrand(0.4, 1), release: rrand(0.6, 0.9)
  sleep [0.5, 1, 0.75, 0.25].choose
end

