use_bpm 125

drums1 = "/Users/sangarshanan/Downloads/samples/ClubTechnoLoops/Drums125.wav"
drums2 = "/Users/sangarshanan/Downloads/samples/ClubTechnoLoops/MicroDrums125.wav"

clap1 = "/Users/sangarshanan/Downloads/samples/ClubTechnoLoops/ElecClap125.wav"

hat1 = "/Users/sangarshanan/Downloads/samples/ClubTechnoLoops/Hat125.wav"
solar1 = "/Users/sangarshanan/Downloads/samples/ClubTechnoLoops/Solar125.wav"
perc1 = "/Users/sangarshanan/Downloads/samples/ClubTechnoLoops/TunedPerc.wav"

# Key Bass D# 125.wav Bass F#.wav
bass1 = "/Users/sangarshanan/Downloads/samples/ClubTechnoLoops/Bass F#.wav"
synth1 = "/Users/sangarshanan/Downloads/samples/ClubTechnoLoops/SynthD#125.wav"


live_loop :drums1 do
  stop
  with_fx :level do
    sample drums1, start: 0.5
    sleep (sample_duration drums1) / 2
  end
end

live_loop :solar1 do
  ##| stop
  with_fx :reverb do
    with_fx :wobble do
      sample solar1, start: 0.25, cutoff: 90
      sleep (sample_duration solar1) * 3 / 4
    end
  end
end

sample "/Users/sangarshanan/Downloads/samples/that means you're gay.wav", amp: 3

live_loop :drums2, sync: :solar1 do
  ##| stop
  with_fx :reverb do
    sample drums2, start: 0.5
    sleep (sample_duration drums2) / 2
  end
end

live_loop :hat1, sync: :drums1 do
  stop
  with_fx :reverb do
    sample hat1, amp: 0.9
    sleep (sample_duration hat1)
  end
end

live_loop :clap1, sync: :drums1 do
  stop
  with_fx :level do
    sample clap1, amp: 0.9
    sleep (sample_duration clap1)
  end
end

live_loop :bass1, sync: :solar1 do
  stop
  with_fx :slicer, mix: 0.2 do
    sample bass1, pitch: 2, amp: 2
    sleep (sample_duration bass1)
  end
end


live_loop :perc1, sync: :solar1 do
  ##| stop
  with_fx [:octaver, :reverb].choose do
    sample perc1, finish: 0.2
    sleep (sample_duration perc1) / 4
  end
end

live_loop :synth, sync: :solar1 do
  stop
  with_fx :autotuner do
    sample synth1
    sleep (sample_duration synth1)
  end
end

live_loop :carnatic_violin, sync: :solar1 do
  stop
  with_fx :pitch_shift do
    
    ##| sample "/Users/sangarshanan/Downloads/samples/Indian/raga-bhimpalasi.wav", start: 0.3
    ##| sleep 100
    
    sample "/Users/sangarshanan/Downloads/samples/Indian/raga-bhimpalasi.wav", start: 0.3, finish: 0.4
    sleep 1
  end
end


