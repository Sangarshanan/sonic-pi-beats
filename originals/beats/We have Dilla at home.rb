set_volume! 2

use_bpm 150

fv = "/Users/sangarshanan/Downloads/samples/vocal/female-voice.wav"

live_loop :vocal, sync: :kick do
  stop
  
  sample fv, start: 0.5, finish: 0.8
  sleep 8
  
  with_fx :reverb do
    
    sample fv, start: 0.25, finish: 0.5
    sleep 8
  end
  
  ##| with_fx [:ixi_techno, :slicer, :reverb, :octaver].choose, amp: 2, mix: 0.4 do
  
  ##|   sample fv, onset: [7, 19].choose
  ##|   sleep 1
  
  ##|   sample fv, onset: 8, rate: -1
  ##|   sleep 1
  ##| end
  
end

drum_loop = "/Users/sangarshanan/Downloads/samples/Lofi/Loops/lofi drum loop (4).wav"
live_loop :drum_loop, sync: :vocal do
  ##| stop
  sample drum_loop, amp: 2, beat_stretch: 16
  sleep 16
end

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks05.wav"
clap = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Clap05.wav"
hat1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats05.wav"
mar = "/Users/sangarshanan/Downloads/samples/808_drum_kit/percussion/808-Maracas1.wav"

live_loop :kick do
  ##| stop
  use_random_seed 115
  at [0, 4, 4.75, 6, 6.75] do
    ##| sample [:bd_pure, :bass_voxy_hit_c].choose
    sample :bd_pure, amp: 2
    sample kick, amp: 2
  end
  sleep 8
end

live_loop :clap, sync: :kick do
  stop
  at [2, 6] do
    sample clap
  end
  sleep 8
end

live_loop :hat, sync: :kick do
  stop
  sample :drum_cymbal_closed, amp: 0.5
  sleep 1
end

live_loop :bass, sync: :kick do
  stop
  use_synth :fm
  use_random_seed 20
  my_bas = ((chord :c2, :m9) + (knit :r, 8)).shuffle.take(8)
  play my_bas.tick
  sleep 0.5
end

live_loop :guit, sync: :kick do
  with_fx :octaver do
    sample :ambi_choir, beat_stretch: 1, amp: 1.3
    sleep 2
  end
end
