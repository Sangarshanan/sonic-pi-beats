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
live_loop :sam, sync: :kick   do
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


# womaniya
womaniya = "/Users/sangarshanan/Downloads/samples/OWomaniya.wav"
live_loop :womaniya do
  sample womaniya, amp: 0.8, rate: -1
  sleep 3.7
end

# Epic
live_loop :sample2 do
  with_fx :level do
    sample '/Users/sangarshanan/Downloads/samples/crate1/Sample 10.wav', rate: -1, cutoff: 80
    sleep 23
  end
end


# Hip Hop
use_bpm 100
drum_loop1 = "/Users/sangarshanan/Downloads/samples/drumkit2/Spacious Loft 94 bpm.wav"
live_loop :drumloop1 do
  with_fx :reverb do
    sample drum_loop1, finish: 0.57
    sleep 8.5
  end
end

# Jazzy
jazz = "/Users/sangarshanan/Downloads/samples/Hiphop-Samples/Jazzy.wav"
live_loop :jazz do
  ##| stop
  with_fx :ixi_techno do
    sample jazz, finish: 0.5, cutoff: 80
    sleep 5.7
  end
end

# Voice (Police)

sample_loop = "/Users/sangarshanan/Downloads/samples/lofi/voiceover/hands behind your head.wav"
live_loop :sample   do
  with_fx :ixi_techno do
    10.times do
      sample sample_loop, start: 0.5, finish: 0.6, amp: 0.5
      sleep [0.25, 0.5, 0.75, 1].choose
    end
    2.times do
      sample sample_loop, start: 0.5, amp: 0.5
      sleep 4
    end
    sleep 3
    10.times do
      sample sample_loop, finish: 0.2, amp: 0.5
      sleep [0.25, 0.5, 0.75, 1].choose
    end
    2.times do
      sample sample_loop, finish: 0.5, amp: 0.5
      sleep 4
    end
  end
  sleep 20
end
