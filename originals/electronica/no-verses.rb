### NO VERSES ###

use_bpm 50

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks05.wav"
snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Snare02.wav"
hat1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats16.wav"

live_loop :lofi_beat, sync: :jazz do
  stop
  sample :loop_amen, beat_stretch: 2, amp: 2, cutoff: 90
  sleep 2
end

kick_snare= [
  1,0,2,1, 0,1,2,0,
  0,1,2,0, 1,0,2,0,
]

live_loop :drum, sync: :jazz do
  stop
  16.times do |index|
    puts index, kick_snare[index]
    sample kick, amp: 1.5 if kick_snare[index] == 1
    sample snare if kick_snare[index] == 2
    sleep 0.25
  end
end

live_loop :hi_hat, sync: :chill do
  stop
  sample hat1
  sleep 0.25
end

live_loop :chill, sync: :jazz do
  stop
  sample :ambi_lunar_land, rate: 0.5, amp: 0.5, beat_stretch: 2
  sample :vinyl_hiss, rate: 0.8, amp: 0.5
  sleep 4
end

jazz = "/Users/sangarshanan/Downloads/samples/Hiphop-Samples/Jazzy.wav"
live_loop :jazz do
  ##| stop
  with_fx :reverb do
    sample jazz, beat_stretch: 8
    sleep 4
  end
end

kat = "/Users/sangarshanan/Downloads/samples/Lofi/LofiJuice/kendrickFmin.wav"
live_loop :jazz2, sync: :jazz do
  stop
  with_fx :level do
    with_fx :pan do
      sample kat, beat_stretch: 15, amp: 0.8
      sleep 10
    end
  end
end

live_loop :bass, sync: :chill do
  stop
  sy1 = :fm
  use_random_seed 80
  
  16.size.times do
    c = chord(:c2, :M7).shuffle.choose
    synth sy1, note: c, sustain: 0.25, release: 0.1, amp: 0.8
    sleep 0.25
  end
end

sample_loop = "/Users/sangarshanan/Downloads/samples/lofi/voiceover/hands behind your head.wav"
live_loop :sample, delay: 15  do
  ##| stop
  with_fx :ixi_techno do
    20.times do
      sample sample_loop, start: 0.5, finish: 0.6, amp: 2
      sleep [0.25, 0.5, 0.75, 1].choose
    end
    2.times do
      sample sample_loop, start: 0.5, amp: 2
      sleep 4
    end
    sleep 8
    20.times do
      sample sample_loop, finish: 0.1, amp: 2
      sleep [0.25, 0.5, 0.75, 1].choose
    end
    2.times do
      sample sample_loop, finish: 0.5, amp: 2
      sleep 4
    end
  end
  sleep 8
end

