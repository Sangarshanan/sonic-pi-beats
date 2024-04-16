use_bpm 150

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks03.wav"
veena = "/Users/sangarshanan/Downloads/samples/Indian/veena1.wav"

live_loop :veena, sync: :hat do
  ##| stop
  use_random_seed 2122 # change to 0, 1002, 2002, 2122
  8.times do
    sample veena, onset: rrand(5,100), amp: 0.7
    sleep 1
  end
end

live_loop :all_fine do
  stop
  a = "/Users/sangarshanan/Downloads/samples/lofi/voiceover/turn up the sound.wav"
  
  use_random_seed 0 # change to 1234
  8.times do
    sample a, beat_stretch: 4, onset: rrand(5,100)
    sleep 1
  end
  
end


drum_loop = "/Users/sangarshanan/Downloads/samples/Lofi/Loops/lofi drum loop (4).wav"
live_loop :dtrap, sync: :veena  do
  ##| stop
  sample drum_loop, amp: 2, beat_stretch: 16
  sleep 16
end


snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Snare05.wav"
hat1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats05.wav"

live_loop :t_kick, sync: :veena do
  ##| stop
  sleep 8
  sample :bd_tek if spread(1,4).look
  sample :bd_tek, pan: rdist(0.25) if spread(11,32).look
end

live_loop :kick, sync: :t_kick do
  stop
  at [0, 1, 2, 4, 4.75, 5, 6, 7] do
    sample kick, amp: 1.5
  end
  sleep 8
end


live_loop :snare, sync: :veena do
  stop
  at [2, 6, 6.23, 7] do
    sample snare, amp: 2
  end
  sleep 8
end


live_loop :hat do
  ##| stop
  use_random_seed 230
  4.times do
    sample :hat_cats, rate: -3
    sleep 1.5
  end
  
  2.times do
    sample :hat_cats, rate: -3
    sleep 1
  end
end
