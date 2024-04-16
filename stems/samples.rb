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
raga = "/Users/sangarshanan/Downloads/samples/Indian/raga-bhimpalasi.wav"
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


# Konnakol
live_loop :up1 do
  with_fx :hpf, amp: 5 do
    sample "/Users/sangarshanan/Downloads/samples/Indian/Konnakkol1.wav", onset: 1
    sleep 1
    sample "/Users/sangarshanan/Downloads/samples/Indian/Konnakkol1.wav", onset: 2
    sleep 1
    sample "/Users/sangarshanan/Downloads/samples/Indian/Konnakkol1.wav", onset: 5
    sleep 1
    sample "/Users/sangarshanan/Downloads/samples/Indian/Konnakkol1.wav", onset: 11
    sleep 1
  end
end

vocal = "/Users/sangarshanan/Downloads/samples/Indian/Konnakkol1.wav"
live_loop :vocal do
  ##| stop
  with_fx :slicer, mix: 0.3 do
    
    ##| sample vocal, beat_stretch: 90, start: 0.40, finish: 0.445, amp: 2
    ##| sleep 1
    
    ##| sample vocal, beat_stretch: 90, start: 0.48, finish: 0.5, amp: 2
    ##| sleep 1
    
    ##| sample vocal, beat_stretch: 90, start: 0.51, finish: 0.52, amp: 2
    ##| sleep 1
    
    sample vocal, beat_stretch: 90, start: 0.48, finish: 0.497, amp: 2
    sleep 1
    
    
  end
end


# Vocal
live_loop :vocal do
  stop
  with_fx [:slicer, :reverb, :octaver].choose, amp: 1.4, mix: 0.4 do
    
    sample "/Users/sangarshanan/Downloads/samples/vocal/female-voice.wav", onset: [16, 5, 6].choose # 16 5
    sleep 2
    
    sample "/Users/sangarshanan/Downloads/samples/vocal/female-voice.wav", onset: [7, 19].choose
    sleep 1
    
    sample "/Users/sangarshanan/Downloads/samples/vocal/female-voice.wav", onset: 8, rate: -1
    sleep 1
  end
end

# Chop
pm = "/Users/sangarshanan/Downloads/samples/songs/pm1.wav"
live_loop :pm_loop do
  ##| stop
  with_fx :reverb, mix: 0.5 do
    
    sample pm, amp: 2, beat_stretch: 120, finish: 0.034
    sleep 4
    sample pm, amp: 2, beat_stretch: 120, start: 0.034, finish: 0.08
    sleep 4
    sample pm, amp: 2, beat_stretch: 120, start: 0.13, finish: 0.21
    sleep 8
    
    
    use_random_seed 5  # 15, 10, 5
    
    # [1,2,3,4,5,6,77]
    # [79, 80, 81, 82, 83, 77].choose sleep 4
    # [89,90,91,92,93,94,95,96,97,98,99,100] sleep 0.5
    # [86, 87, 88, 89].choose sleep 4
    
    ##| sample pm, amp: 2, beat_stretch: 120, finish: 0.034
    ##| sleep 1
    
  end
end


use_bpm 120

pm = "/Users/sangarshanan/Downloads/samples/songs/pm1.wav"
live_loop :pm_loop do
  ##| stop
  with_fx :reverb, mix: 0.4 do
    
    sample pm, amp: 2, beat_stretch: 54, finish: 0.045
    sleep 2.5
    
    sample pm, amp: 2, beat_stretch: 54, start: 0.052, finish: 0.07
    sleep 2.5
    
    sample pm, amp: 2, beat_stretch: 60, start: 0.115, finish: 0.173
    sleep 3.5
    
    sample pm, amp: 2, beat_stretch: 60, start: 0.18, finish: 0.204
    sleep 1.5
    
    
  end
end
