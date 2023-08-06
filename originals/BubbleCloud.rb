# BubbleCloud

use_bpm 50

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks05.wav"
snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Snare02.wav"
hat1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats01.wav"

live_loop :lofi_beat do
  sample :loop_amen, beat_stretch: 2, cutoff: 80, amp: 2
  sleep 2
end

kick_snare= [
  1,0,2,1, 0,1,2,0,
  0,1,2,0, 1,0,2,0,
]

live_loop :drum do
  16.times do |index|
    puts index, kick_snare[index]
    sample kick, amp: 1.5 if kick_snare[index] == 1
    sample snare if kick_snare[index] == 2
    sleep 0.25
  end
end

live_loop :hi_hat do
  sample hat1
  sleep 0.25
end

live_loop :chill do
  sample :ambi_lunar_land, rate: 0.5, amp: 0.5, beat_stretch: 2
  sample :vinyl_hiss, rate: 0.8, amp: 0.5
  sleep 4
end

live_loop :melody do
  use_random_seed [1000, 555].tick("mero")
  rhythm = [
    1.5, 0.25, 1.5, 0.25, 0.25, 2,
    0.5, 0.5, 0.25, 1
  ]
  with_fx :reverb, amp: 0.5 do
    use_synth :blade
    
    rhythm.each do |r|
      play chord(:ab4,:m7,invert: 2).choose, release: r+0.5
      sleep r
    end
  end
  sleep 8-rhythm.sum
end

live_loop :base do
  sy1 = :fm
  use_random_seed 100
  
  16.size.times do
    c = chord(:c2, :M7).shuffle.choose
    synth sy1, note: c, sustain: 0.25, release: 0.1, amp: 2
    sleep 0.25
  end
end
