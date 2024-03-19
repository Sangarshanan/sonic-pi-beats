use_bpm 110

aaj_ka = "/Users/sangarshanan/Downloads/samples/songs/aaj_ka.wav"

live_loop :aaj_ka  do
  ##| stop
  
  sample aaj_ka, beat_stretch: 8, amp: 20, finish: 0.2
  sleep 4
  
  sample aaj_ka, beat_stretch: 8, amp: 20, start: 0.21, finish: 0.44
  sleep 4
  
  sample aaj_ka, beat_stretch: 8, amp: 20, start: 0.41, finish: 0.7
  sleep 4
  
  2.times do
    sample aaj_ka, beat_stretch: 8, amp: 20, start: 0.71
    sleep 4
  end
  
end

live_loop :aaj_ka2, sync: :hats  do
  stop
  use_random_seed 123 # change to 1234
  8.times do
    sample aaj_ka, beat_stretch: 8, onset: rrand(5,100), amp: 2
    sleep 0.5
  end
end

drum_loop1 = "/Users/sangarshanan/Downloads/samples/drum_loops/lofi/2.wav"
live_loop :drumloop1, sync: :hats do
  ##| stop
  with_fx :reverb do
    sample drum_loop1, amp: 3, beat_stretch: 32
    sleep 32
  end
end

drum_loop2 = "/Users/sangarshanan/Downloads/samples/drum_loops/lofi/3.wav"
live_loop :hats do
  ##| stop
  with_fx :reverb do
    sample drum_loop2, amp: 5, beat_stretch: 8
    sleep 8
  end
end

sample = '/Users/sangarshanan/Downloads/samples/crate1/Sample 04.wav'
live_loop :sample2, sync: :hats do
  ##| stop
  with_fx :level do
    sample sample, amp: 3, beat_stretch: 32, start: 0.8
    sleep 8
  end
end

live_loop :sample3, sync: :hats do
  stop
  with_fx :reverb do
    sleep 8
    sample sample, amp: 3, beat_stretch: 32, start: 0.4, finish: 0.55
    sleep 4
  end
end

live_loop :bass do
  use_synth :fm
  use_random_seed 100
  my_bas = ((chord :c2, :m9) + (knit :r, 8)).shuffle.take(8)
  play my_bas.tick
  sleep 0.5
end

