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
use_bpm 50

jazz = "/Users/sangarshanan/Downloads/samples/Hiphop-Samples/Jazzy.wav"
live_loop :jazz do
  ##| stop
  with_fx :ixi_techno do
    sample jazz, finish: 0.5, cutoff: 80
    sleep 5.7
  end
end

kat = "/Users/sangarshanan/Downloads/samples/crate1/Sample 14.wav"
live_loop :jazz do
  with_fx :flanger do
    with_fx :pan do
      sample kat, beat_stretch: 6, start: 0.15, finish: 0.89, amp: 2
      sleep 4.2
    end
  end
end

# high bpm

use_bpm 145
kat = "/Users/sangarshanan/Downloads/samples/crate1/Sample 14.wav"
live_loop :jazz do
  with_fx :reverb do
    with_fx :pan do
      sample kat, beat_stretch: 20, start: 0.15, finish: 0.85, amp: 2
      sleep 14
    end
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

# Im high
imhigh = "/Users/sangarshanan/Downloads/samples/Hiphop-Samples/ImHigh.wav"
live_loop :imhigh do
  ##| stop
  with_fx :reverb do
    sample imhigh, start: 0.5, finish: 0.75
    sleep 3.4
  end
end

# Drum loop
drum_loop = "/Users/sangarshanan/Downloads/samples/Lofi/Loops/lofi drum loop (14).wav"
live_loop :lofi_drum_loop do
  sample drum_loop, finish: 0.5, amp: 0.5
  sleep (sample_duration drum_loop)/2
end


# kat
kat = "/Users/sangarshanan/Downloads/samples/Kaytranada/Samples/Scared To Death.wav"
live_loop :kat do
  with_fx :reverb do
    sample kat, beat_stretch: 8, amp: 3
    sleep 8
  end
end

# Mayilirage chop

live_loop :chop1, sync: :drum_loop do
  ##| stop
  with_fx [:slicer,  :tremolo].choose, sync: :drum_loop, mix: 0.8 do
    sample mayil1, beat_stretch: 20, start: 0.45, finish: 0.8, rate: -1
    sleep 7
  end
end


# NDTV
use_bpm 100
ndtv = "/Users/sangarshanan/Downloads/samples/NDTV.wav"

live_loop :rhythm do
  with_fx :reverb do
    sample ndtv, start: 0.009, finish: 0.1, cutoff: 75
    sleep 5.5
  end
end


