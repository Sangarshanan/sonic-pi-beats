#### EXTERNAL SAMPLES ####

# Carnatic violin
live_loop :carnatic_violin, sync: :amen_break do
  stop
  with_fx :slicer do
    sample "/Users/sangarshanan/Downloads/samples/violin-carnatic.wav"
    sleep 8
  end
end

# Raga bhimpalasi
raga = "/Users/sangarshanan/Downloads/samples/raga-bhimpalasi.wav"
live_loop :sam, sync: :kick do
  ##| stop
  with_fx :reverb do
    sample raga, amp: 0.6
    sleep (sample_duration raga) - 0.5
  end
end

# Ya Like Jazz
with_fx :wobble, phase: 1, cutoff_max: 90, mix: 1 do
  sample "/Users/sangarshanan/Downloads/samples/ya_like_jazzz.wav"
end
