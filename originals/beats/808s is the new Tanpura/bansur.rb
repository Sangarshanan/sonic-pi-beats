use_bpm 100

flute = "/Users/sangarshanan/Downloads/samples/Indian/flute1.wav"
live_loop :flute   do
  ##| stop
  with_fx :level do
    sample flute, finish: 0.5, beat_stretch: 19, amp: 0.5
    sleep 9.6
    sample flute, start: 0.5, beat_stretch: 19, amp: 0.5
    sleep 9.6
  end
end

effect = "/Users/sangarshanan/Downloads/samples/Kaytranada/Instrument one-shot/BULLETS.wav"
live_loop :effect, sync: :flute do
  stop
  with_fx :reverb do
    sleep 8.5
    sample effect, amp: 0.8, rate: 1.5, beat_stretch: 6
    sleep 10.7
  end
end

live_loop :flute1, sync: :drum_loop   do
  stop
  with_fx :wobble, mix: 0.9 do
    sample flute, finish: 0.1, beat_stretch: 20
    sleep 2.4
  end
  with_fx :flanger do
    sample flute, start: 0.7, finish: 0.9, beat_stretch: 20, amp: 2
    sleep 2.4
  end
end

drum_loop1 = "/Users/sangarshanan/Downloads/samples/Lofi/Loops/lofi drum loop (1).wav"
live_loop :drum_loop, sync: :flute do
  ##| stop
  sample drum_loop1, finish: 0.5, amp: 2
  sleep (sample_duration drum_loop1)/2
end

