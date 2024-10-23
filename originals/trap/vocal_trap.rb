set_volume! 4

use_bpm 120

vocal = "/Users/sangarshanan/Downloads/samples/Recorded/misc_voice1.wav"

##| sample vocal, start: 0.2, finish: 0.4
##| sleep 12

live_loop :vocal do
  use_random_seed 1234  # 1234 5290 4100 7211
  with_fx :reverb do
    
    with_fx [:slicer, :wobble, :reverb].choose, mix: 0.2, phase: 0.25 do
      8.times do
        sample vocal, onset: rrand(0,100), amp: 2
        sleep 1
      end
    end
  end
end

bass = "/Users/sangarshanan/Downloads/samples/bass/acid.wav"
live_loop :acid, sync: :vocal  do
  stop
  sample bass, beat_stretch: 64, amp: 0.001
  sleep 64
end

drum_loop = "/Users/sangarshanan/Downloads/samples/Lofi/Loops/lofi drum loop (4).wav"
live_loop :dtrap2, sync: :vocal  do
  ##| stop
  sample drum_loop, amp: 5, beat_stretch: 16
  sleep 16
end

trap_loop1 = "/Users/sangarshanan/Downloads/samples/drum_loops/Trap/5.wav"
live_loop :trap_loop1, sync: :acid  do
  stop
  with_fx :reverb do
    sample trap_loop1, amp: 2, beat_stretch: 32
    sleep 32
  end
end
